import 'package:flutter/material.dart';
import 'package:tajiryol/models/brand.dart';

class TabBrandsWidget extends StatelessWidget {
  final List<BrandItem> data;
  final String bgurl;
  final String fontColor;
  TabBrandsWidget({
    this.data,
    this.bgurl,
    this.fontColor,
  });
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    return _buildRow(context, deviceHeight);
  }

  Widget _buildRow(BuildContext context, double deviceHeight) {
    List widgets = data.map((i) {
      return Container(
        width: deviceHeight * 0.08,
        height: deviceHeight * 0.08,
        margin: EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFC4C0C0),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              spreadRadius: 2,
              color: Color(0xFFF3F2F2),
            ),
          ],
          image: DecorationImage(
            image: NetworkImage(
              i.picUrl,
            ),
          ),
        ),
      );
    }).toList();
    return Container(
      height: deviceHeight * 0.1,
      padding: EdgeInsets.only(left: 10),
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: widgets,
      ),
    );
  }
}
