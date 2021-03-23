import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tajiryol/models/category.dart';
import 'package:tajiryol/services/category_service.dart';

class CategoryProvider with ChangeNotifier {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  bool loading = true;
  List<CategoryModel> categoryDatas = [];

  CategoryProvider() {
    // tab data loading
    initData();
  }

  Future initData({bool refresh = false}) async {
    CategoryListModel response = await CategoryDataAPI.getCategoryData();

    categoryDatas = response.list;
    loading = false;

    /// Pull down to refresh
    if (refresh) {
      categoryDatas = response.list;
      loading = false;
      refreshController.refreshCompleted();
    }
    notifyListeners();
  }
}
