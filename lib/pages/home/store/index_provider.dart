import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tajiryol/models/tab.dart';
import 'package:tajiryol/services/tab_service.dart';

class IndexProvider with ChangeNotifier {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  bool loading = true;
  List<TabModel> tabs = [];

  HomeProvider() {
    // tabs loading
  IndexProvider() {
    // home data loading
    initData();
  }

  Future<void> initData({bool refresh = false}) async {
    TabListModel categoryResponse = await TabAPI.getTabData();
    tabs = categoryResponse.list;
    loading = false;
    if (refresh) {
      tabs = categoryResponse.list;
      loading = false;
      refreshController.refreshCompleted();
    }
    notifyListeners();
  }
}
