import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tajiryol/components/my_cached_image.dart';
import 'package:tajiryol/pages/product_page/defaults.dart';
import 'package:tajiryol/utils/navigator.dart';

class SellersPage extends StatefulWidget {
  @override
  _SellersPageState createState() => _SellersPageState();
}

class _SellersPageState extends State<SellersPage> {
  List<String> mcdot = ['MC', 'DOT'];
  bool isMC = false;
  bool isLoading = false;

  final mcController = TextEditingController();
  String mcError;
  String savedMC;
  String mctext;

  final dotController = TextEditingController();
  String dotError;
  String savedDot;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // appbar
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(37),
                          bottomRight: Radius.circular(37),
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 3),
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.06),
                          ),
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              // TODO: to profile page
                              onTap: () => MyNavigator.pop(),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Icon(
                                  Icons.arrow_back,
                                  size: 28,
                                ),
                              ),
                            ),
                            Text(
                              'Satyjylar',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  //TODO better tin/ein switcher
                  //TODO tin format xxx-xxx-xxx-xxx
                  //TODO ein format xx-xxxxxxxxx
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: TextFormField(
                      controller: isMC ? mcController : dotController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        prefixIcon: SizedBox(
                          // width: 30,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                elevation: 0,
                                iconEnabledColor:
                                    Theme.of(context).primaryColor,
                                iconSize: 18,
                                isDense: true,
                                onChanged: (String v) {
                                  setState(() {
                                    isMC = !isMC;
                                    mctext = v;
                                  });
                                },
                                value: mctext,
                                items: List.generate(mcdot.length, (index) {
                                  return DropdownMenuItem<String>(
                                    value: mcdot[index],
                                    child: Text(
                                      mcdot[index],
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ),
                        ),
                        labelText: isMC ? 'MC number' : 'DOT number',
                        hintText: 'Example: 12345678',
                        helperText: '',
                        errorText: isMC ? mcError : dotError,
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      // validator: isMC ? validateEin : validateTin,
                      onChanged: (v) {
                        if (isMC) {
                          if (mcError != null) {
                            setState(() => mcError = null);
                          }
                        } else {
                          if (dotError != null) {
                            setState(() => dotError = null);
                          }
                        }
                      },
                      onSaved: (v) {
                        if (isMC) {
                          savedMC = v;
                        } else {
                          savedDot = v;
                        }
                      },
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(isMC ? 6 : 8),
                        // mcFormatter,
                      ],
                    ),
                  ),
                  // products
                  Column(
                    children: List.generate(8, (index) {
                      return Container(
                        margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                        padding: EdgeInsets.all(14),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: size.width * 0.15,
                              height: size.width * 0.15,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: MyCachedNetworkImage(imageurl: url),
                              ),
                            ),
                            //
                            SizedBox(width: 14),
                            //
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Merdan  ',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 8),
                                  Text.rich(
                                    TextSpan(
                                      text: 'Brand:  ',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: '5',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Text(
                            //   '199 TMT',
                            //   style: TextStyle(
                            //     color: Color(0xff00BE67),
                            //     fontSize: 16,
                            //     fontWeight: FontWeight.w600,
                            //   ),
                            // ),
                          ],
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
