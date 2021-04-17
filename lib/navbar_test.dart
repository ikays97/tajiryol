import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

const Color BACKGROUND_COLOR = Color(0xffE2E7F2);

class CustomNavBar extends StatefulWidget {
  final Color backgroundColor;
  final Color itemColor;
  final List<CustomNavBarItem> children;
  final Function(int) onChange;
  final int currentIndex;

  const CustomNavBar({
    Key key,
    this.backgroundColor,
    this.itemColor,
    this.onChange,
    this.currentIndex,
    @required this.children,
  }) : super(key: key);

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  void _onChangeIndex(int index) {
    if (widget.onChange != null) {
      widget.onChange(index);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 60,
      color: widget.backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widget.children.map((item) {
          var color = item.color ?? widget.itemColor;
          var icon = item.icon;
          var label = item.label;
          int index = widget.children.indexOf(item);
          return GestureDetector(
            onTap: () {
              _onChangeIndex(index);
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              width: size.width / widget.children.length - 10,
              padding: const EdgeInsets.only(left: 10, right: 10),
              margin: const EdgeInsets.all(4),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: widget.currentIndex == index
                    ? color.withOpacity(0.3)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    child: icon,
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class CustomNavBarItem {
  final SvgPicture icon;
  final String label;
  final Color color;

  CustomNavBarItem({this.icon, this.label, this.color});
}
