##argument
함수에는 arguments라는 변수에 숨겨진 유사 배열이 있다. 이 배열에는 함수를 호출할 때 입력한 인자가 담겨있다.
매개변수, parameter 라고 불리운다.
자바스크립트는 관대한 언어이기 때문에 매개변수의 수와 인자가 다르다 하더라도 문제가 없다. 에러발생시키지 않음.

function sum() {
    var _sum = 0; //_
    for(i = 0; arguments.length; i++) {
        document.write(i + : + arguments[i] + '<br />');
        _sum += arguments[i]; //_
    }
    return _sum; //_
}

document.write('result : ' + sum(1,2,3,4));

##매개변수의 수
매개변수와 관련된 두가지 수가 있다. 하나는 함수.length, 다른 하나는 arguments.length이다. 함수.length는 함수로 전달된 실제 인자의 수를 의미하고,
arguments.length는 함수에 정의된 인자의 수를 의미한다.
