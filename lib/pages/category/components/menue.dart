import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
<<<<<<< HEAD
import 'package:tajiryol/models/category.dart';

class CategoryMenue extends StatefulWidget {
  final List<CategoryModel> categories;
=======
import 'package:yupekyol/models/categorydata.dart';

class CategoryMenue extends StatefulWidget {
  final List<CategoryDataModel> items;
>>>>>>> 03ae24a (sorted structure of the app)
  final double itemHeight;
  final double itemWidth;
  final ValueChanged<int> menueTaped;
  CategoryMenue({
    Key key,
    this.categories,
    this.itemHeight,
    this.itemWidth,
    this.menueTaped,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => CategoryMenueState();
}

class CategoryMenueState extends State<CategoryMenue>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  int currentItemIndex = 0;
  @override
  Widget build(BuildContext context) {
    int len = widget.categories.length;
    List<Widget> widgets = List.generate(len, (i) {
      return InkWell(
        onTap: () => _menueTaped(i),
        child: Container(
          height: widget.itemHeight,
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                child: Image.network(
                  widget.categories[i].icon,
                  color: currentItemIndex == i
                      ? Theme.of(context).accentColor
                      : Theme.of(context).secondaryHeaderColor,
                  height: currentItemIndex == i ? 37 : 35,
          child: currentItemIndex == i
              ? Container(
                  padding:
                      EdgeInsets.only(top: 5, bottom: 5, left: 12, right: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    widget.items[i].name,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                )
              : Container(
                  child: Text(
                    widget.items[i].name,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF4A4A4A),
                    ),
                  ),
                ),
              ),
              Text(
                widget.categories[i].name,
                style: TextStyle(
                  fontSize: currentItemIndex == i ? 16 : 14,
                  color: currentItemIndex == i
                      ? Theme.of(context).accentColor
                      : Theme.of(context).secondaryHeaderColor,
                ),
              ),
            ],
          ),
        ),
      );
    });

    return Stack(
      children: <Widget>[
        Positioned(
          width: widget.itemWidth,
          height: widget.itemHeight,
          top: animation.value,
          child: Stack(
            children: <Widget>[
              Container(
                color: Color(0xFFFFFFFF),
              ),
              Positioned(
                top: 20,
                child: Container(
                  width: 2,
                  height: widget.itemHeight - 30,
                  color: Theme.of(context).accentColor,
                ),
              )
            ],
          ),
        ),
        Column(
          children: widgets,
        ),
      ],
    );
  }

  _menueTaped(int i) {
    widget.menueTaped(i);
    moveToTap(i);
  }

  moveToTap(int i) {
    double begin = currentItemIndex * widget.itemHeight;
    double end = i * widget.itemHeight;
    //print('begin'+begin.toString()+"-----"+end.toString());
    animation = Tween(begin: begin, end: end)
        .animate(new CurvedAnimation(parent: controller, curve: Curves.linear));
    controller.addStatusListener((status) {
      if (AnimationStatus.completed == status) {
        //  print(currentItemIndex);
        currentItemIndex = i;
      }
    });

    controller.forward(from: 0);
  }

  initState() {
    controller =
        AnimationController(duration: Duration(milliseconds: 150), vsync: this);
    animation = Tween(begin: 0.0, end: 0.0).animate(controller);
    controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
