import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:yupekyol/constants/color.dart';
import 'package:yupekyol/pages/search/search.dart';

class HomeTopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      // color: Colors.orange,
      padding: EdgeInsets.only(
          top: statusBarHeight, left: 10, right: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 75,
                  child: Image.asset('assets/images/yupekyol_logo.jpeg'),
                ),
              ),
              Spacer(),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: KColorConstant.themeColor,
                  // padding: const EdgeInsets.fromLTRB(6, 6, 8, 6),
                  child: Container(
                    child: Stack(
                      children: <Widget>[
                        Center(
                          child: Icon(
                            Icons.shopping_bag_outlined,
                            color: Colors.black,
                            size: 35,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: _badgeWidget("2"),
                        )
                      ],
                    ),
                  ),
                  onTap: () {},
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (BuildContext context) {
                        return SearchPage();
                      }));
                    },
                    child: Container(
                      height: 34.0,
                      padding: EdgeInsets.all(5.0),
                      color: Color.fromRGBO(238, 238, 238, 0.5),
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: 5),
                            child: Icon(
                              Icons.search,
                              color: Color(0xFF979797),
                              size: 22,
                            ),
                          ),
                          Text(
                            'Gozleg',
                            style: TextStyle(
                              fontSize: 13.0,
                              color: Color(0xFF979797),
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container _badgeWidget(String count) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1.5, color: Colors.white),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: 15, minHeight: 15),
        child: Container(
          height: 14,
          width: 14,
          padding: EdgeInsets.only(
              left: 4, right: 4, bottom: Platform.isIOS ? 1 : 0),
          decoration: BoxDecoration(
            color: Color(0xFFB80821),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              count,
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
