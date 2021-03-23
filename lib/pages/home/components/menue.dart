import 'package:flutter/material.dart';
import 'package:yupekyol/models/brand.dart';
import 'package:yupekyol/utils/screen_util.dart';

class HomeBrandsWidget extends StatelessWidget {
  final List<BrandItem> data;
  final String bgurl;
  final String fontColor;
  HomeBrandsWidget({this.data, this.bgurl, this.fontColor});
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    return _buildRow(deviceHeight);
  }

  Widget _buildRow(double deviceHeight) {
    // var colorInt = int.parse(fontColor.replaceAll('#', '0x'));
    // Color color = new Color(colorInt).withOpacity(1.0);
    double iconWidth = ScreenUtil().L(60);
    double iconHeight = ScreenUtil().L(60);
    List<Widget> widgets = data.map((i) {
      return Container(
        width: iconWidth,
        height: iconHeight,
        margin: EdgeInsets.all(3),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            // boxShadow: [
            //   BoxShadow(
            //     offset: Offset(1, 0),
            //     blurRadius: 5,
            //     spreadRadius: 0,
            //     color: Colors.black26,
            //   ),
            // ],
            image: DecorationImage(
              image: NetworkImage(
                i.picUrl,
              ),
            )),
      );
    }).toList();
    return Container(
      height: deviceHeight * 0.115,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: widgets,
      ),
    );
  }
}
