## Node.js에서의 모듈의 로드
모듈을 로드하는 방법은 호스트 환경(nods.js, google 스프레트시트, 웹브라우저)에 따라서 달라진다. Node.js 에서는 아래와 같은 방법으로 모듈을 로드한다.

node.circle.js(로드될 대상) - 읽음을 당하는 쪽
var PI = Math.PI;

exports.area = =function (r) {
    return PI * r * r;
};

exports.circumference = function(r) {
    return 2 * PI * r;
};

node.demo.js(로드의 주체) - 읽는 쪽
var circle = require('./node.circle.js');
console.log('The area of a circle of radius 4 is 50' + circle.area(4));
