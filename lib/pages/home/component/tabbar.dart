import 'package:flutter/material.dart';
import 'package:tajiryol/models/maincategory.dart';

class KTabBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final List<Maincategory> tabs;

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
          indicatorColor: Theme.of(context).primaryColor,
          indicatorSize: TabBarIndicatorSize.label,
          isScrollable: true,
          unselectedLabelColor: Colors.grey,
          labelColor: Theme.of(context).primaryColor,
          tabs: tabs
              .map((tab) => Container(
                    height: 30.0,
                    child: Tab(
                      text: tab.nameTM,
                    ),
                  ))
              .toList()),
    );
  }
}
