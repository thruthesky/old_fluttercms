import 'package:flutter/material.dart';
import 'package:fluttercms/flutterbase/flutterbase.globals.dart';
import 'package:fluttercms/flutterbase/widgets/flutterbase.text.dart';
import 'package:fluttercms/flutterbase/widgets/user/flutterbase.login_form.dart';
import 'package:fluttercms/services/app.defines.dart';
import 'package:fluttercms/services/app.globals.dart';
import 'package:fluttercms/services/app.space.dart';
import 'package:fluttercms/widgets/app.drawer.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: T('login page title'),
      ),
      endDrawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSpace.space),
          child: FlutterbaseLoginForm(
            hintEmail: t('input email'),
            hintPassword: t('input password'),
            onLogin: (user) => open(Routes.home),
            onError: alert,
          ),
        ),
      ),
    );
  }
}
