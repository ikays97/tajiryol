import 'package:flutter/material.dart';

/// appbar
enum AppBarBackType { Back, Close, None }

const double kNavigationBarHeight = 44.0;

// AppBar
class MyAppBar extends AppBar implements PreferredSizeWidget {
  MyAppBar({
    Key key,
    Widget title,
    AppBarBackType leadingType,
    WillPopCallback onWillPop,
    Widget leading,
    Brightness brightness,
    Color backgroundColor,
    bool centerTitle = false,
    double elevation,
    PreferredSizeWidget bottom,
    BuildContext context,
  }) : super(
          key: key,
          title: title ??
              Container(
                margin: EdgeInsets.only(left: 10.0),
                child: Image.asset(
                  "assets/images/logo.jpeg",
                  width: 95,
                  color: Theme.of(context).primaryColor,
                ),
              ),
          centerTitle: centerTitle,
          backgroundColor: Theme.of(context).primaryColor,
          leading: leading ??
              (leadingType == AppBarBackType.None
                  ? null
                  : AppBarBack(
                      leadingType ?? AppBarBackType.Back,
                      onWillPop: onWillPop,
                    )),
          actions: [],
          elevation: elevation ?? 0.5,
          bottomOpacity: 0.9,
          bottom: bottom,
        );
  @override
  get preferredSize => Size.fromHeight(bottom == null ? 44 : 92);
}

class AppBarBack extends StatelessWidget {
  final AppBarBackType _backType;
  final WillPopCallback onWillPop;

  AppBarBack(this._backType, {this.onWillPop});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final willBack = onWillPop == null ? true : await onWillPop();
        if (!willBack) return;
        Navigator.pop(context);
      },
      child: _backType == AppBarBackType.Close
          ? Container(
              child: Icon(Icons.close,
                  color: Theme.of(context).accentColor, size: 24.0),
            )
          : Container(
              margin: EdgeInsets.only(right: 15, left: 15),
              child: Image.asset(
                'assets/icons/nav_back.png',
                color: Theme.of(context).accentColor,
              ),
            ),
    );
  }
}

class MyTitle extends StatelessWidget {
  final String _title;

  MyTitle(this._title);

  @override
  Widget build(BuildContext context) {
    return Text(
      _title,
      style: TextStyle(
          color: Theme.of(context).textTheme.bodyText2.color,
          fontSize: 16,
          fontWeight: FontWeight.w500),
    );
  }
}
