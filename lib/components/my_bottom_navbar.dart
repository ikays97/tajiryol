import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tajiryol/icons.dart';
import 'package:tajiryol/pages/main_page/provider/main_provider.dart';

List<Map<String, dynamic>> _tabBarData = [
  {
    "title": "Home",
    "image": SvgIcons.home,
    "selectedImage": SvgIcons.homeSelected,
  },
  {
    "title": "Category",
    "image": SvgIcons.category,
    "selectedImage": SvgIcons.categorySelected,
  },
  {
    "title": "Search",
    "image": SvgIcons.cart,
    "selectedImage": SvgIcons.cartSelected,
  },
  {
    "title": "Liked",
    "image": SvgIcons.heart,
    "selectedImage": SvgIcons.heartSelected,
  },
  {
    "title": "Profile",
    "image": SvgIcons.person,
    "selectedImage": SvgIcons.personSelected,
  },
];

class MyBottomNavigationBar extends StatelessWidget {
  final ValueChanged<int>? onTap;

  const MyBottomNavigationBar({this.onTap});

  @override
  Widget build(BuildContext context) {
    final bottomHeight = 49 +
        MediaQuery.of(context).padding.bottom +
        (Platform.isAndroid ? 2 : 0);
    return SizedBox(
      height: bottomHeight,
      child: _getBottomNavigationBar(context),
    );
  }

  _getBottomNavigationBar(BuildContext context) {
    return Stack(
      children: [
        Selector<MainProvider, int>(
          builder: (_, index, __) {
            return BottomNavigationBar(
              currentIndex: index,
              type: BottomNavigationBarType.fixed,
              selectedFontSize: 0,
              unselectedFontSize: 0,
              unselectedItemColor:
                  Theme.of(context).accentColor.withOpacity(0.4),
              selectedItemColor: Theme.of(context).accentColor,
              elevation: 0,
              onTap: this.onTap,
              items: _getTabBar(context),
            );
          },
          selector: (_, model) => model.getTabBarSelectedIndex,
        ),
        Divider(
          height: 0.5,
          color: Theme.of(context).primaryColor.withOpacity(0.5),
        ),
      ],
    );
  }

  List<BottomNavigationBarItem> _getTabBar(BuildContext context) {
    return _tabBarData.map((item) {
      return _getBottomBarItem(
          item['title'], item['image'], item['selectedImage'], context);
    }).toList();
  }

  BottomNavigationBarItem _getBottomBarItem(
      String title, Widget image, Widget selectedImage, BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _tabBarIconWidth = _screenWidth / _tabBarData.length;
    const _tabBarIconHeight = 26.0;

    return BottomNavigationBarItem(
      icon: Container(
        child: Stack(
          children: [
            image,
            // SvgPicture.asset(

            //   width: _tabBarIconWidth,
            //   height: _tabBarIconHeight,
            //   color: Theme.of(context).accentColor.withOpacity(0.5),
            // ),
          ],
        ),
      ),
      activeIcon: Stack(
        children: [
          selectedImage,
          // SvgPicture.asset(

          //   width: _tabBarIconWidth,
          //   height: _tabBarIconHeight,
          //   color: Theme.of(context).accentColor,
          // ),
        ],
      ),
      label: '',
    );
  }
}
