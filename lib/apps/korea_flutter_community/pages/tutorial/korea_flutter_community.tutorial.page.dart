import 'package:flutter/material.dart';
import 'package:korea_flutter_community/services/app.space.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../../widgets/app.drawer.dart';

class KoreaFlutterCommunityTutorialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('플러터 강좌'),
      ),
      endDrawer: AppDrawer(),
      body: Container(
        padding: EdgeInsets.all(AppSpace.space),
        child: WebView(
          initialUrl: 'https://cafe.naver.com/ionic2/1869',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
