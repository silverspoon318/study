## Immutable
생성 후 변경 불가한 객체입니다. 그래서 immutable에는 set 메소드가 없습니다. 멤버 변수를 변경할 수 없습니다.
return type이 void인 메소드도 없습니다.
Immutable을 쓰면, 멀티쓰레드 환경에서 좀 더 신뢰할 수 있는 코드를 만들어 내기가 쉽습니다.

## 대표적인 Immutable 클래스
String, Boolean, Integer, Float, Long 등등이 있습니다. 여기서 주의할 점은 변경불가라는 것은 heap 영역에서의 변경불가라는 뜻입니다.

String a = "a";
a="b";

위 예제와 같이 재할당은 가능합니다. 이는 a가 reference하고 있는 heap 영역의 객체가 바뀌는 것이지 heap 영역에 있는 값이 바뀌는 것이 아닙니다.

- api reference
Strings are constant; their values cannot be changed after they are created. String buffers support mutable strings. Because String objects are immutable they can be shared.
For example:

String str = "abc";

is equivalent to:

     char data[] = {'a', 'b', 'c'};
     String str = new String(data);

간단히 말해서 String은 = 값으로 뭐를 넣으면 새로 객체를 만든다는 뜻이다.

## String vs StringBuffer
String은 immutable이지만 StringBuffer은 아닙니다. StringBuffer가 String보다 빠른 이유는 객체를 새로 생성할 필요가 없기 때문입니다.
StringBuffer에만 대표적인 메소드는 append, delete 등일 겁니다. 멤버 변수를 변화시켜 값을 바꿀 수 있는 거죠.

StringBuffer b = new StringBuffer();
StringBuffer a = b.append("test");
System.out.println(a == b); //result : true

result인 이유 : 객체를 새로 만드는 것이 아니라 return this; 되어 있다.

## Immutable의 유용성과 위험성
Immutable은 값이 계속 변경될 수 있는 곳에 쓰면 메모리 왕창 잡아먹습니다. 값이 완전히 정리된 후에 한 큐에 immutable로 만들어 내셔야 합니다.
java.util.Collections 에 unmodifiable머시기 하는 메쏘드들이 있습니다. 얘네들을 이용하면, Set, List, Map 등을 immutable로 사용할 수 있습니다.
다만, add, put과 같은 메쏘드를 호출할 경우에는 UnsupportedOperationException 가 발생합니다. 예외 상황을 고려해야 합니다.

## Immutable은 보통 final 클래스로 정의합니다
처음에 자바를 할 때 String이란 객체에 ltrim이란 메쏘드를 추가하고 싶었습니다. (왼쪽만 trim하는 메쏘듭니다.)
상속을 받아 새로운 클래스를 만들어 해결하려고 했습니다.
헛, 그런데 final로 정의가 되어있어서 상속을 받을 수가 없더군요.
final로 정의가 되지 않으면, 상속을 받은 클래스가 Immutable을 깨버릴 수가 있기 때문입니다.

WrongImmutable의 생성자에 인자로 넣은 Date를 외부에서 값을 변경시키면 WrongImmutable의 멤버 변수의 값이 변경이 되고 맙니다.
Immutable에서는 멤버 변수가 외부로 공개되어 변경이 가능하면 안 됩니다.
그럼 처음에 원했던 대로 정상적인 Immutable이 되도록 하려면 인자로 받은 Date 객체를 그대로 사용하는 것이 아니라, 어떤 식으로든 복사를 해서 써야 합니다.
생성자에서 멤버 변수의 값을 할당하는 부분을

this.date = new Date(date.getTime()); 와 같이 바꿔야 합니다.

## 자바에 진짜 Immutable이란 건 없다!
String 객체는 내부적으로 value라는 이름의 char[]로 그 값을 관리합니다. 물론 private으로 선언되어있지요.
reflection을 이용하면 멤버변수에 걸려있는 private을 무시하고 접근해 버릴 수가 있습니다.
결국 reflection을 이용하면 모든 멤버변수에 대한 수정이 가능합니다.
Immutable이란 건 reflection을 제외시켜 놓고 생각할 때만 가능합니다.
