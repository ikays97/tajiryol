import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tajiryol/icons.dart';
import 'package:tajiryol/pages/main_page/provider/main_provider.dart';

List<Map<String, dynamic>> _tabBarData = [
  {
    "title": "Esasy",
    "image": SvgIcons.home,
    "selectedImage": SvgIcons.homeSelected,
  },
  {
    "title": "Bolum",
    "image": SvgIcons.category,
    "selectedImage": SvgIcons.categorySelected,
  },
  {
    "title": "Sebet",
    "image": SvgIcons.cart,
    "selectedImage": SvgIcons.cartSelected,
  },
  {
    "title": "Halanym",
    "image": SvgIcons.heart,
    "selectedImage": SvgIcons.heartSelected,
  },
  {
    "title": "Hasabym",
    "image": SvgIcons.person,
    "selectedImage": SvgIcons.personSelected,
  },
];

class MyBottomNavigationBar extends StatelessWidget {
  final ValueChanged<int> onTap;

  const MyBottomNavigationBar({this.onTap});

  @override
  Widget build(BuildContext context) {
    final bottomHeight = 63 +
        MediaQuery.of(context).padding.bottom +
        (Platform.isAndroid ? 2 : 0);
    return Container(
      height: bottomHeight,
      decoration: BoxDecoration(color: Colors.white,
          // borderRadius: BorderRadius.only(
          //   topLeft: Radius.circular(40),
          //   topRight: Radius.circular(40),
          // ),
          boxShadow: [
            BoxShadow(
              blurRadius: 15,
              offset: Offset(1, 0),
              color: Colors.grey[300],
            ),
          ]),
      child: Selector<MainProvider, int>(
        builder: (_, index, __) {
          return CustomBottomBar(
            currentIndex: index,
          );
        },
        selector: (_, model) => model.getTabBarSelectedIndex,
      ),
    );
  }

  // _getBottomNavigationBar(BuildContext context) {
  //   return Stack(
  //     children: [
  //       Selector<MainProvider, int>(
  //         builder: (_, index, __) {
  //           return BottomNavigationBar(
  //             currentIndex: index,
  //             type: BottomNavigationBarType.fixed,
  //             selectedFontSize: 15,
  //             unselectedFontSize: 14,
  //             unselectedItemColor: Colors.white,
  //             selectedItemColor: Theme.of(context).primaryColor,
  //             elevation: 0,
  //             onTap: this.onTap,
  //             items: _getTabBar(context),
  //           );
  //         },
  //         selector: (_, model) => model.getTabBarSelectedIndex,
  //       ),
  //       Divider(
  //         height: 0.5,
  //         color: Theme.of(context).primaryColor.withOpacity(0.5),
  //       ),
  //     ],
  //   );
  // }

  // List<BottomNavigationBarItem> _getTabBar(BuildContext context) {
  //   return _tabBarData.map((item) {
  //     return _getBottomBarItem(
  //         item['title'], item['image'], item['selectedImage'], context);
  //   }).toList();
  // }

  // BottomNavigationBarItem _getBottomBarItem(
  //     String title, Widget image, Widget selectedImage, BuildContext context) {
  //   final _screenWidth = MediaQuery.of(context).size.width;
  //   final _tabBarIconWidth = _screenWidth / _tabBarData.length;
  //   const _tabBarIconHeight = 26.0;

  //   return BottomNavigationBarItem(
  //     icon: Container(
  //       child: selectedImage,
  //     ),
  //     activeIcon: image,
  //     label: title,
  //   );
  // }
}

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    Key key,
    @required this.currentIndex,
  }) : super(key: key);

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(_tabBarData.length, (i) {
        return InkWell(
          onTap: () {
            final state = Provider.of<MainProvider>(context, listen: false);
            state.setTabBarSelectedIndex = i;
          },
          child: buildContainerBottomNav(
            _tabBarData[i]['image'],
            _tabBarData[i]['selectedImage'],
            isSelected: currentIndex == i,
          ),
        );
      }),
    );
  }

  Widget buildContainerBottomNav(Widget icon, Widget selectedIcon,
      {isSelected = false}) {
    return Container(
      padding: EdgeInsets.all(isSelected ? 10 : 12),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xffF29B62) : Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(13),
        boxShadow: isSelected
            ? [
                BoxShadow(
                    color: Colors.grey[300], blurRadius: 10, spreadRadius: 1)
              ]
            : [],
      ),
      height: 50,
      width: 50,
      child: isSelected ? selectedIcon : icon,
    );
  }
}
