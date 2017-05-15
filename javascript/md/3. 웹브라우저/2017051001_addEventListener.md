## addEventListener
이벤트를 등록하는 가장 권장하는 방식이다. 이 방식을 이용하면 여러 개의 이벤트 핸들러를 등록할 수 있다.
첫번째 인자로 event를 받아서 event객체가 가지고 있는 여러 프로퍼티를 사용할 수 있다.
<script>
    var t = document.getElementById('target');
    t.addEventListener('click', function(event){    
        alert('Hello world,' + event.target.value);
    });
</script>

ie8이하에서는 attachEvent 메소드를 사용해야 한다.
if(t.addEventListener) {  //addEventListener 기능이 있는지 없는지 확인

} else if(t.attachEvent) {
    t.attachEvent('onclick', function(event){

    })
}

장점은 하나의 이벤트 대상에 복수의 동일 이벤트 타입 리스너를 등록할 수 있다는 점이다.
<script>
    var t = document.getElementById('target');
    t.addEventListener('click', function(event){
        alert(1);
    })
    t.addEventListener('click', function(event){
        alert(2);
    })
</script>

이벤트 객체를 이용하면 복수의 엘리먼트에 하나의 리스너를 등록해서 재사용할 수 있다.

<script>
    var t1 = document.getElementById('target1');
    var t2 = document.getElementById('target2');
    function btn_listener(event){
        switch(event.target.id) {
            case 'target1':
                alert(1);
                break;
            case 'target2':
                alert(2);
                break;
        }
    }
    t1.addEventListener('click', btn_listener);
    t2.addEventListener('click', btn_listener);
</script>
