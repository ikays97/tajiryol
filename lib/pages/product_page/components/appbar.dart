import 'package:flutter/material.dart';
import 'package:tajiryol/components/my_cached_image.dart';
import 'package:tajiryol/utils/navigator.dart';

import '../defaults.dart';
import '../view_image.dart';

class BuildAppBar extends StatelessWidget {
  const BuildAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      stretch: true,
      stretchTriggerOffset: 150,
      onStretchTrigger: () async {
        print('yokardan cekesi gelip olup barya');
      },
      title: Text(
        'USPOLO T-Shirt',
        style: TextStyle(
          color: Theme.of(context).scaffoldBackgroundColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      leading: InkWell(
        onTap: () => MyNavigator.pop(),
        child: Icon(Icons.arrow_back,
            color: Theme.of(context).scaffoldBackgroundColor),
      ),
      pinned: true,
      expandedHeight: MediaQuery.of(context).size.height * 0.4,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: [
          StretchMode.zoomBackground,
          StretchMode.fadeTitle,
        ],
        collapseMode: CollapseMode.pin,
        background: InkWell(
          onTap: () => MyNavigator.push(ViewImages()),
          child: MyCachedNetworkImage(imageurl: url),
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
