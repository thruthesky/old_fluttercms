import 'package:flutter/material.dart';
import '../models/app.model.dart';
/// 전체 앱 State 를 관리
///


/// 글로벌 영역에서 instance 를 생성하고, 전체 앱에서 공유를 한다.
AppModel app = AppModel();


Map<dynamic, dynamic> routerArguments(context) {
  return ModalRoute.of(context).settings.arguments;
}

