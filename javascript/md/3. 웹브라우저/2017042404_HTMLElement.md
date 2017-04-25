## HTMLElement
getElement* 메소드를 통해서 원하는 객체를 조회했다면 이 객체들을 대상으로 구체적인 작업을 처리해야 한다.
획득한 객체 무엇인지 알아야 적절한 메소드나 프로퍼티를 쓸 수 있다.

<script>
  var li = document.getElementById('active');
  console.log(li.constructor.name); //HTMLElement, 단수
  var lis = document.getElementsByTagName('li');
  console.log(lis.constructor.name); //HTMLCOLLECTION, 복수, 유사배열
</script>

## DOM project 단서 수집
- 각각 element 종류에 따라서 return 되는 객체가 다르다.

<script>
  var target = document.getElementById('list');
  console.log(target.constructor.name); //HTMLLIElement

  var target = document.getElementById('anchor');
  console.log(target.constructor.name); //HTMLAnchorElement

  var target = document.getElementById('button');
  console.log(target.constructor.name); //HTMLInputElement
</script>

interface HTMLLIElement : HTMLElement {
  attribute DOMString type;
  attribute long value;
}

interface HTMLAnchorElement : HTMLElement {
  attribute DOMString accessKey;
  ....
}

## DOM Tree
모든 엘리먼트는 HTMLElement의 자식이다. 따라서 HTMLElement의 프로퍼티를 똑같이 가지고 있다.
동시에 엘리먼트의 성격에 따라서 자신만의 프로퍼티를 가지고 있는데 이것은 엘리먼트의 성격에 따라서 달라진다.
HTMLElement는 Element의 자식이고 Element는 Node의 자식이다. Node는 Object의 자식이다. 이러한 관계를 DOM Tree라고한다.
