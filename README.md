# 플러터 + 파이어베이스 CMS

* 개요
  * 모든 앱에서 회원 가입 및 회원 정보 관리, 그리고 게시판 기능이 필요하다.
  * 본 프로젝트에서는 플러터와 파이어베이스로 회원 기능 및 게시판 기능을 재 사용이 쉽도록 모듈화 하여, 필요할 때 언제든지 복사해서 쓸 수 있도록 하는 것이다.
  * 게시판 기능을 확장하여 쇼핑몰이나 블로그 등 다양하게 활용 할 수도 있다.

* 참여
  * [소통하며 배우는 플러터 스터디 그룹 - 카카오톡 단톡방 입장](https://open.kakao.com/o/g20m41Mb)
  * [네이버 카페 공지사항 참고](https://cafe.naver.com/ionic2/1869)
  * 소스를 수정하시고 PR 을 해 주시면 됩니다.


* 기존에는 `Firebase Functions` 를 활용하여 회원 관리 + 파이어베이스 CMS 를 만들었는데, `Functions`를 없애고 직접 `Firestore` 에 쿼리를 하므로, 보다 간편해졌다.



## 테스트

* 테스트는 필수이다. 테스트 없이 개발한다는 것은 있을 수 없는 일이다.
* Flutter 에서 Firebase 를 테스트하기 위해서는 Firebase 모듈이 장치나 에뮬레이터에서 실행되어야 한다.
  * 즉, Unit test 에서는 할 수 없는 것이다.
* 그래서 `settings.dart` 의 `Settings.testApp` 값이 true 이면 앱이 실행되고 코드가 수정 될 때 마다 테스트를 하도록 한다.


### Security Rule Test

* [Flutterbase Security Test](https://github.com/thruthesky/flutterbase-security-test) 를 참고한다.