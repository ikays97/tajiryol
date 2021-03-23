import 'package:flutter/material.dart';
import 'package:tajiryol/models/tab.dart';

class KTabBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final List<TabModel> tabs;

  const KTabBarWidget({Key key, @required this.tabs}) : super(key: key);

  get preferredSize {
    return Size.fromHeight(30);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 5),
      child: TabBar(
          indicatorColor: Theme.of(context).accentColor,
          indicatorSize: TabBarIndicatorSize.label,
          isScrollable: true,
          labelColor: Theme.of(context).accentColor,
          tabs: tabs
              .map((tab) => Container(
                    height: 30.0,
                    child: new Tab(
                      text: tab.name_tm,
                    ),
                  ))
              .toList()),
    );
  }
}
