import 'package:flutter/material.dart';
import 'package:tajiryol/models/category.dart';
import 'package:tajiryol/pages/category/components/sub_category_part.dart';

class RightListView extends StatefulWidget {
  final double height;
  final ValueChanged<int> listViewChanged;
  final List<Category> categories;
  RightListView({Key key, this.height, this.categories, this.listViewChanged})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => RightListViewState();
}

class RightListViewState extends State<RightListView> {
  int currentPage = 0;
  bool isAnimating = false;
  int itemCount = 0;
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // child: NotificationListener<ScrollEndNotification>(
      //   onNotification: (a){
      //     if(a.depth==0){
      //       // Determine if it is a sliding block and correct it
      //     }
      //   },
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(0),
        controller: controller,
        itemBuilder: _itembuilder,
        itemCount: itemCount,
        itemExtent: widget.height,
      ),
      // ),
    );
  }

  // sub category section
  Widget _itembuilder(BuildContext context, int index) {
    final selectedCategory = widget.categories[index];
    return SubCategorySection(
      subcategories: selectedCategory.categories,
      height: widget.height,
      goPage: goPage,
    );
  }

  void goPage(String tag) {
    if (this.isAnimating) return;
    if (tag == 'pre') {
      if (currentPage == 0) {
        return;
      } else {
        currentPage--;
      }
    } else {
      if (currentPage == itemCount - 1) {
        return;
      } else {
        currentPage++;
      }
    }
    widget.listViewChanged(currentPage);
    animateTopage(currentPage);
  }

  jumpTopage(int i) {
    currentPage = i;
    double offset = widget.height * i;
    this.controller.jumpTo(offset);
  }

  animateTopage(int i) {
    if (this.isAnimating) return;
    currentPage = i;
    this.isAnimating = true;
    double offset = widget.height * i;
    this
        .controller
        .animateTo(offset,
            duration: Duration(milliseconds: 300), curve: Curves.easeOut)
        .then((onValue) => this.isAnimating = false);
  }
}
