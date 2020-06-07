import 'package:flutter/material.dart';
import 'package:korea_flutter_community/services/app.globals.dart';
import '../../../../flutterbase/widgets/flutterbase.page_padding.dart';
import '../../../../flutterbase/widgets/forum/flutterbase.latest_posts.dart';
import '../../../../flutterbase/etc/flutterbase.defines.dart';
import '../../../../flutterbase/etc/flutterbase.globals.dart';
import '../../../../flutterbase/widgets/flutterbase.appbar.dart';
import '../../../../flutterbase/widgets/flutterbase.post_create_action_button.dart';
import '../../../../widgets/app.drawer.dart';

class KoreaFlutterCommunityHomePage extends StatefulWidget {
  KoreaFlutterCommunityHomePage({Key key}) : super(key: key);

  @override
  _KoreaFlutterCommunityHomePageState createState() => _KoreaFlutterCommunityHomePageState();
}

class _KoreaFlutterCommunityHomePageState extends State<KoreaFlutterCommunityHomePage> {
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
              RaisedButton(
                onPressed: () => open(app.categoryListPage),
                child: Text('Category List'),
              ),
              RaisedButton(
                onPressed: () => open(app.categoryEditPage),
                child: Text('Category Edit'),
              ),
              RaisedButton(
                onPressed: () =>
                    open(app.postListPage, arguments: {'id': 'discussion'}),
                child: Text('Discussoin'),
              ),
              FlutterbaseLatestPosts( route: app.postViewPage,  ),
            ],
          ),
        ),
      ),
    );
  }
}
