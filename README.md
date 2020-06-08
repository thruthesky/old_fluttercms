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

* 사실, 설치라기 보다는 `활용하는 방법`에 대한 설명이라고 볼 수 있습니다.
  * 궁극적으로 `Flutterbase` 모듈에 대한 이해를 잘 해서 복사하여 사용 할 수 있도록 하는것이 목표입니다.
* 크게 두가지 방법이 있는데,
  * 첫째, 이미 만들어져 있는 Flutter 앱에 [Flutterbase](https://github.com/thruthesky/flutterbase)를 추가하는 방법과
  * 둘째, `Flutterbase` 의 예제 앱인 [FlutterCMS](https://github.com/thruthesky/fluttercms)를 복사해서 사용하는 법이 있습니다.

* 여기서는 `FlutterCMS`를 fork(또는 clone 이나 소스 다운로드) 한 다음 설정만 바꾸어서 사용하는 방법에 대해서 설명을 합니다.
  * `Flutterbase` 를 추가하는 방법은 [Flutterbase](https://github.com/thruthesky/flutterbase) 문서를 참고해주세요.

### 소스 다운로드

* https://github.com/thruthesky/fluttercms 를 clone 합니다.
  * Pull Request를 할 계획이면 fork 후 clone 으로 하고, root 로 https://github.com/thruthesky/fluttercms 를 추가합니다.
  * 참고로 PR 을 하지 않을 계획이면 굳이 fork 하지 않고 바로 clone 하면 됩니다.
  * 그리고 굳이 clone 할 필요없이 소스를 다운로드 해서 사용하셔도 됩니다.

* Git submodule 을 초기화 합니다.
  * `git submodule update --init`
  * `git submodule foreach git checkout master`

* 그리고 `basic` branch 를 체크아웃합니다.
  * `git checkout basic`
  * `basic` branch 에는 가장 간단한 코드들이 들어가 있으므로 재 활용하기가 편할 것입니다.
  * 본 문서에서 설명은 `basic` branch 를 바탕으로 설명을 합니다.

* 경로 변경
  * 몇 몇 소스코드에 relative path 에 문제가 있을 수 있습니다.
  * `import package:fluttercms` 와 같이 되어져 있다면 이를 `import package:[project_name]` 으로 변경을 합니다. (소스 파일들을 검색을 해 볼 필요가 있습니다.)
    * 특히, `lib/models/app.model.dart` 에서 `../flutterbase/etc/flutterbase.globals.dart` 와 같이 relative path 로 지정하면 에러가 나는데, 확인을 해 볼 필요가 있습니다.

* `master` branch 는 launch.json 에 따라 여러 main.dart 로 분리되어져 있으니, `basic` branch 보다 약간 더 복잡 할 수 있습니다.

### Firebase 설정

* [Flutterbase Firebase 설정](https://github.com/thruthesky/flutterbase#firebase-%EC%84%A4%EC%A0%95)에서 설명된데로 하면 됩니다.


### 프로젝트 설정

* [Flutterbase settings.dart 설정](https://github.com/thruthesky/flutterbase#%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8-%EC%84%A4%EC%A0%95) 을 참고해서 settings.dart 파일을 수정한다.

### iOS 설치 예제

* 먼저 ios/Runner/GoogleService-Info.plist 파일을 삭제합니다.
* Xcode 에서 Runner > Identity 에서 Bundle ID 를 기록합니다.
* 파이어프로젝트에서 iOS 앱을 추가하고, Bundle ID 를 동일하게 기록합니다.
* GoogleService-Info.plist 를 다운로드해서
  * ios/Runner/ 폴더에 저장한 다음,
  * Xcode 의 Runner > Runner 아래로 드래그해서 넣습니다.
* pod 설치를 합니다.
  * cd ios
  * pod install

* 앱을 실행합니다.

### Android 설치 예제

* android/app/google-services.json 을 삭제합니다.
* 아래와 Android 앱 기본 설정을 합니다.
  * 아래의 세 파일에서 package 를 App ID 로 변경
    * android/app/src/main/AndroidManifest.xml
    * android/app/src/debug/AndroidManifest.xml
    * android/app/src/profile/AndroidManifest.xml
  * android/app/build.gradle 에서 ApplicationId 를 App ID 로 변경
  * android/app/src/main/kotlin/….MainActivity.kt 에서 package 를 App ID 로 변경
  * android/app/build.gradle 에서 minSdkVersion 16 을 minSdkVersion 21 로 변경

* Firebase console 에서 Android 앱을 추가하고, google-services.json 을 다운 받아
  * android/app/google-services.json 에 저장합니다.

* Flutter 에서 google-services.json 을 읽을 수 있도록 Google Services Gradle plugin 을 설치
  * android/app/build.gradle 파일을 열어서 맨 아래에 아래를 추
    * `apply plugin: 'com.google.gms.google-services'`
  * android/build.gradle 에서 buildscript tag 에 아래의 dependency 를 추가

```
buildscript {
   repositories {
       // ...
   }

   dependencies {
       // ...
       classpath 'com.google.gms:google-services:4.3.3'   // 추가
   }
}
```


### iOS 와 Android 설정을 마친 후

* 관리자로 사용할 이메일로 가입을 합니다.
* 관리자 설정: [Flutterbase 관리자 지정](https://github.com/thruthesky/flutterbase#%EA%B4%80%EB%A6%AC%EC%9E%90-%EC%84%A4%EC%A0%95e)에서 설명된 데로 합니다.
* 카테고리에
  * discussion 과 qna 두개를 만듭니다.
  * discussion 카테고리에 글 쓰기를 합니다.
  * 코멘트 글 쓰기를 합니다.
  * 사진 업로드를 합니다.

* 로그아웃을 하고, 테스트 아이디로
  * 회원 가입을 하고
  * 회원 정보 수정하고
  * 회원 사진 업로드를 합니다.



## 구성

* 플러터와 파이어베이스의 연결을 관리하는 모듈 - [Flutterbase](https://github.com/thruthesky/flutterbase)
* Flutterbase 를 기반으로 만든 Flutter 예제 앱 - [FlutterCMS](https://github.com/thruthesky/fluttercms)
* 파이어베이스 `Firestore` 권한 검사 테스트 프로젝트 - [Flutterbase Security Test](https://github.com/thruthesky/flutterbase-security-test) 

## 테스트

* Flutterbase 참고



## master 브랜치 사용 설명

* master 브랜치는 .vscode/launch.json 에 설정을 통해서 여러 `min.dart`로 분리해서 각 앱 마다 UI 를 변경해 가면서 테스트를 했습니다.
* 그래서 각 앱마다 `main.dart` 가 다르고, `pubspec.yaml` 도 다릅니다.
* launch.json 에서 `Flutter` 를 실행하면 기본 앱이 실행되지만,
  * pubspec.yaml 이나 Info.plist 등은 기본 파일의 것이 아닐 수 있습니다.
  * 이 때, 각 앱 설정에 맞는 모든 변경을 다 해 주어야 합니다.

* 간단하게 앱 설정을 변경하기 위해서 패치 프로그램을 만들었습니다.
  * [Flutter Multi Apps](https://github.com/thruthesky/flutter-multi-apps) 를 참고합니다.


### Flutter Multi Apps 로 설정

* 아래와 같이 명령하면 기본 `lib/main.dart` 를 위한 설정을 한다.

```
$ ts-node src/index.ts --path /flutter/root/folder/path --app default
```



### pubspec.yaml

* 기본 앱은 `lib/main.dart`를 사용합니다. 이 때, 아래와 같이 프로젝트 설정을 해야합니다.
  * `apps/default/defualt.pubspec.app.yaml` 을 `pubspec.yaml` 로 복사(또는 링크)해서 사용합니다.
  * `apps/default/defualt.Info.plist` 를 `ios/Runnder/Info.plist` 로 복사(또는 링크)해서 사용합니다.
* 그 외 각 엡은
  * `apps/APP_NAME/APP_NAME.pubspec.yaml` 을 `pubspec.yaml` 로 복사(또는 링크)해서 사용합니다.
  * `apps/APP_NAME/APP_NAME.plist` 를 `ios/Runnder/Info.plist` 로 복사(또는 링크)해서 사용합니다.


