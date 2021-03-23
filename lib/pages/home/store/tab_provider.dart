import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tajiryol/models/tab.dart';
import 'package:tajiryol/services/tab_service.dart';

class TabProvider with ChangeNotifier {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  bool loading = true;
  TabModel tabData;

  TabProvider() {
    // tab data loading
    initData();
  }

  Future initData({bool refresh = false}) async {
    TabModel response = await TabAPI.getTabData();

    tabData = response;
    loading = false;

    /// Pull down to refresh
    if (refresh) {
      tabData = response;
      loading = false;
      refreshController.refreshCompleted();
    }
    notifyListeners();
  }
}
