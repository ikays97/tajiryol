import 'package:flutter/material.dart';

class BuildCard extends StatelessWidget {
  const BuildCard({
    Key key,
    @required this.leftText,
    this.rightText,
    this.onTap,
  }) : super(key: key);

  final Widget leftText;
  final Widget rightText;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: InkWell(
          onTap: onTap,
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
                        leftText,
                        Spacer(),
                        rightText,
                        SizedBox(width: 10),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        leftText,
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
