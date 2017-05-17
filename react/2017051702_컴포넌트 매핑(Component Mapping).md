## mpa() 메소드
파라미터로 전달 된 함수를 통하여 배열 내의 각 요소를 처리해서 그 결과로 새로운 배열을 생성합니다.

arr.map(callback, [thisArg])
callback : 새로운 배열의 요소를 생성하는 함수로서, 다음 세가진 인수를 가집니다.
currentValue : 현재 처리되고 있는 요소
index : 현재 처리되고 있는 요소의 index 값
array : 메소드가 불려진 배열
thisArg(선택항목) callback 함수 내부에서 사용 할 this 값을 설정

ex)
var numbers = [1,2,3,4,5];
var processed = numbers.map(function(num){
    return num * num
});
processed;

ex ES6 Syntax)
let numbers = [1,2,3,4,5];
let result = numbers.map((num) => {
    return num * num;
});

class ContactInfo extends React.Component {
  render() {
    return(
      <div>
         {this.props.contact.name}
         {this.props.contact.phone}
      </div>
    );
  }
}
class Contact extends React.Component{  //반복되는 내용을 직접 작성하겠다.
  constructor(props) {
    super(props);
    this.state = {
      contactData: [
        {name:'Abet', phone:'010-0000-0001'},
        {name:'Bbet', phone:'010-0000-0002'},
        {name:'Cbet', phone:'010-0000-0003'},
        {name:'Dbet', phone:'010-0000-0004'}
      ]
    }
  }

  render(){
    const mapToComponent = (data) => {
      return data.map((contact, i) => {
        return (<ContactInfo contact = {contact} key={i}/>);
      });
    };

    return(
      <div>
        {mapToComponent(this.state.contactData)}
      </div>
    );
  }
}
class App extends React.Component {
  render() {
    return (
      <Contact/>
    );
  }
};

ReactDOM.render(
  <App></App>,
  document.getElementById("root")
);

arrow function ( ... ) => { ... }
[ex6변환기](http://es6console.com/)

let one = a => console.log(a);

let two = (a,b) => console.log(a.b);

let three = (c,d) => {
	console.log(c);
  console.log(d);
}

let four = () => {
  console.log("no params");
}
-----------------------------------------------------------------------------------
"use strict";

var one = function one(a) {
  return console.log(a);
};

var two = function two(a, b) {
  return console.log(a.b);
};

var three = function three(c, d) {
  console.log(c);
  console.log(d);
};

var four = function four() {
  console.log("no params");
};
