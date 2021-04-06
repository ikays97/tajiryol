import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFBDBBBB),
            width: 1.0,
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12),
      alignment: Alignment.center,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Color(0xFFBDBBBB),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.center,
        child: Row(
          children: <Widget>[
            Icon(
              Icons.search,
              size: 17,
            ),
            Container(
              margin: EdgeInsets.only(left: 8),
              child: Text(
                'Search here',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
