## HTMLCollection
리턴 결과가 복수인 경우에 사용하게 되는 객체다. 유사배열로 배열과 비슷한 사용방법을 가지고 있지만 배열은 아니다.

console.group('before');
var lis = document.getElementsByTagName('li');
for(var i = 0; i < lis.length; i++) {
  console.log(lis[i]);
}
console.groupEnd();
console.group('after');
list[1].parentNode.removeChild(lis[1]);
for(var i =0; i < lis.length; i++) {
  console.log(lis[i]);
}
