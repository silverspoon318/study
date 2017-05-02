## 추가
before
prepend
content
append
after

<script>
    $('.target').before('<div>before</div>');   //class 값이 target인 element 전에 들어간다.
    $('.target').after('<div>after</div>');   //class 값이 target인 element 후에 들어간다.
    $('.target').prepend('<div>prepend</div>');   //class 값이 target의 content 전에 들어간다.
    $('.target').append('<div>append</div>');   //class 값이 target인 content 후에 들어간다.
</script>

## 제거
제거와 관련된 API 는 remove 와 empty가 있다. remove는 선택된 엘리먼트를 제거하는 것이고 element 는 선택된 엘리먼트의 텍스트 노드를 제거하는 것이다.
<script>
    $('#btn1').click(function(){
        $('#target1').remove();    
    });
    $('#btn2').click(function(){
        $('#target2').empty();
    });
</script>

## 바꾸기
replaceAll과 replaceWith는 모두 노드의 내용을 교체하는 API이다.
replaceWith가 제어 대상을 먼저 지정하는 것에 반해서
replaceAll은 제어 대상을 인자로 전달한다.

<script>
    $('#btn1').click(function(){
        $('<div>replaceAll</div>').replaceAll('#target1');
    });
    $('#btn2').click(function(){
        $('#target2').replaceWith('<div>replaceAll</div>');
    });
</script>

## 이동
<script>
$('#btn1').click(function(){
    $('#target1').append($('#source'));
});
</script>
