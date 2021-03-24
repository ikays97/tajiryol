import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tajiryol/models/maincategory.dart';
import 'package:tajiryol/services/maincat_service.dart';

class IndexProvider with ChangeNotifier {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  bool loading = true;
  List<Maincategory> tabs = [];

  IndexProvider() {
    // home data loading
    initData();
  }

  Future<void> initData({bool refresh = false}) async {
    MaincategoryList categoryResponse = await MainCatAPI.getData();
    tabs = categoryResponse.maincategories;
    loading = false;
    if (refresh) {
      tabs = categoryResponse.maincategories;
      loading = false;
      refreshController.refreshCompleted();
    }
    notifyListeners();
  }
}
