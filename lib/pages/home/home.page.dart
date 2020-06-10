import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttercms/flutterbase/services/flutterbase.auth.service.dart';
import 'package:fluttercms/settings.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:kakao_flutter_sdk/auth.dart';
import '../../services/app.globals.dart';
import '../../flutterbase/widgets/flutterbase.page_padding.dart';
import '../../flutterbase/widgets/forum/flutterbase.latest_posts.dart';
import '../../flutterbase/etc/flutterbase.defines.dart';
import '../../flutterbase/etc/flutterbase.globals.dart';
import '../../flutterbase/widgets/flutterbase.appbar.dart';
import '../../flutterbase/widgets/flutterbase.post_create_action_button.dart';
import '../../widgets/app.drawer.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    // final GoogleSignIn _googleSignIn = GoogleSignIn();
    // final FirebaseAuth _auth = FirebaseAuth.instance;

    // final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
    //   email: 'anemail@gmail.com',
    //   password: 'a^swrd.123',
    // ))
    //     .user;
    // print('user:');
    // print(user);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FlutterbaseAppBar(
        title: t(APP_TITLE),
        actions: FlutterbasePostCreateActionButton(),
        onTapUserPhoto: () =>
            open(fb.loggedIn ? app.registerPage : app.loginPage),
      ),
      endDrawer: AppDrawer(),
      body: FlutterbasePagePadding(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterbaseLatestPosts(
                route: app.postViewPage,
              ),
              // RaisedButton(
              //   onPressed: () => open(Routes.categoryList),
              //   child: Text('Category List'),
              // ),
              // RaisedButton(
              //   onPressed: () => open(Routes.categoryEdit),
              //   child: Text('Category Edit'),
              // ),
              // RaisedButton(
              //   onPressed: () =>
              //       open(Routes.postList, arguments: {'id': 'discussion'}),
              //   child: Text('Discussoin'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
