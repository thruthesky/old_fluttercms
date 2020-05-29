import 'package:flutter/material.dart';
import 'package:fluttercms/flutterbase/flutterbase.globals.dart';
import 'package:fluttercms/flutterbase/widgets/flutterbase.appbar.dart';
import 'package:fluttercms/flutterbase/widgets/user/flutterbase.register_form.dart';
import 'package:fluttercms/services/app.defines.dart';
import 'package:fluttercms/services/app.globals.dart';
import 'package:fluttercms/widgets/app.drawer.dart';
import 'package:fluttercms/widgets/app.padding.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FlutterbaseAppBar(
        title: t('Register'),
        onTapUserPhoto: () =>
            open(fb.loggedIn ? Routes.register : Routes.login),
      ),
      endDrawer: AppDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AppPadding(
            child: FlutterbaseRegisterFrom(
              onError: alert,
              onRegisterSuccess: () => open(Routes.home),
              onUpdateSuccess: () => alert(t('profile updated')),
            ),
          ),
        ],
      ),
    );
  }
}
