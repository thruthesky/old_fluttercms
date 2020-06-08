import 'package:flutter/material.dart';
import '../../services/app.globals.dart';
import '../../flutterbase/etc/flutterbase.defines.dart';
import '../../flutterbase/etc/flutterbase.globals.dart';
import '../../flutterbase/widgets/flutterbase.text.dart';
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
                  open(app.categoryListPage);
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
