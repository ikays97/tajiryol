// import 'dart:convert';
// import 'package:tajiryol/models/promotion.dart';
// import 'package:flutter/services.dart';

// class PromotionAPI {
//   static Future<PromotionListModel> getPromosData(String slug) async {
//     // var response = await RequestUtil().get('/$slug/sliders');
//     var res = await rootBundle.loadString(
//       'assets/json/tab_${slug}_promo.json',
//     );
//     var response = json.decode(res);
//     return PromotionListModel.fromJson(response['data']);
//   }
// }
