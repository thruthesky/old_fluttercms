import 'package:flutter/material.dart';
import '../../services/app.globals.dart';
import '../../flutterbase/widgets/flutterbase.space.dart';
import '../../flutterbase/etc/flutterbase.defines.dart';
import '../../flutterbase/etc/flutterbase.globals.dart';
import '../../flutterbase/widgets/flutterbase.appbar.dart';
import '../../flutterbase/widgets/user/flutterbase.register_form.dart';
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
            open(fb.loggedIn ? app.registerPage : app.loginPage),
      ),
      endDrawer: AppDrawer(),
      body: SingleChildScrollView(
              child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

        FlutterbaseBigSpace(),
        FlutterbaseBigSpace(),
            FlutterbasePagePadding(
              child: FlutterbaseRegisterFrom(
                onError: alert,
                onRegisterSuccess: () => open(app.homePage),
                onUpdateSuccess: () => alert(t('profile updated')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
