# 플러터 + 파이어베이스 CMS

* 명칭: Flutter CMS
* 라이센스: GPL 3.0
* 개발자: 송재호 thruthesky@gmail.com

## 개요

* 모든 앱에서 회원 가입 및 회원 정보 관리, 그리고 게시판 기능이 필요하죠.
  * 이를 CMS(Content Management System)이라고 합니다.
* 본 프로젝트에서는 플러터와 파이어베이스를 기본으로 하는 CMS 를 재 사용이 쉽도록 모듈화 하여, 복사해서 쓸 수 있도록 하는 것이 목표입니다.
* 또한 게시판 기능을 확장하여 블로그나 쇼핑몰 등 다양하게 활용 할 수 있도록 합니다.

### 유료 서비스 안내

* 본 프로젝트는 GPL 을 따르는 오픈 소스입니다. 하지만 사용함에 있어 어려운 경우 유료 서비스를 요청 하실 수도 있습니다.
  * 설치가 어려운 경우
    * Firebase 설정 및 앱 설정을 해 드립니다.
  * 추가 기능이 필요한 경우
    * Flutter CMS 가 가진 기본 기능 외에 추가 기능이 필요 한 경우 개발을 해 드립니다.
* 연락처: thruthesky@gmail.com

## 참여

* 본 프로젝트는 '한국 플러터 커뮤니티'에서 스터디용 제작한 것입니다.
* [소통하며 배우는 플러터 스터디 그룹 - 카카오톡 단톡방 입장](https://open.kakao.com/o/g20m41Mb)
* [네이버 카페 공지사항 참고](https://cafe.naver.com/ionic2/1869)
* 소스를 수정하시고 PR 을 해 주시면 됩니다.
* UI 작업 및 문서화 작업하실 분을 구합니다.
* 연락처: thruthesky@gmail.com

## 설치


* 현재 Git repo 를 clone 또는 fork 해서 로컬 머신에서 테스트한다.
  * `git clone https://github.com/thruthesky/fluttercms [project_name]`
  * `cd project_name`
  * `git submodule update --init`
  * `git submodule foreach git checkout master`

* 경로 변경
  * `package:fluttercms` 를 `package:[project_name]` 으로 변경을 한다.
    * 특히, `lib/models/app.model.dart` 에서 `../flutterbase/etc/flutterbase.globals.dart` 와 같이 relative path 로 지정하면 에러가 난다.




### Firestore 권한 지정

* 주의: 아래의 권한은 2020. 05. 30. 작업 중인 권한 설정이며, 미완성이다. 더 많은 권한 설정이 필요하다.
  * 따라서, 최종 버전이 발표 되기 전까지 자주 업데이트를 해야 한다.

``` js
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {


    // 기본적으로 모든 읽기와 쓰기를 막는다.
    match /{document=**} {
      allow read: if false;
      allow write: if false;
    }
    // 사용자
    match /users/{uid} {
      // 로그인을 했으면, 도큐먼트 생성 가능
      allow create: if login();

      // 자신의 도큐먼트이면 읽기 가능.
      allow read: if request.auth.uid == uid;

      // 자신의 도큐먼트인 경우, `isAdmin` 속성은 빼고 수정 가능.
      // 관리자인 경우에도, request data 로 직접 isAmdin 속성을 수정 할 수 없다. 
      allow update: if request.auth.uid == uid && notUpdating('isAdmin');

      // 삭제는 불가능
      allow delete: if false;
    }

    // 카테고리. 모든 회원이 읽을 수 있지만, 관리자만 쓰기 가능.
    match /categories/{category} {
      allow read: if true;
      allow create, delete: if admin();
      allow update: if admin() && notUpdating('id');
    }

    // 글
    match /posts/{postId} {
      // 아무나 글을 읽거나 목록 할 수 있음.
      allow read: if true;


      // 생성
      // - 로그인을 했으면, 도큐먼트 생성 가능
      // - 글 쓰기/수정에서 카테고리가 있어야 하며 존재 해야 함.
      allow create: if login()
        && toBeMyDocument()
        && categoryExist()
        && mustBeZero('like')
        && mustBeZero('dislike');



      // 수정
      //
      // 필수 입력: 없음??
      
      // 
      // 
      // - 수정은 자기 글만 가능
      // - uid 변경 불가
      // - 카테고리가 존재해야 함
      //
      // - 다른 사람이 내 글을 수정하는 경우, 오직 'like' 와 'dislke' 만 수정 가능하다. 
      // - 자신 뿐만아니라 타인이 vote 할 수 있다.
      allow update: if
      (
        myDocument() 
        && categoryExist()
        && notUpdating('uid')
      )
      || 
      ( 
        // 본인 뿐만 아니라 타인도 이 rule 로 vote
        onlyUpdating(['like', 'dislike']) 
        && updatingByOne('like') 
        && updatingByOne('dislike')
        )
      ;


      // 삭제는 자기 글만 가능
      //
      // 필수 입력: 없음.
      allow delete: if myDocument();


      // 코멘트
      // - 각 글 도큐먼트 하위에 기록
      match /comments/{comment} {
        allow read: if true;

        // 코멘트 생성 권한
        // - 입력값: uid, content, depth, order. `post id` 는 필요 없음.
        allow create: if login() && toBeMyDocument() // 내 코멘트이어야 하고
          && exists(/databases/$(database)/documents/posts/$(postId)) // 글이 존재해야 하고
          && request.resource.data.order is string // order 가 문자열로 들어와야 하고,
          && request.resource.data.order.size() == 71 // order 가 71 글자 길이어야 한다.
          && request.resource.data.depth is number // order 가 number 로 들어와야 하고,
          && request.resource.data.depth > 0 && request.resource.data.depth <= 12 // 1 부터 12 사이의 값이어야 한다.
          && mustBeZero('like') && mustBeZero('dislike')
          ;

        // 코멘트 수정 권한
        // - 내 코멘트이고,
        // - `uid`, `order` 를 업데이트 하지 않아야 한다.
        // - 자신 뿐만아니라 타인이 vote 할 수 있다.
        allow update: if
          (
            login()
            && toBeMyDocument() 
            && notUpdating('uid')
            && notUpdating('order')
          )
          ||
          (
          // 본인 뿐만 아니라 타인도 이 rule 로 vote
            onlyUpdating(['like', 'dislike'])
            && updatingByOne('like')
            && updatingByOne('dislike')
          )
          ;

        // 코멘트 삭제 권한
        // - 내 코멘트이면 삭제 가능
        allow delete: if login() && myDocument();
      }
    }



    // 추천/비추천
    match /likes/{like} {
      allow read: if login() && myDocument();
      allow create: if login() && toBeMyDocument() && request.resource.data.keys().hasOnly(['uid', 'id', 'vote']);
      allow update: if login() && myDocument() && notUpdating('uid') && request.resource.data.keys().hasOnly(['uid', 'id', 'vote']);
      allow delete: if login() && myDocument();
    }
    

    // 설정. 모든 회원이 읽을 수 있지만, 관리자만 쓰기 가능.
    match /settings/{document=**} {
      allow read: if true;
      allow write: if admin();
    }




    // 로그인을 했는지 검사
    function login() {
      return request.auth.uid != null;
    }

    // 필드를 변경하지 못하게 검사
    //
    // request data 에 field 가 없거나, 있다면, 저장되어져 있는 값과 동일해야 한다.
    // 즉, 값을 변경을 하지 못하도록 하는 체크하는 함수이다.
    function notUpdating(field) {
      return !(field in request.resource.data) || resource.data[field] == request.resource.data[field];
    }

    // request data 에 특정 field 가 있는지 검사한다.
    // function requestHas(field) {
    //   return field in request.resource.data;
    // }

    // 사용자의 uid 와 문서에 저장되어져 있는 uid 가 일치하면 본인의 데이터
    function myDocument() {
      return resource.data.uid == request.auth.uid;
    }

    // 사용자의 uid 와 저장할 데이터의 uid 가 일치하면, 나의 데이터로 저장 될 것이다.
    function toBeMyDocument() {
      return request.resource.data.uid == request.auth.uid;
    }

    // 관리자 인지 확인.
    //
    // 사용자 도큐먼트에 `isAdmin` 속성이 true 인 경우, 관리자로 간주한다.
    function admin() {
      return login() && get(/databases/$(database)/documents/users/$(request.auth.uid)).data.isAdmin == true;
    }
    // 카테고리가 존재하는지 검사한다.
    // - `category` 에 category id 값이 들어와야 한다.
    function categoryExist() {
      return exists(/databases/$(database)/documents/categories/$(request.resource.data.category));
    }

    // 특정 값만 업데이트하는지 확인
    //
    // 예) onlyUpdating(['like', 'dislike']);
    function onlyUpdating(fields) {
      return request.resource.data.diff(resource.data).affectedKeys().hasOnly(fields);
    }

    // 특정 필드에 대한 증감 값 확인
    //
    // `field` 가 숫자인지 확인
    // `field` 가 업데이트되지 않거나 또는 최대 1 증가, 최소 1 감소하는지 확인.
    function updatingByOne(field) {
      return request.resource.data[field] is int
        &&
        ( 
          request.resource.data[field] == resource.data[field] // 값이 변하지 않거나
          ||
          request.resource.data[field] == resource.data[field] + 1 // 값이  1 증가 하거나
          ||
          request.resource.data[field] == resource.data[field] - 1 // 값이  1 감소 하거나
        );
    }

    function mustBeZero(field) {
      return request.resource.data[field] is int && request.resource.data[field] == 0;
    }

    // 게시글이 존재하는지 검사한다.
    // 현재 액세스하려는 post document 가 실제로 존재하는 것인지 검사
    // function postExist() {
    //   return exists(/databases/$(database)/documents/posts/$(request.resource.data.postId));
    // }

  }


}
```

* 참고: [권한 테스트](https://github.com/thruthesky/flutterbase-security-test)

### Firestore 인덱스

``` json
{
  "indexes": [
    {
      "collectionGroup": "posts",
      "queryScope": "COLLECTION",
      "fields": [
        {
          "fieldPath": "category",
          "order": "ASCENDING"
        },
        {
          "fieldPath": "createdAt",
          "order": "DESCENDING"
        }
      ]
    }
  ],
  "fieldOverrides": []
}
```

### 관리자 지정하기

* 관리자를 만들고자 하는 사용자의 도큐먼트에서 `isAdmin` 속성에 true 의 값을 주면 된다. 
* 예) `users/user-id/{ ..., isAdmin: true }`
* 참고로, Firestore 에서 Document Filtering(검색) 기능을 통해서, 검색하면 된다. Document 필드 중 email 또는 uid 이 없다면, displayName 으로 검색하면 된다.



### iOS 설치 예제

* ios/Runner/GoogleService-Info.plist 파일을 삭제한다.
* Xcode 에서 Runner > Identity 에서 Bundle ID 를 기록한다.
* 파이어프로젝트에서 iOS 앱을 추가하고, Bundle ID 를 동일하게 기록한다.
* GoogleService-Info.plist 를 다운로드해서
  * ios/Runner/ 폴더에 저장한 다음,
  * Xcode 의 Runner > Runner 아래로 드래그해서 넣는다.
* pod 설치를 한다.
  * cd ios
  * pod install

* 앱을 실행한다.
* 관리자 이메일로 로그인을 한다.
* 카테고리에
  * discussion 과 qna 두개를 만든다.
  * 게시판 글 쓰기를 한다.
  * 코멘트 글 쓰기를 한다.
  * 사진 업로드를 한다.
* 로그아웃을 하고,
  * 회원 가입을 한다.
  * 회원 정보 수정을 한다.
  * 회원 사진 업로드를 한다.


### Android 설치 예제

* android/app/google-services.json 을 삭제한다.
* Firebase console 에서 Android 앱을 추가하고, google-services.json 을 다운 받아
  * android/app/google-services.json 에 복사한다.


## 구성

* 플러터와 파이어베이스의 연결을 관리하는 모듈 - [Flutterbase](https://github.com/thruthesky/flutterbase)
* Flutterbase 를 기반으로 만든 Flutter 예제 앱 - [FlutterCMS](https://github.com/thruthesky/fluttercms)
* 파이어베이스 `Firestore` 권한 검사 테스트 프로젝트 - [Flutterbase Security Test](https://github.com/thruthesky/flutterbase-security-test) 

## 테스트

### Flutterbase 테스트

* Flutter 에서 Firebase 를 테스트하기 위해서는 Firebase 모듈이 장치나 에뮬레이터에서 실행되어야 함.
  * 즉, Unit test 에서는 바로 할 수 없고, mocking 통해서 해야하는데 번거로움.
* 그래서 `settings.dart` 의 `Settings.testApp` 값이 true 이면 앱이 실행되고 코드가 수정 될 때 마다 테스트를 함.
* [Flutterbase 테스트 코드](https://github.com/thruthesky/flutterbase/tree/master/tests)


### Security Rule Test

* Firestore 권한에 대한 테스트 코드를 작성하였습니다.
  * [Flutterbase Security Test](https://github.com/thruthesky/flutterbase-security-test) 를 참고.
  * `Flutterbase` 의 dart 코드는 mocking 을 하지 않아도, 테스트 할 수 있는 방법이 있지만,
  * `Firestore Security Test`에서는 mocking 말고는 방법이 없습니다. 그래서 mocking 으로 권한 테스트합니다.




## Spinner

* 처리 중 spinner 보여 줄 때, state 내에서 변수 정의 하고, state 업데이트 하는 등 번거로운 점이 있다.
* spinner 변수를 모델이나 해당 객체(글 또는 코멘트 도큐먼트)에 저장해서 처리를 한다.
* 즉, 해당 작업을 처리하는 함수 안에서 표시를 하도록 해서, 개벌 클래스 내에서는 코드를 줄인다.

예를 들어

* showSpinner: inDeleting 과 같이 true, false 에 따라 spinner 를 보여준다면,
* fb.delete(post); 와 같이 호출 할 때,
* delete() 안에서 post.inDeleting = true 하고, 작업이 끝나면 post.inDeleting = false 한다.


## 삭제된 글 처리

* 삭제 된 글을 삭제해도 글은 그냥 삭제가 된 것이다.
* 또한 삭제된 글을 수정해도 이미 deletedAt 에 값이 있기 때문에 이미 삭제된 것이다.

* 삭제 된 글을 삭제, 추천 할 때에는 해당 작업 처리 함수에서 에러를 throw 하도록 한다.

* 하지만, 삭제된 글은 수정 할 때에는, 수정 작업 함수가, 사용자가 글을 다 수정한 후, 버튼을 클릭하면 발생하기 때문에, 사용자가 불편함을 겪게 된다. 따라서
  * 수정 버튼을 없애거나
  * disable 시키거나
  * 또는 최소한 삭제가 되었으면 수정 버튼을 클릭 할 때 삭되었다고 알려준다.


## 추천/비추천

* 도큐먼트를 생성할 때, like 와 dislike 의 값을 0 으로 초기화 해야 한다. 그렇지 않으면, security rule 이나 기타 작업에서 번거로운 점이 많다.
  * security rules 에서 rule 로 정한다.