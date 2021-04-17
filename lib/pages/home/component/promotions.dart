import 'package:flutter/material.dart';
import 'package:tajiryol/components/my_cached_image.dart';
import 'package:tajiryol/models/promotion.dart';

class TabPromotions extends StatelessWidget {
  final List<Promotion> data;
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
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          margin: EdgeInsets.only(bottom: 5, left: 2),
          width: size.width,
          height: size.height * 0.2,
          child: MyCachedNetworkImage(
            imageurl: i.bannerTM,
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
