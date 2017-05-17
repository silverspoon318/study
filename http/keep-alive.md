## 들어 가면서
HTTP는 아시다 시피 connection less 방식으로 연결을 매번 끊고 새로 생성하는 구조입니다.
이는 network 비용측면에서 많은 비용을 소비하는 구조입니다.( 최초 연결하기 위한 준비과정을 의미함 )
그래서 HTTP 1.1부터는 Keep-Alive라는 기능을 지원합니다.

## Keep Alive란?
Keep Alive란 연결된 socket에 IN/OUT의 access가 마지막으로 종료된 시점부터 정의된 시간까지 access가 없더라도 대기하는 구조입니다.
즉 정의된 시간내에 access가 이루어진다면 계속 연결된 상태를 유지할 수 있다는 것 이죠.

예를 들면 image를 4개를 보여주는 구조에서 client는 동시에 2개의 image만 얻어 올수 있고 1개의 image는 얻는데 2초 걸리고 port를 여는데 1초가 걸린다고 가정.

- keep alive : false
처음 server에 2개의 port를 열고 image를 얻고 client socket의 닫고 ( 3초 )
다시 server에 2개의 port를 열고 image를 얻고 client socket을 닫음 ( 3초 )
총 6초가 걸림.

- keep alive : true
처음 server에 2개의 port를 열고 image를 얻고 ( 3초 )
다시 첫번째 요청에서 열어 둔 2개의 port에 2개의 image를 얻음 ( 2초 )
keep alive time out이 되었을 때 client의 socet이 닫히거나 browser가 더 이상 얻어 올 것이 없으면 자동으로 닫어 버림.
총 5초가 걸림.

## Keep Alive를 그럼 어떻게 쓸수 있는가?
client(browser)는 http 1.1을 준수하고 이해 할수 있다고 request에 Connection: Keep-Alive를 넣어서 Server에 전송.
즉 client는 http 1.1 spec을 구현하고..
server도 http 1.1 spec을 구현하고 keep alive 기능을 활성화하고 keep alive time out을 설정.
