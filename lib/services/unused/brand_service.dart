// import 'dart:convert';
// import 'package:tajiryol/models/brand.dart';
// import 'package:flutter/services.dart' show rootBundle;

// class BrandAPI {
//   static Future<BrandItemList> getBrandsData(String slug) async {
//     print(slug);
//     // var response = await RequestUtil().get('/$slug/brands');
//     var res = await rootBundle.loadString(
//       'assets/json/tab_${slug}_brands.json',
//     );
//     var response = json.decode(res);
//     return BrandItemList.fromJson(response['data']);
//   }
// }
