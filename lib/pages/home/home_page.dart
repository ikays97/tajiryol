import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tajiryol/components/my_loading.dart';
import 'package:tajiryol/pages/home/store/index_provider.dart';
import 'package:tajiryol/pages/home/tab_page.dart';
import 'component/tabbar.dart';
import 'component/topbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final state = Provider.of<IndexProvider>(context);
    return state.loading
        ? Center(child: ProgressIndicatorSmall())
        : SafeArea(
            child: DefaultTabController(
              length: state.tabs.length,
              initialIndex: 0,
              child: Column(
                children: <Widget>[
                  HomeTopBar(),
                  KTabBarWidget(tabs: state.tabs),
                  Expanded(
                    child: TabBarView(
                      children: state.tabs.map((tab) {
                        return MyTab(tabSlug: tab.slug);
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  @override
  bool get wantKeepAlive => true;
}
