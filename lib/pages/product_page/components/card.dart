import 'package:flutter/material.dart';

class BuildCard extends StatelessWidget {
  const BuildCard({
    Key key,
    this.leftText,
    this.rightText,
  }) : super(key: key);

  final String leftText;
  final String rightText;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            color: Colors.white,
            child: rightText != null
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        leftText,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      Spacer(),
                      Text(
                        rightText,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(width: 15),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        leftText,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
