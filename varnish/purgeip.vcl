# Default backend definition. Set this to point to your content server.
backend udw_v2 {
    .host = "qa-cp01.fttinc.kr";
    .port = "10030";
    .connect_timeout = 1s;
    .first_byte_timeout = 5s;
    .between_bytes_timeout = 2s;
}

backend notice {
    .host = "qa-cp03.fttinc.kr";
    .port = "10015";
    .connect_timeout = 1s;
    .first_byte_timeout = 5s;
    .between_bytes_timeout = 2s;
}

backend endingpopup {
    .host = "qa-cp03.fttinc.kr";
    .port = "10005";
    .connect_timeout = 1s;
    .first_byte_timeout = 5s;
    .between_bytes_timeout = 2s;
}


backend notice_ext {
    .host = "ts-gse.four33.co.kr";
    .port = "10025";
    .connect_timeout = 1s;
    .first_byte_timeout = 5s;
    .between_bytes_timeout = 2s;
}

sub vcl_init {
  new v_udw_v2 = directors.round_robin();
  v_udw_v2.add_backend(udw_v2);
  new v_notice = directors.round_robin();
  v_notice.add_backend(notice);
  new v_endingpopup = directors.round_robin();
  v_endingpopup.add_backend(endingpopup);
  new v_notice_ext = directors.round_robin();
  v_notice_ext.add_backend(notice_ext);
}
