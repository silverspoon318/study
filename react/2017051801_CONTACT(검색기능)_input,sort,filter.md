## sort()
표현식 : arr.sort([compareFunction])
compareFunction을 optional 함수이다. 비어 있으면 배열이 유니코드를 비교하여 오름차순으로 정렬이 된다.
기존배열을 변경한다.

function compare(a, b) {
    if (a is less than b by some ordering criterion) {
        return -1;
    }


    if (a is greeter than b by the ordering criterion) {
        return 1;
    }

    //a must be equal b
    return 0;
}

var numbers = [4,2,5,1,3];
numbers.sort(function(a, b){
    return a - b;
});
console.log(numbers);
//[1,2,3,4,5] 오름 차순

function(a, b){
    return (a - b) * -1;
}

## filter()
제공된 함수로 구현된 테스트를 통과하는 모든 요소가 있는 새로운 배열을 만듭니다.
표현식 : var new_array = arr.filter(callback[, thisArg])

callback - 배열의 각 요소를 테스트하는 함수, 인수(element, index, array)와 함께 호출됨.
           요소를 (새 배열에) 계속 두기 위해 true를 반환, 그렇지 않으면 false.
thisArg - 선택사항. callback을 실행할 때 this로 사용하는 값.
