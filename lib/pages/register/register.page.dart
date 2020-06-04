import 'package:flutter/material.dart';
import '../../flutterbase/etc/flutterbase.defines.dart';
import '../../flutterbase/etc/flutterbase.globals.dart';
import '../../flutterbase/widgets/flutterbase.appbar.dart';
import '../../flutterbase/widgets/user/flutterbase.register_form.dart';
import '../../services/app.defines.dart';
import '../../widgets/app.drawer.dart';
import '../../flutterbase/widgets/flutterbase.page_padding.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FlutterbaseAppBar(
        title: t(fb.loggedIn ? PROFILE_UPDATE_TITLE : REGISTER_TITLE),
        onTapUserPhoto: () =>
            open(fb.loggedIn ? Routes.register : Routes.login),
      ),
      endDrawer: AppDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlutterbasePagePadding(
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
