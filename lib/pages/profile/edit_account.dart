import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tajiryol/utils/navigator.dart';

class EditAccountPage extends StatefulWidget {
  @override
  _EditAccountPageState createState() => _EditAccountPageState();
}

class _EditAccountPageState extends State<EditAccountPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  String savedUsername;
  String nameError;

  final phoneController = TextEditingController();
  String savedPhone;
  String phoneError;

  @override
  Widget build(BuildContext context) {
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
                              // TODO: edit account page
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
                              'Hasaby üýtget',
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
                  // textfields
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                          child: TextFormField(
                            controller: usernameController,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              labelText: 'Adynyz',
                              hintText: 'Meselem: Mekan',
                              helperText: '',
                              errorText: nameError,
                              fillColor: Colors.white,
                            ),
                            validator: validateName,
                            onChanged: (v) {
                              if (nameError != null) {
                                setState(() => nameError = null);
                              }
                            },
                            onSaved: (v) => savedUsername = v,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          child: TextFormField(
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              labelText: 'Telefon',
                              helperText: '',
                              errorText: phoneError,
                              fillColor: Colors.white,
                            ),
                            validator: validatePhone,
                            onChanged: (v) {
                              if (phoneError = null) {
                                setState(() => phoneError = null);
                              }
                            },
                            onSaved: (v) => savedPhone = v,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => MyNavigator.pop(),
                            child: Text(
                              'ÜÝTGET',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.only(
                                top: 14,
                                bottom: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String validateName(String value) {
    if (value == null || value.isEmpty) {
      //todo value
      return 'Please enter otp';
    }
    return null;
  }

  String validatePhone(String value) {
    if (value == null || value.isEmpty) {
      //todo value
      return 'Please enter otp';
    }
    return null;
  }
}
