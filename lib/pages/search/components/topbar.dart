import 'package:flutter/material.dart';
import 'package:yupekyol/constants/color.dart';
import 'package:yupekyol/constants/string.dart';

class SearchTopBarLeadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child:
          Icon(Icons.keyboard_arrow_left, color: Color(0xFF979797), size: 26),
    );
  }
}

class SearchTopBarActionWidget extends StatelessWidget {
  final VoidCallback onActionTap;
  SearchTopBarActionWidget({this.onActionTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onActionTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Text(
          KString.searchBtTxt,
          style: TextStyle(
              color: KColorConstant.goPayBtBgColor,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
