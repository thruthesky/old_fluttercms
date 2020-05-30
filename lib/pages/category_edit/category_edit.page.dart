import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttercms/flutterbase/etc/flutterbase.category.helper.dart';
import 'package:fluttercms/flutterbase/etc/flutterbase.defines.dart';
import 'package:fluttercms/flutterbase/etc/flutterbase.globals.dart';
import 'package:fluttercms/flutterbase/widgets/flutterbase.button.dart';
import 'package:fluttercms/flutterbase/widgets/flutterbase.text.dart';
import 'package:fluttercms/services/app.globals.dart';
import 'package:fluttercms/services/app.space.dart';
import 'package:fluttercms/widgets/app.drawer.dart';
import 'package:fluttercms/widgets/app.padding.dart';

class CategoryEditPage extends StatefulWidget {
  @override
  _CategoryEditPageState createState() => _CategoryEditPageState();
}

class _CategoryEditPageState extends State<CategoryEditPage> {
  FlutterbaseCategory category;
  bool inDelete = false;
  bool inLoading = false;

  final TextEditingController _idController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  /// TODO - form validation
  // getFormData() {
  //   final String id = _idController.text;
  //   final String title = _titleController.text;
  //   final String description = _descriptionController.text;

  //   final data = {
  //     'title': title,
  //     'description': description,
  //   };
  //   if (isCreate)
  //     data['id'] = id;
  //   else
  //     data['id'] = category.id;
  //   return data;
  // }

  bool get isCreate {
    return category == null;
  }

  bool get isUpdate {
    return !isCreate;
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 10), () async {
      var _args = routerArguments(context);
      if (_args != null && _args['category'] != null) {
        category = _args['category'];
        setState(() {
          _titleController.text = category.title;
          _descriptionController.text = category.description;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: T(isCreate ? category?.id ?? '' : 'category create'),
      ),
      endDrawer: AppDrawer(),
      body: AppPadding(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (isCreate) ...[
                AppSpace.halfBox,
                TextField(
                  controller: _idController,
                  onSubmitted: (text) {},
                  decoration: InputDecoration(
                    hintText: t('input category id'),
                  ),
                ),
              ],
              if (isUpdate) Text(category.id),
              AppSpace.halfBox,
              TextField(
                controller: _titleController,
                onSubmitted: (text) {},
                decoration: InputDecoration(
                  hintText: t('input category title'),
                ),
              ),
              AppSpace.halfBox,
              TextField(
                controller: _descriptionController,
                onSubmitted: (text) {},
                decoration: InputDecoration(
                  hintText: t('input category description'),
                ),
              ),
              FlutterbaseButton(
                loader: inLoading,
                text: isCreate ? CREATE_CATEGORY : UPDATE_CATEGORY,
                onPressed: () async {
                  setState(() => inLoading = true);
                  try {
                    final FlutterbaseCategory _category = await fb.categoryEdit(
                        id: isCreate ? _idController.text : category.id,
                        title: _titleController.text,
                        description: _descriptionController.text);
                    setState(() => inLoading = false);
                    back(arguments: _category);
                  } catch (e) {
                    setState(() => inLoading = false);
                    print(e);
                    alert(e);
                  }
                },
              ),
              if (isUpdate)
                FlutterbaseButton(
                  loader: inDelete,
                  text: DELETE_CATEGORY,
                  onPressed: () async {
                    if (inDelete) return;

                    /// 삭제 확인
                    confirm(
                      title: t(CONFIRM_CATEGORY_DELETE_TITLE),
                      content: t(CONFIRM_CATEGORY_DELETE_CONTENT),
                      onYes: () async {
                        setState(() => inDelete = true);
                        try {
                          var re = await fb.categoryDelete(this.category.id);
                          print('re: ');
                          print(re);
                          back(arguments: re);
                        } catch (e) {
                          alert(e);
                          setState(() => inDelete = false);
                        }
                      },
                      onNo: () {
                        // print('no');
                      },
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
