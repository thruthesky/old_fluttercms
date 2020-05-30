import 'package:flutter/material.dart';
import 'package:fluttercms/flutterbase/etc/flutterbase.defines.dart';
import 'package:fluttercms/flutterbase/etc/flutterbase.globals.dart';
import 'package:fluttercms/flutterbase/widgets/flutterbase.text.dart';
import '../../services/app.defines.dart';
import '../../widgets/app.drawer.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: T(ADMIN_PAGE),
      ),
      endDrawer: AppDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  open(Routes.categoryList);
                },
                child: T('Category List'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
