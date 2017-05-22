## Component LiftCycle API
1. componentWillMount
2. componentDidMount
3. componentWillReceiveProps
4. shouldComponentUpdate
5. componentWillUpdate
6. componentDidUpdate
7. componentWillUnmount

## constructor
constructor(props) {
    super(props);
    console.log("constructor");
}
컴포넌트가 처음 만들어질 때 실행 된다. 기본 state를 설정할 수 있다.

## componentWillMount
componentWillMount() {
    console.log("componentWillMount");
}
컴포넌트가 DOM 위체 만들어지기 전에 실행된다. 그래서 DOM 처리를 할 수 없다.

## componentDidMount
componentDidMount() {
    console.log("componentDidMount");
}
첫 렌더링 마치고 실행된다. 이 안에서 다른 자바스크립트 프레임워크 연동 및 setTimeout, setInterval 및 Ajax사용
DOM 처리를 할 수 있다.

## componentWillReceiveProps
componentWillReceiveProps() {
    console.log("componentWillReceiveProps" + JSON.stringify(nextProps));
}
props를 받을 때 실행된다. props에 따라 state를 업데이트 할 때 사용하면 유용하다.
이 안에서 setState를 해도 괜찮다.

## shouldComponentUpdate
shouldComponentUpdate(nextProps, nextState) {
    console.log("shouldComponentUpdate:" + JSON.stringify(nextProps) + "" + JSON.stringify(nextState));
    return true;
}
props/state 가 변경되었을 때 리렌더링을 할지말지 정한다.
실제로 사용할 때는 필요한 비교를 하고 값을 반환해야 한다.
예 : return nextProps.id !== this.props.id
JSON.stringify 를 사용하여 여러 field를 편하게 비교.

## componentWillUpdate
componentWillUpdate(nextProps, nextState) {
    console.log("componentWillUpdate:" + JSON.stringify(nextProps) + "" +JSON.stringify(nextState));
}
컴포넌트 업데이트 전 실행된다.
여기서 setState 절대 사용하지 말 것. 무한루프에 빠진다.

## componentDidUpdate
componentDidUpdate(prevProps, prevState) {
    console.log("componentDidUpdate": + JSON.stringify(prevProps) + "" + JSON.stringify(prevState));
}
컴포넌트가 리렌더링을 마친 후 실행된다.
여기서도 setState를 사용하지 말것.

## componentWillUnmount
componentWillUnmount() {
    console.log("componentWillUnmount");
}
컴포넌트가 DOM에서 사라진 후 실행된다.
