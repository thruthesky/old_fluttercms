import 'package:flutter/material.dart';
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

  init() async {}

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
            ],
          ),
        ),
      ),
    );
  }
}
