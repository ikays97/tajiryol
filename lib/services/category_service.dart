import 'package:tajiryol/models/category.dart';
import 'package:tajiryol/utils/request.dart';

class CategoryDataAPI {
  static Future<CategoryListModel> getCategoryData() async {
    var response = await RequestUtil().get('/categories');
    return CategoryListModel.fromJson(response['data']);
  }
}
