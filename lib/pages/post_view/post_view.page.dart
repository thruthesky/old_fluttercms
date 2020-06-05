import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _args = routerArguments(context);
    FlutterbasePost post = _args['post'];
    forum.posts = [post];
    postModel = FlutterbasePostModel(post: post);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => forum),
        ChangeNotifierProvider(create: (context) => postModel),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('${post.title}'),
        ),
        endDrawer: AppDrawer(),
        body: FlutterbasePagePadding(
                  child: SingleChildScrollView(
            child: Consumer<FlutterbaseForumModel>(
              builder: (context, model, child) {
                return FlutterbasePostListView(_args['post']);
              },
            ),
          ),
        ),
      ),
    );
  }
}
