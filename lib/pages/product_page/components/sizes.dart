import 'package:flutter/material.dart';

import '../defaults.dart';

class BuildSizes extends StatelessWidget {
  const BuildSizes({
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
                    vertical: 8,
                    horizontal: 10,
                  ),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Olceg',
                        style: productLabelStyle,
                      ),
                      SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(olcegler.length, (i) {
                            return Card(
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: i == 0 ? 2 : 0,
                                    color: Colors.black38,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "${olcegler[i]}",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
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
