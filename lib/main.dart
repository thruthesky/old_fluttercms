import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fluttercms/flutterbase/flutterbase.app.localization.dart';
import 'package:fluttercms/flutterbase/flutterbase.globals.dart';
import 'package:fluttercms/flutterbase/tests/flutterbase.test.dart';
import 'package:fluttercms/services/app.defines.dart';
import 'package:fluttercms/services/app.globals.dart';
import 'package:fluttercms/services/app.router.dart';
import 'package:fluttercms/settings.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(TheApp());
}

class TheApp extends StatelessWidget {
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
