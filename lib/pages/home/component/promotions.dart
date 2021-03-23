import 'package:flutter/material.dart';
import 'package:tajiryol/models/promotion.dart';
import 'package:tajiryol/widgets/my_cached_image.dart';

class TabPromotions extends StatelessWidget {
  final List<PromotionModel> data;
  TabPromotions({this.data});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: _build(size),
    );
  }

  Widget _build(Size size) {
    List<Widget> listWidgets = data.map((i) {
      // var bgColor = string2Color(i.bgColor);
      // Color titleColor = string2Color(i.titleColor);
      // Color subtitleColor = string2Color(i.subtitleColor);
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          margin: EdgeInsets.only(bottom: 5, left: 2),
          width: size.width,
          height: size.height * 0.2,
          child: MyCachedNetworkImage(
            imageurl: i.picUrl,
          ),
        ),
      );
    }).toList();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: listWidgets,
      ),
    );
  }
}
