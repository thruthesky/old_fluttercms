# 플러터 + 파이어베이스 CMS

## 개요
* 모든 앱에서 회원 가입 및 회원 정보 관리, 그리고 게시판 기능이 필요하다.
  * 이를 CMS(Content Management System)이라고 한다.
* 본 프로젝트에서는 플러터와 파이어베이스를 기본으로 하는 CMS 를 재 사용이 쉽도록 모듈화 하여, 복사해서 쓸 수 있도록 하는 것이 목표이다.
* 또한 게시판 기능을 확장하여 블로그나 쇼핑몰 등 다양하게 활용 할 수 있도록 한다.

## 참여
* [소통하며 배우는 플러터 스터디 그룹 - 카카오톡 단톡방 입장](https://open.kakao.com/o/g20m41Mb)
* [네이버 카페 공지사항 참고](https://cafe.naver.com/ionic2/1869)
* 소스를 수정하시고 PR 을 해 주시면 됩니다.
* UI 작업 및 문서화 작업하실 분을 구합니다.
* 연락처: thruthesky@gmail.com

## 구성

* 플러터와 파이어베이스의 연결을 관리하는 모듈 - [Flutterbase](https://github.com/thruthesky/flutterbase)
* Flutterbase 를 기반으로 만든 Flutter 예제 앱 - [FlutterCMS](https://github.com/thruthesky/fluttercms)
* 파이어베이스 `Firestore` 권한 검사 테스트 프로젝트 - [Flutterbase Security Test](https://github.com/thruthesky/flutterbase-security-test) 

## Flutterbase 테스트

* Flutter 에서 Firebase 를 테스트하기 위해서는 Firebase 모듈이 장치나 에뮬레이터에서 실행되어야 한다.
  * 즉, Unit test 에서는 바로 할 수 없고, mocking 통해서 해야하는데 번거롭다.
* 그래서 `settings.dart` 의 `Settings.testApp` 값이 true 이면 앱이 실행되고 코드가 수정 될 때 마다 테스트를 하도록 한다.


### Security Rule Test

* Firestore 권한에 대한 테스트 코드를 작성하였다.
  * [Flutterbase Security Test](https://github.com/thruthesky/flutterbase-security-test) 를 참고한다.
  * `Flutterbase` 의 dart 코드는 mocking 을 하지 않아도, 테스트 할 수 있는 방법이 있지만,
  * `Firestore Security Test`에서는 mocking 말고는 방법이 없다. 그래서 mocking 으로 권한 테스트를 한다.

