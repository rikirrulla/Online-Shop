import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/src/business_logic/services/api_services/api.dart';
import 'package:online_shop/src/business_logic/utils/constants.dart';
import 'package:online_shop/src/business_logic/utils/my_navigator.dart';
import 'package:online_shop/src/business_logic/utils/shop.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';
import 'package:online_shop/src/views/utils/sign_up_form.dart';
import 'package:online_shop/src/views/utils/welcome.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController name = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController mobile = new TextEditingController();
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();

  String msg;

  Future<List> _register() async {
    final response = await http.post(Api.urlPrefix + "register.php", body: {
      "name": name.text,
      "email": email.text,
      "mobile": mobile.text,
      "username": username.text,
      "password": password.text,
    });

    var datauser = json.decode(response.body);
    if (datauser == "Success") {
      msg = 'Success';
    } else {
      msg = 'Error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Welcome(Shop.sign_up),
          SignUpForm(),
          SizedBox(
            height: 60,
          ),
          ProgressButton(
            defaultWidget: const Text(
              'Regjistrohu',
              style: TextStyle(
                fontFamily: font,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 17.0,
              ),
            ),
            borderRadius: 24,
            progressWidget: const CircularProgressIndicator(),
            color: kPrimaryColor,
            width: 260,
            height: 50,
            onPressed: () async {
              getFields();
              await _register();

              int score = await Future.delayed(
                  const Duration(milliseconds: 4000), () => 42);

              return () async {

                if (checkFields()) {
                  Fluttertoast.showToast(
                    msg: "Perdoreusi ose fjalkalimi jane te zbrazet!",
                    backgroundColor: Colors.grey,
                  );
                } else {
                  if (msg == 'Success') {
                    Fluttertoast.showToast(
                        msg: "Regjistrimi ka perfunduar me sukses",
                        backgroundColor: Colors.grey);
                    setState(() {
                      MyNavigator.goToLogin(context);
                    });
                  } else if (msg == 'Error') {
                    Fluttertoast.showToast(
                        msg: "Perdoruesi ose fjalkalimi egziston!",
                        backgroundColor: Colors.grey);
                  } else {
                    Fluttertoast.showToast(
                        msg: "Diqka shkoi gabim!", backgroundColor: Colors.grey);
                  }
                }
              };
            },
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 16,
            ),
            alignment: Alignment.center,
            child: RichText(
              text: TextSpan(style: TextStyle(color: Colors.grey), children: [
                TextSpan(
                    text: 'Kthehu mprapa. ',
                    style: TextStyle(
                      fontSize: 13.0,
                      fontFamily: font,
                    )),
                TextSpan(
                  text: 'Kyqu',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: font,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      MyNavigator.goToLogin(context);
                    },
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  void getFields() {
    name.text = getName();
    email.text = getEmail();
    mobile.text = getMobile();
    username.text = getUsername();
    password.text = getPassword();
  }

  bool checkFields() {
    if (name.text.isEmpty ||
        email.text.isEmpty ||
        mobile.text.isEmpty ||
        username.text.isEmpty ||
        password.text.isEmpty) {
      return true;
    }
    return false;
  }
}
