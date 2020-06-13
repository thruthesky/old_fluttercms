import 'package:flutter/material.dart';
import '../apps/korea_flutter_community/korea_flutter_community.settings.dart';
import '../flutterbase/services/flutterbase.push_notification.service.dart';

import '../flutterbase/etc/flutterbase.globals.dart';

/// 앱 모델
///
/// 앱의 전반적인 State 을 담당한다.
/// 하지만, 특정 부분(기능, 또는 특정 부분에서만 쓰이는 기능)에 대한 State 는 따로 관리를 한다. 예) 파일업로드 모델
///
class AppModel extends ChangeNotifier {
  /// 사이드 메뉴가 열렸는지 아닌지 판단
  /// true - open
  /// false - closed
  bool drawer = false;

  AppModel() {

    init();
  }

  init() {

    var push = FlutterbasePushNotificationService();
    push.init();
  }

  /// 라우트 정의
  ///
  /// 필요에 따라 변경해서 사용하면 된다.
  String homePage = 'home';
  String registerPage = 'register';
  String loginPage = 'login';
  String categoryEditPage = 'categoryEdit';
  String categoryListPage = 'categoryList';
  String postListPage = 'postList';
  String postViewPage = 'postView';
  String adminPage = 'admin';

  /// Returns the context of [navigatorKey]
  BuildContext get context => fb.context;

  notify() {
    notifyListeners();
  }
}
