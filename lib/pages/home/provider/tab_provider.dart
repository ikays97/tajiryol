import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:yupekyol/models/brand.dart';
import 'package:yupekyol/models/category.dart';
import 'package:yupekyol/models/slider.dart';
import 'package:yupekyol/models/sub_category.dart';
import 'package:yupekyol/services/brand_service.dart';
import 'package:yupekyol/services/slider_service.dart';

class TabProvider with ChangeNotifier {
  final CategoryModel tab;

  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  bool loading = true;
  List<SliderItem> sliders = [];
  List<SubCategoryModel> subcategories = [];
  List<BrandItem> brands = [];

  TabProvider({this.tab}) {
    // tab data loading
    initData();
  }

  Future initData({bool refresh = false}) async {
    SliderItemList sliderResponse = await SliderAPI.getSlidersData(tab.slug);
    // SubCategoryList subCategoryResponse =
    //     await SubCategoryAPI.getSubCategoriesData(tab.slug);
    BrandItemList brandResponse = await BrandAPI.getBrandsData(tab.slug);

    sliders = sliderResponse.list;
    // subcategories = subCategoryResponse.list;
    brands = brandResponse.list;
    loading = false;

    /// Pull down to refresh
    if (refresh) {
      sliders = sliderResponse.list;
      // subcategories = subCategoryResponse.list;
      brands = brandResponse.list;
      loading = false;
      refreshController.refreshCompleted();
    }
    notifyListeners();
  }
}
