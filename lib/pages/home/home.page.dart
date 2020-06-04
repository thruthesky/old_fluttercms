import 'package:flutter/material.dart';
import '../../flutterbase/etc/flutterbase.defines.dart';
import '../../flutterbase/etc/flutterbase.globals.dart';
import '../../flutterbase/widgets/flutterbase.appbar.dart';
import '../../flutterbase/widgets/flutterbase.post_create_action_button.dart';
import 'package:fluttercms/services/app.defines.dart';
import 'package:fluttercms/widgets/app.drawer.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // Firestore.instance
    //     .collection('books')
    //     .document()
    //     .setData({'title': 'title', 'author': 'author'});

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
          actions: FlutterbasePostCreateActionButton(
            // id: _args['id'],
            // forum: forum,
          ),
          onTapUserPhoto: () =>
              open(fb.loggedIn ? Routes.register : Routes.login),
        ),
      endDrawer: AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () => open(Routes.categoryList),
              child: Text('Category List'),
            ),
            RaisedButton(
              onPressed: () => open(Routes.categoryEdit),
              child: Text('Category Edit'),
            ),
            RaisedButton(
              onPressed: () =>
                  open(Routes.postList, arguments: {'id': 'discussion'}),
              child: Text('Discussoin'),
            ),
          ],
        ),
      ),
    );
  }
}
