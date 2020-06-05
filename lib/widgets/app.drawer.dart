
import 'package:flutter/material.dart';
import '../flutterbase/etc/flutterbase.defines.dart';
import '../flutterbase/etc/flutterbase.globals.dart';
import '../flutterbase/widgets/flutterbase.text.dart';
import '../services/app.colors.dart';
import '../services/app.defines.dart';
import '../services/app.globals.dart';
import '../services/app.keys.dart';
import '../services/app.router.dart';
import '../services/app.space.dart';

class AppDrawer extends StatefulWidget {
  AppDrawer({this.select});
  final String select;
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  bool showWordListMenus = false;

  @override
  void initState() {
    // print('_AppDrawerState::initState');
    app.drawer = true;
    super.initState();
  }

  @override
  void dispose() {
    // print('_AppDrawerState::dispose');
    app.drawer = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      key: Key(AppKey.drawer),
      child: ListView(
        padding: EdgeInsets.only(bottom: AppSpace.space),
        children: <Widget>[
          Container(
            height: 100,
            child: DrawerHeader(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.only(top: 20, left: 12),
              decoration: BoxDecoration(color: AppColor.primaryColor),
              child: T(
                APP_TITLE,
                style: TextStyle(color: AppColor.white, fontSize: 18),
              ),
            ),
          ),
          MenuItem(
            title: t('home'),
            icon: Icons.home,
            onTap: () {
              AppRouter.open(context, Routes.home);
            },
          ),
          DrawerDivider(title: t('Member')),
          MenuItem(
            title: t(fb.loggedIn ? PROFILE_UPDATE_TITLE : REGISTER_TITLE),
            icon: Icons.person_add,
            onTap: () {
              AppRouter.open(context, Routes.register);
            },
          ),
          if (fb.notLoggedIn)
            MenuItem(
              title: t('login'),
              icon: Icons.arrow_forward,
              onTap: () {
                AppRouter.open(context, Routes.login);
              },
            ),

          if (fb.loggedIn)
            MenuItem(
              title: t('logout'),
              icon: Icons.reply,
              onTap: () async {
                await fb.logout();
                AppRouter.open(context, Routes.home);
              },
            ),
          DrawerDivider(title: t('forum')),
          MenuItem(
            title: t('discussion'),
            icon: Icons.chat_bubble,
            onTap: () {
              AppRouter.open(context, Routes.postList, arguments: {'id': 'discussion'});
            },
          ),
          MenuItem(
            title: t('qna'),
            icon: Icons.live_help,
            onTap: () {
              AppRouter.open(context, Routes.postList, arguments: {'id': 'qna'});
            },
          ),
          MenuItem(
            title: t('새소식'),
            icon: Icons.fiber_new,
            onTap: () {
              AppRouter.open(context, Routes.postList, arguments: {'id': 'news'});
            },
          ),
          MenuItem(
            title: t('정보 공유'),
            icon: Icons.screen_share,
            onTap: () {
              AppRouter.open(context, Routes.postList, arguments: {'id': 'share'});
            },
          ),
          DrawerDivider(title: t('Etc')),
          MenuItem(
            title: t('help'),
            icon: Icons.help_outline,
            onTap: () {
              AppRouter.open(context, Routes.help);
            },
          ),
          MenuItem(
            title: t('setting'),
            icon: Icons.settings,
            onTap: () {
              AppRouter.open(context, Routes.settings);
            },
          ),
          if (fb.isAdmin) MenuItem(
            title: t('Admin Dashboard'),
            icon: Icons.settings,
            onTap: () {
              AppRouter.open(context, Routes.admin);
            },
          ),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({
    Key key,
    @required this.title,
    @required this.onTap,
    this.icon,
    this.isSelected,
    this.paddingLeft,
    this.fontSize = 16.0,
    // this.isDense = false,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final Function onTap;
  final bool isSelected;
  // final bool isDense;
  final double paddingLeft;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListTile(
        leading: Icon(icon, size: 25.0, color: Colors.black),
        title: Text(
          title,
          style: TextStyle(fontSize: fontSize, color: Colors.black),
        ),
        onTap: onTap,
      ),
    );
  }
}

class DrawerDivider extends StatelessWidget {
  DrawerDivider(
      {@required this.title,
      this.padding =
          const EdgeInsets.only(top: 26.0, left: 18.0, bottom: 4.0)});

  final String title;
  final EdgeInsets padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: padding,
      child: Text(
        title,
        style: TextStyle(
            fontSize: 12.0,
            color: Colors.grey[600],
            fontStyle: FontStyle.italic),
      ),
    );
  }
}
