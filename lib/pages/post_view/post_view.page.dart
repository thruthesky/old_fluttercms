import 'dart:async';

import 'package:flutter/material.dart';
import 'package:koreafluttercommunity/flutterbase/etc/flutterbase.globals.dart';
import 'package:koreafluttercommunity/flutterbase/widgets/flutterbase.spinner.dart';
import '../../flutterbase/widgets/flutterbase.page_padding.dart';
import '../../flutterbase/etc/flutterbase.post.helper.dart';
import 'package:provider/provider.dart';
import '../../flutterbase/models/flutterbase.post.model.dart';
import '../../flutterbase/models/flutterbase.forum_list.model.dart';
import '../../flutterbase/widgets/forum/flutterbase.post_list_view.dart';
import '../../services/app.globals.dart';
import '../../widgets/app.drawer.dart';

/// 글 보기는 글 목록의 글 보기 위젯을 가져와 쓴다.
/// 이 때, `FlutterForumModel` 과 `FlutterbasePostModel` 두 개를 Provide 해 주어야 한다.
class PostViewPage extends StatefulWidget {
  @override
  _PostViewPageState createState() => _PostViewPageState();
}

class _PostViewPageState extends State<PostViewPage> {
  FlutterbaseForumModel forum = FlutterbaseForumModel();
  FlutterbasePostModel postModel;
  FlutterbasePost post;

  @override
  void initState() {
    Timer(Duration(milliseconds: 300), () async {
      var _args = routerArguments(context);
      print('args: $_args');
      post = _args['post'];
      if (post != null) {
        // 글이 전달되면 그 글을 사용
      } else if (_args['postId'] != null) {
        // 글 ID 가 입력되었으면, 글을 가져옴
        post = await fb.postGet(_args['postId']);
      } else {
        alert('FlutterbasePost 또는 postId 가 입력되어야합니다.');
      }

      forum.posts = [post];
      postModel = FlutterbasePostModel(post: post);

      setState(() {
        /// 업데이트
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => forum),
        ChangeNotifierProvider(create: (context) => postModel),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(post?.title ?? ''),
        ),
        endDrawer: AppDrawer(),
        body: post == null
            ? FlutterbaseSpinner()
            : FlutterbasePagePadding(
                child: SingleChildScrollView(
                  child: Consumer<FlutterbaseForumModel>(
                    builder: (context, model, child) {
                      return FlutterbasePostListView(post);
                    },
                  ),
                ),
              ),
      ),
    );
  }
}
