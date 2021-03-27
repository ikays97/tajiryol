import 'package:flutter/material.dart';

import '../defaults.dart';

class BuildAbout extends StatelessWidget {
  const BuildAbout({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 12,
                  ),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Haryt Barada',
                        style: productLabelStyle,
                      ),
                      Text(
                        about,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
