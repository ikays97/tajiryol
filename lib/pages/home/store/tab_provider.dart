import 'package:flutter/foundation.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tajiryol/models/brand.dart';
import 'package:tajiryol/models/promotion.dart';
import 'package:tajiryol/models/slider.dart';
import 'package:tajiryol/models/subcategory.dart';
import 'package:tajiryol/models/tab.dart';
import 'package:tajiryol/services/tab_service.dart';

class TabProvider with ChangeNotifier {
  final String slug;

  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  bool loading = true;
  List<Slider> sliders = [];
  List<Subcategory> subcategories = [];
  List<Brand> brands = [];
  List<Promotion> promotions = [];

  TabProvider({this.slug}) {
    // tab data loading
    initData();
  }

  Future initData({bool refresh = false}) async {
    TabModel response = await TabAPI.getData(slug);

    sliders = response.sliders;
    subcategories = response.subcategories;
    brands = response.brands;
    promotions = response.promotions;
    loading = false;

    /// Pull down to refresh
    if (refresh) {
      sliders = response.sliders;
      subcategories = response.subcategories;
      brands = response.brands;
      promotions = response.promotions;
      loading = false;
      refreshController.refreshCompleted();
    }
    notifyListeners();
  }
}
