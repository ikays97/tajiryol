import 'package:flutter/material.dart';

import '../defaults.dart';

class CartBottom extends StatelessWidget {
  const CartBottom({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          blurRadius: 15,
          offset: Offset(1, 0),
          color: Colors.grey[300],
        ),
      ]),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                "339.99 TMT",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black26,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              Text(
                "229.99 TMT",
                style: TextStyle(
                  fontSize: 16,
                  color: mostUsedColor,
                ),
              ),
            ],
          ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sebetde arzanlaşyk 60%',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                '229.99 TMT',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffFF6600),
                ),
              ),
            ],
          ),
          SizedBox(width: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      return Color(0xffF29B62);
                    },
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'SEBEDE GEÇ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
