import 'package:flutter/material.dart';
import 'package:korea_flutter_community/flutterbase/widgets/flutterbase.circle.dart';
import '../../flutterbase/etc/flutterbase.globals.dart';
import '../../flutterbase/widgets/flutterbase.text.dart';
import '../../flutterbase/widgets/user/flutterbase.login_form.dart';
import '../../services/app.defines.dart';
import '../../widgets/app.drawer.dart';
import '../../flutterbase/widgets/flutterbase.page_padding.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: T('login page title'),
      ),
      endDrawer: AppDrawer(),
      body: FlutterbasePagePadding(
        /// Flutterbase 로그인 폼 위젯
        child: FlutterbaseLoginForm(
          /// 로고. 생략 가능하다.
          /// 생략하면 기본 아이콘이 보인다.
          logo: FlutterbaseCircle(
            elevation: 1.0,
            child: SizedBox(
              width: 128,
              height: 128,
              child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image.asset('assets/korea/icons/flutter_icon.png')),
            ),
          ),

          /// 로그인 성공 후 이벤트 핸들러
          onLogin: (user) => open(Routes.home),
          /// 에러 이벤트 핸들러
          onError: alert,
        ),
      ),
    );
  }
}
