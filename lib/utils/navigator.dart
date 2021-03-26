import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tajiryol/pages/main_page/provider/main_provider.dart';

class MyNavigator {
  // initial context
  static BuildContext ctx;

  // push
  static Future push<T extends Object>(Widget page, {BuildContext context}) {
    final _ctx = context ?? ctx;
    FocusScope.of(_ctx).requestFocus(FocusNode());
    return Navigator.push(_ctx, MaterialPageRoute(builder: (_ctx) => page));
  }

  // pop
  static pop<T extends Object>({BuildContext context, T data}) {
    final _ctx = context ?? ctx;
    return Navigator.pop(_ctx, data);
  }

  static void popToRoot({BuildContext context}) {
    final _ctx = context ?? ctx;
    Navigator.popUntil(_ctx, (predicate) {
      return predicate.isFirst;
    });
  }

  /// to home
  static void popToHome({BuildContext context}) {
    final _ctx = context ?? ctx;
    final mainProvder = Provider.of<MainProvider>(_ctx, listen: false);
    mainProvder.setTabBarSelectedIndex = 0;
    Navigator.popUntil(_ctx, (predicate) {
      return predicate.isFirst;
    });
  }

  static void pushAndRemove(Widget page,
      {int removeCount = 1, BuildContext context}) {
    var index = 0;
    final _ctx = context ?? ctx;
    Navigator.of(_ctx).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page),
      (route) {
        index++;
        return index > removeCount ? true : false;
      },
    );
  }

  // iOS present
  static present(Widget page, {BuildContext context}) {
    final _ctx = context ?? ctx;
    Navigator.of(_ctx).push(
        MaterialPageRoute(fullscreenDialog: true, builder: (context) => page));
  }
}
