// import '../../../pages/post_edit/post.edit.page.dart';

import 'package:korea_flutter_community/apps/korea_flutter_community/pages/home/korea_flutter_community.home.page.dart';

import '../../../pages/post_view/post_view.page.dart';

import '../../../pages/admin/admin.page.dart';
import '../../../pages/category_edit/category_edit.page.dart';
import '../../../pages/category_list/category_list.page.dart';
import '../../../pages/login/login.page.dart';
import '../../../pages/post_list/post_list.page.dart';
import '../../../pages/register/register.page.dart';
import '../../../services/app.globals.dart';

import 'package:flutter/material.dart';

class KoreaFluttetrCommunityRouter {
  ///
  /// Opens a page
  /// [nextRoute] is the route to open
  /// [closeDrawer] closes one more route if it's true causing the opened drawer to be closed.
  static Future open(
    context,
    nextRoute, {
    Map<String, dynamic> arguments,
  }) {
    /// If the drawer if opened, then close it.
    if (app.drawer) {
      return Navigator.popAndPushNamed(
        context,
        nextRoute,
        arguments: arguments,
      );
    } else {
      return Navigator.pushNamed(
        context,
        nextRoute,
        arguments: arguments,
      );
    }
  }

  static Route<dynamic> generate(RouteSettings settings) {
    Route route;
    if (settings.name == app.homePage)
      route = _buildRoute(settings, KoreaFlutterCommunityHomePage());
    else if (settings.name == app.registerPage)
      route = _buildRoute(settings, RegisterPage());
    else if (settings.name == app.loginPage)
      route = _buildRoute(settings, LoginPage());
    // else if (settings.name == app.helpPage)
    //   route = _buildRoute(settings, HelpPage());
    // else if (settings.name == app.settingsPage)
    //   route = _buildRoute(settings, SettingsPage());
    else if (settings.name == app.categoryEditPage)
      route = _buildRoute(settings, CategoryEditPage());
    else if (settings.name == app.categoryListPage)
      route = _buildRoute(settings, CategoryListPage());
    else if (settings.name == app.postListPage)
      route = _buildRoute(settings, PostListPage());
    // // else if (settings.name == app.postCreatePage)
    // //   route = _buildRoute(settings, PostEditPage());
    else if (settings.name == app.postViewPage)
      route = _buildRoute(settings, PostViewPage());
    else if (settings.name == app.adminPage)
      route = _buildRoute(settings, AdminPage());
    return route;
  }

  static MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return new MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) => builder,
    );
  }
}
