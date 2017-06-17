#
# This is an example VCL file for Varnish.
#
# It does not do anything by default, delegating control to the
# builtin VCL. The builtin VCL is called when there is no explicit
# return statement.
#
# See the VCL chapters in the Users Guide at https://www.varnish-cache.org/docs/
# and http://varnish-cache.org/trac/wiki/VCLExamples for more examples.

# Marker to tell the VCL compiler that this VCL has been adapted to the
# new 4.0 format.
vcl 4.0;
import std;
import directors;

include "backend.vcl";
include "purgeip.vcl";
include "fttip.vcl";

sub vcl_recv {
  set req.backend_hint = v_udw_v2.backend();
  # Happens before we check if we have this in cache already.
  #
  # Typically you clean up the request here, removing cookies you don't need,
  # rewriting the request, etc.

  # checking whether the LB is Proxy mode
  if ( req.http.X-ClientIP && req.http.X-ClientIP != "" ) {
    set req.http.X-RECOGNIZED-IP = req.http.X-ClientIP;
    set req.http.X-Forwarded-For = req.http.X-ClientIP;
  } else if ( req.http.X-Forwarded-For && req.http.X-Forwarded-For != "" ) {
    set req.http.X-RECOGNIZED-IP = regsub(req.http.X-Forwarded-For, "[, ].*$", ""); # just define a variable
  } else {
    set req.http.X-RECOGNIZED-IP = client.ip;
    set req.http.X-Forwarded-For = client.ip;
  }

  set req.http.X-ClientIP = req.http.X-RECOGNIZED-IP ;

  if ( req.method == "PURGE" ) {
    if (!std.ip(req.http.X-RECOGNIZED-IP, "0.0.0.0") ~ purge_allow_ip) {
      return (synth(405, "This IP " + req.http.X-RECOGNIZED-IP + " is not allowed to send PURGE requests."));
    }

    if (req.http.X-Purge-URL == "" || !req.http.X-Purge-URL) {
      return (synth(405, "There is no purge url header"));
    }

    #return (purge); # only requested url
    #ban("req.url ~  ^/"); # all

    ban("req.url ~  ^" + req.http.X-Purge-URL); # url base exclude paramters
    return (synth(200, "PURGE OK " + req.http.X-Purge-URL));
  }

  # only allowed get and head method
  if ( req.method != "GET" && req.method != "HEAD" ) {
    return( pipe );
  }

  # checking white ip list
  if (std.ip(req.http.X-RECOGNIZED-IP, "0.0.0.0") ~ fttnet) {
