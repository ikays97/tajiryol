import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajiryol/components/my_cached_image.dart';
import 'package:tajiryol/models/subcategory.dart';

class TabSubCategoryGrid extends StatelessWidget {
  final String label;
  final List<Subcategory> subcategories;
  const TabSubCategoryGrid({Key key, @required this.subcategories, this.label})
      : super(key: key);

  //
  List<Widget> _buildGridItem(BuildContext context) {
    final String code = Get.locale.languageCode;
    final _screenWidth = MediaQuery.of(context).size.width;
    List<Widget> gridItemList = [];
    for (int i = 0; i < subcategories.length; i++) {
      gridItemList.add(
        InkWell(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Container(
                    height: _screenWidth * 0.2,
                    width: _screenWidth * 0.3,
                    // padding: EdgeInsets.only(bottom: 2),
                    child: MyCachedNetworkImage(
                      imageurl: subcategories[i].icon,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.only(left: 3, top: 5),
                    child: Text(
                      // subcategories[i].getName(code),
                      subcategories[i].name ?? 'subcategory_no_name',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                            fontSize: 12,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return gridItemList;
  }

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _crossAxisCount = 4;
    final _childAspectRatio = _screenWidth / _crossAxisCount / 140;
    return Container(
      width: _screenWidth - 20,
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 15,
      ),
      margin: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          // if (label != null)
          _buildLabel(context, label),
          GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            mainAxisSpacing: 15.0,
            crossAxisSpacing: 10.0,
            crossAxisCount: _crossAxisCount,
            childAspectRatio: _childAspectRatio,
            children: _buildGridItem(context),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Subcategories for you',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ],
      ),
    );
  }
}
