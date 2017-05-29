## sort()
이 메소드는 데이터를 정렬할 때 사용됩니다. 매개변수로는 어떤 KEY 를 사용하여 정렬 할 지 알려주는 document 를 전달합니다.
KEY 는 데이터의 field 이름이고, value 의 값은 1 혹은 -1 입니다. 이 값을 1로 설정하면 오름차순으로, -1로 하면 내림차순으로 정렬합니다
또한 여러 KEY를 입력 할 수 있고 먼저 입력한 KEY가 우선권을 갖습니다.

예제1: _id 의 값을 사용하여 오름차순으로 정렬하기_
db.orders.find().sort( { "_id": 1 } ) //_

예제2: amount 값을 사용하여 오름차순으로 정렬하고, 정렬한 값에서 id 값은 내림차순으로 정렬하기
db.orders.find().sort({"amount":1, "_id": -1})    //_

## limit()
이 메소드는 출력할 데이터 갯수를 제한할 때 사용됩니다. value 파라미터는 출력 할 갯수 값 입니다.

예제3: 출력 할 갯수를 3개로 제한하기
db.orders.find().limit(3)

## skip()
이 메소드는 출력 할 데이터의 시작부분을 설정할 때 사용됩니다.  value 값 갯수의 데이터를 생략하고 그 다음부터 출력합니다.

예제4: 2개의 데이터를 생략하고 그 다음부터 출력
db.orders.find().skip(2)

## 응용
MongoDB 클라이언트는 자바스크립트 기반이라, 이 안에서 함수를 만들 수도 있습니다.
이를 통하여 페이징 함수를 만들어봅시다.

var showPage = function(page) {
    return db.numbers.find().sort( {"value":1} ).skip((page-1) * 2).limit(2) }
}
showPage(1)


## update
MongoDB에서는 update() 메소드를 통하여 데이터를 수정 할 수 있습니다.  이 메소드의 구조는 다음과 같습니다

---
db.collection.update(
   <query>,
   <update>,
   {
     upsert: <boolean>,
     multi: <boolean>,
     writeConcern: <document>
   }
)
---

|Parameter  	|Type      	|설명
|*query	        |document	|업데이트 할 document의 criteria 를 정합니다. find() 메소드 에서 사용하는 query 와 같습니다.
|*update	    |document	|document에 적용할 변동사항입니다.
|upsert	        |boolean	|Optional. (기본값: false) 이 값이 true 로 설정되면 query한 document가 없을 경우, 새로운 document를 추가합니다.
|multi	        |boolean	|Optional. (기본값: false)  이 값이 true 로 설정되면, 여러개의 document 를 수정합니다.
|writeConcern	|document	|Optional.  wtimeout 등 document 업데이트 할 때 필요한 설정값입니다. 기본 writeConcern을 사용하려면 이 파라미터를 생략하세요. 자세한 내용은 매뉴얼을 참조해주세요.

예제1. 특정 field 업데이트 하기
db.people.update( { name: "Abet" }, { $set: { age: 20 } } )

예제2. document를 replace 하기(이렇게 새로운 document 로 replace 할 때, id는 바뀌지 않습니다.)
db.people.update( { name: "David" }, { $unset: { score: 1 } } )

예제3. 특정 field를 제거하기
db.people.update( { name: "David" }, { $unset: { score: 1 } } )

예제4. criteria에 해당되는 document가 존재하지 않는다면 새로 추가하기
---
db.people.update( { name: "Elly" }, { name: "Elly", age: 17 }, { upsert: true } )
WriteResult({
        "nMatched" : 0,
        "nUpserted" : 1,
        "nModified" : 0,
        "_id" : ObjectId("56c893ffc694e4e7c8594240")    //_
})
---

예제5. 여러 document의 특정 field를 수정하기
---
db.people.update(
 { age: { $lte: 20 } },
 { $set: { score: 10 } },
 { multi: true }
)
---

예제6-1. 배열 에 값 추가하기
---
db.people.update(
 { name: "Charlie" },
 { $push: { skills: "angularjs" } }
)
---

예제7-1. 배열에 값 제거하기(Charlie document에서 skills 값의 mongodb 제거)

---
db.people.update(
 { name: "Charlie" },
 { $pull: { skills: "mongodb" } }
)
---

예제7-2. 배열에서 값 여러개 제거하기(Charlie document에서 skills 배열 중 "angularjs" 와 "java" 제거)
---
db.people.update(
 { name: "Charlie" },
 { $pull: { skills: { $in: ["angularjs", "java" ] } } }
)
---
