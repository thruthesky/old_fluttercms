// import '../pages/post_edit/post.edit.page.dart';

import 'package:fluttercms/pages/home/home.page.dart';
import 'package:fluttercms/pages/login/login.page.dart';
import 'package:fluttercms/pages/register/register.page.dart';
import 'package:fluttercms/services/app.globals.dart';

import '../services/app.defines.dart';
import 'package:flutter/material.dart';

class AppRouter {
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
    if (settings.name == Routes.home)
      route = _buildRoute(settings, HomePage());
    else if (settings.name == Routes.register)
      route = _buildRoute(settings, RegisterPage());
    else if (settings.name == Routes.login)
      route = _buildRoute(settings, LoginPage());
    // else if (settings.name == Routes.help)
    //   route = _buildRoute(settings, HelpPage());
    // else if (settings.name == Routes.settings)
    //   route = _buildRoute(settings, SettingsPage());
    // else if (settings.name == Routes.categoryEdit)
    //   route = _buildRoute(settings, CategoryEditPage());
    // else if (settings.name == Routes.categoryList)
    //   route = _buildRoute(settings, CategoryListPage());
    // else if (settings.name == Routes.postList)
    //   route = _buildRoute(settings, PostListPage());
    // // else if (settings.name == Routes.postCreate)
    // //   route = _buildRoute(settings, PostEditPage());
    // else if (settings.name == Routes.postView)
    //   route = _buildRoute(settings, PostViewPage());
    // else if (settings.name == Routes.admin)
    //   route = _buildRoute(settings, AdminPage());
    return route;
  }

  static MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return new MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) => builder,
    );
  }
}
