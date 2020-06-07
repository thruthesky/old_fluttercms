import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import './flutterbase/etc/flutterbase.app.localization.dart';
import './flutterbase/etc/flutterbase.defines.dart';
import './flutterbase/etc/flutterbase.globals.dart';
import './flutterbase/tests/flutterbase.test.dart';
import './services/app.defines.dart';
import './services/app.globals.dart';
import './services/app.router.dart';
import './settings.dart';

void main() async {
  /// Hive 를 준비한다.
  ///
  /// TODO: `Hive.initFlutter();` 코드는 반드시 여기에 위치해야 하는데, `Flutter Engine` 에서 assert 처리를 한다.
  /// TODO: 2020. 06. 06. 현재 Hive 를 사용하지 않음.
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
    Timer(Duration(milliseconds: 100), () async {
      // await openForumBox(
      //   FlutterbasePostEditForm(id: 'qna'),
      // );
      // open(
      //   Routes.postList,
      //   arguments: {'id': 'discussion'},
      // );

      open(
        Routes.login,
      );
    });

    // 테스트 용도
    // 회원 로그인을 하면, 회원 정보 창을 연다.
    // fb.auth.onAuthStateChanged.listen((u) async {
    //   if ( u != null ) {
    //     open(Routes.register);
    //   }
    // });

    if (kDebugMode && Settings.testApp) {
      FlutterbaseTest();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => app),
        ChangeNotifierProvider(create: (context) => fb),
      ],
      child: MaterialApp(
        title: '플러터 커뮤니티 앱',
        initialRoute: Routes.home,
        // initialRoute: Routes.login,
        // initialRoute: Routes.register,
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.indigo,
          // primarySwatch: Colors.yellow
          // primarySwatch: Colors.amber, // background is amber. object should be black.
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
