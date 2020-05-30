import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fluttercms/flutterbase/etc/flutterbase.app.localization.dart';
import 'package:fluttercms/flutterbase/etc/flutterbase.defines.dart';
import 'package:fluttercms/flutterbase/etc/flutterbase.globals.dart';
import 'package:fluttercms/flutterbase/tests/flutterbase.test.dart';
import 'package:fluttercms/services/app.defines.dart';
import 'package:fluttercms/services/app.globals.dart';
import 'package:fluttercms/services/app.router.dart';
import 'package:fluttercms/settings.dart';
import 'package:provider/provider.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  /// Hive 를 준비한다.
  ///
  /// TODO: `Hive.initFlutter();` 코드는 반드시 여기에 위치해야 하는데, `Flutter Engine` 에서 assert 처리를 한다.
  await Hive.initFlutter();
  await Hive.openBox(CACHE_BOX);
  runApp(TheApp());
}

class TheApp extends StatefulWidget {
  @override
  _TheAppState createState() => _TheAppState();
}

class _TheAppState extends State<TheApp> {
  @override
  void initState() {
    /// 테스트 용도
    ///
    /// 앱이 부팅하자 마자 게시판 카테고리로 이동하게 한다.
    /// 게시판 목록에서 작업을 할 때 편리.
    Timer(
      Duration(milliseconds: 100),
      () => open(
        Routes.postList,
        arguments: {'id': 'discussion'},
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode && Settings.testApp) {
      FlutterbaseTest();
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => app),
        ChangeNotifierProvider(create: (context) => fb),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        initialRoute: Routes.home,
        // initialRoute: Routes.register,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: AppRouter.generate,
        navigatorKey: fb.navigatorKey,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', ''),
          const Locale('ko', ''),
          const Locale('ja', ''),
          const Locale('zh', ''),
        ],
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
