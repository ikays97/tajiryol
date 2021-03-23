import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:tajiryol/models/category.dart';
import 'package:tajiryol/models/sub_category.dart';
import 'package:tajiryol/widgets/my_cached_image.dart';
=======
import 'package:yupekyol/models/categorydata.dart';
import 'package:yupekyol/models/sub_category.dart';
import 'package:yupekyol/pages/search/search.dart';
import 'package:yupekyol/widgets/my_cached_image.dart';
>>>>>>> 03ae24a (sorted structure of the app)

class SubCategorySection extends StatefulWidget {
  final double height;
<<<<<<< HEAD
  final CategoryModel category;
=======
  final CategoryDataModel data;
>>>>>>> 03ae24a (sorted structure of the app)
  final void Function(String) goPage;
  SubCategorySection({Key key, this.height, this.goPage, this.category})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => SubCategorySectionState();
}

class SubCategorySectionState extends State<SubCategorySection> {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerUp: this.dragend,
      child: Container(
        height: widget.height,
        child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(top: 13, bottom: 40),
            controller: controller,
            //  physics: NeverScrollableScrollPhysics(),
            child: Container(
              child: widget.category != null
                  ? SecondryCategory(
                      data: widget.category,
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
              constraints: BoxConstraints(minHeight: widget.height + 5),
            )),
      ),
    );
  }

  dragend(e) {
    double offset = controller.offset;
    double maxExtentLenght = controller.position.maxScrollExtent;
    if (offset < -50) {
      widget.goPage('pre');
    }
    if (offset - maxExtentLenght > 50) {
      widget.goPage('next');
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class SecondryCategory extends StatelessWidget {
  final CategoryModel data;
  SecondryCategory({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<SubCategoryModel> items = data.subcategories;
  final CategoryDataModel data;
  SecondryCategory({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<SubCategoryModel> items = data.list;

    final _deviceWidth = MediaQuery.of(context).size.width;
    final _crossAxisCount = (_deviceWidth - 100) ~/ 80;
    final _childAspectRatio = (_deviceWidth - 100) / _crossAxisCount / 100;

    return Column(
      children: <Widget>[
        GridView.count(
          childAspectRatio: _childAspectRatio,
          crossAxisCount: _crossAxisCount,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: items.map((i) {
            return GestureDetector(
              onTap: () {},
              child: Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 7),
                        height: 50,
                        width: 50,
                        child: MyCachedNetworkImage(
                          imageurl: i.icon,
                        ),
                      ),
                      Text(
                        i.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  )),
            );
          }).toList(),
        ),
      ],
    );
  }
}
