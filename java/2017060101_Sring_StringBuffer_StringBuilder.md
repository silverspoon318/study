String은 문자열을 대표하는 것으로 문자열을 조작하는 경우 유용하게 사용할 수 있고요.
문자열, 숫자, char 등을 concat할 때는 StringBuffer, StringBuilder를 사용할 수 있어요.
단, 복잡한 경우 의미가 있고, 단순한 경우에는 굳이 StringBuffer, StringBuilder를 쓰지 않고 "abc" + 1 + 'd'와 같이 + 를 활용해 직접 합쳐도 됩니다.

StringBuffer, StringBuilder는 동기화 지원 여부입니다. 두 클래스가 제공하는 메소드 같아요. 단 메소드를 보면 StringBuffer는 각 메소드 별로 synchronized keyword가 존재하죠.
즉, 멀티 쓰레드 상태에서 동기화를 지원한다는 것이 다릅니다.

public final class StringBuffer {
    public synchronized StringBuffer append(String str) {
        super.append(str);
        return this;
    }

    public synchronized StringBuffer append(boolean b) {
        super.append(b);
        return this;
    }

    ......
}
public final class StringBuilder {
    public StringBuilder append(String str) {
        super.append(str);
        return this;
    }
    public StringBuilder append(boolean b) {
        super.append(b);
        return this;
    }

    ......
}

JDK 1.5 버전 이후에는 컴파일 단계에서 StringBuilder로 컴파일 되도록 변경되었어요. 그래서 JDK 1.5 이후부터는 +를 활용해도 성능상에 큰 이슈는 없습니다.
