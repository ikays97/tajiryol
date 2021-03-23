import 'package:flutter/material.dart';
import 'package:yupekyol/models/sub_category.dart';

class RecommendFloor extends StatelessWidget {
  final List<SubCategoryModel> data;
  RecommendFloor({this.data});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: _build(size),
    );
  }

  Widget _build(Size size) {
    List<Widget> listWidgets = data.map((i) {
      // var bgColor = string2Color(i.bgColor);
      // Color titleColor = string2Color(i.titleColor);
      // Color subtitleColor = string2Color(i.subtitleColor);
      return Container(
        margin: EdgeInsets.only(bottom: 5, left: 2),
        // color: bgColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: size.width,
              height: size.height * 0.2,
              child: Image.network(
                i.bannerUrl,
                fit: BoxFit.cover,
              ),
            ),
          ],
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
