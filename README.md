# 플러터 + 파이어베이스 CMS

* 명칭: Flutter CMS
* 라이센스: GPL 3.0
* 개발자: 송재호 thruthesky@gmail.com
* 버전: 0.1.0

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

* Flutterbase 참고

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

* Flutterbase 참고


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