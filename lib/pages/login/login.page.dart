import 'package:flutter/material.dart';
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
        child: FlutterbaseLoginForm(
          onLogin: (user) => open(Routes.home),
          onError: alert,
        ),
      ),
    );
  }
}
