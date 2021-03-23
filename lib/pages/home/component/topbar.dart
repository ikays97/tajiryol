import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeTopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      padding: EdgeInsets.only(
        top: statusBarHeight,
        left: 10,
        right: 10,
        bottom: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 75,
                  child: Image.asset('assets/images/logo.jpeg'),
                ),
              ),
              Spacer(),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Theme.of(context).splashColor,
                  // padding: const EdgeInsets.fromLTRB(6, 6, 8, 6),
                  child: Container(
                    child: Stack(
                      children: <Widget>[
                        Center(
                          child: SvgPicture.asset(
                            'assets/icons/cart.svg',
                            height: 35,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                        Positioned(
                          right: 9,
                          top: 13,
                          child: _badgeWidget(context, "2"),
                        )
                      ],
                    ),
                  ),
                  onTap: () {},
                ),
              ),
            ],
          ),
          Container(
            color: Theme.of(context).backgroundColor,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                      onTap: () {
                        // Navigator.push(context,
                        //     CupertinoPageRoute(builder: (BuildContext context) {
                        //   return SearchPage();
                        // }));
                      },
                      child: Container(
                        height: 34.0,
                        padding: EdgeInsets.all(5.0),
                        color: Color.fromRGBO(238, 238, 238, 0.5),
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: 5),
                              child: SvgPicture.asset(
                                'assets/icons/search.svg',
                                color: Color(0xFF979797),
                                height: 20,
                              ),
                            ),
                            Text(
                              'search_hint'.tr,
                              style: TextStyle(
                                fontSize: 15.0,
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
          ),
        ],
      ),
    );
  }

  Container _badgeWidget(BuildContext context, String count) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 1.5,
          color: Colors.white,
        ),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: 15, minHeight: 15),
        child: Container(
          height: 15,
          width: 15,
          padding: EdgeInsets.only(
              left: 4, right: 2, bottom: Platform.isIOS ? 1 : 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            count,
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
