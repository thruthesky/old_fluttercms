import 'package:flutter/material.dart';
import '../../flutterbase/etc/flutterbase.globals.dart';
import '../../flutterbase/widgets/flutterbase.text.dart';
import '../../flutterbase/widgets/user/flutterbase.login_form.dart';
import 'package:fluttercms/services/app.defines.dart';
import 'package:fluttercms/widgets/app.drawer.dart';
import 'package:fluttercms/widgets/app.padding.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: T('login page title'),
      ),
      endDrawer: AppDrawer(),
      body: AppPadding(
        child: FlutterbaseLoginForm(
          onLogin: (user) => open(Routes.home),
          onError: alert,
        ),
      ),
    );
  }
}
