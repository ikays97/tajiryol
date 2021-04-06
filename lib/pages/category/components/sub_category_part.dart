import 'package:flutter/material.dart';
import 'package:tajiryol/components/my_cached_image.dart';
import 'package:tajiryol/models/subcategory.dart';

class SubCategorySection extends StatefulWidget {
  final double height;
  final List<Subcategory> subcategories;
  final void Function(String) goPage;
  SubCategorySection({
    Key key,
    this.height,
    this.goPage,
    this.subcategories,
  }) : super(key: key);
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
              child: widget.subcategories != null
                  ? SecondryCategory(
                      subcategories: widget.subcategories,
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
  final List<Subcategory> subcategories;
  SecondryCategory({Key key, this.subcategories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Subcategory> items = subcategories;

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
