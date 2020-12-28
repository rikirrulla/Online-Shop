import 'dart:ui';
import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/src/business_logic/services/api_services/api.dart';
import 'package:online_shop/src/business_logic/utils/constants.dart';
import 'package:online_shop/src/business_logic/utils/my_navigator.dart';
import 'package:online_shop/src/business_logic/utils/shop.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';
import 'package:online_shop/src/views/utils/login_form.dart';
import 'package:online_shop/src/views/utils/welcome.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();
  String level;

  Future<List> _login() async {
    final response = await http.post(Api.urlPrefix + "login.php", body: {
      "username": username.text,
      "password": password.text,
    });

    var datauser = json.decode(response.body);
    print(datauser);
    if (datauser.length == 0) {
    } else {
      if (datauser[0]['level'] == 'admin') {
        level = 'admin';
      } else if (datauser[0]['level'] == 'user') {
        level = 'user';
      }
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('id', datauser[0]['id']);
      await prefs.setString('name', datauser[0]['name']);
      await prefs.setString('username', datauser[0]['username']);
      await prefs.setString('password', datauser[0]['password']);
      await prefs.setString('mobile', datauser[0]['mobile']);
      await prefs.setString('email', datauser[0]['email']);
      await prefs.setString('level', datauser[0]['level']);
      await prefs.setString('registeredAt', datauser[0]['registeredAt']);
      await prefs.setString('lastLogin', datauser[0]['lastLogin']);
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
          Welcome(Shop.sign_in),
          LoginForm(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            alignment: Alignment.centerRight,
            child: RichText(
              text: TextSpan(style: TextStyle(color: Colors.grey), children: [
                TextSpan(
                  text: 'Keni harruar fjalkalimin?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                    fontFamily: font,
                    fontSize: 14.0,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      MyNavigator.goToForgetPassword(context);
                    },
                ),
              ]),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          ProgressButton(
            defaultWidget: const Text(
              'Kyqu',
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
              await _login();
              int score = await Future.delayed(
                  const Duration(milliseconds: 4000), () => 42);
              return () async {
                if (checkFields()) {
                  Fluttertoast.showToast(
                    msg: "Perdoruesi ose fjalkalimi jane te zbrazet!",
                    backgroundColor: Colors.grey,
                  );
                } else {
                  if (level == 'admin') {
                    Fluttertoast.showToast(
                        msg: "ADMIN",
                        backgroundColor: Colors.grey);
                  } else if (level == 'user') {
                    Fluttertoast.showToast(
                        msg: "Llogaria u hap me sukses",
                        backgroundColor: Colors.grey);
                    setState(() {
                      MyNavigator.goToHome(context);
                    });
                  } else {
                    Fluttertoast.showToast(
                      msg: "Te dhenat jane gabim!",
                      backgroundColor: Colors.grey,
                    );
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
                    text: 'Krijo një llogari të re? ',
                    style: TextStyle(
                      fontSize: 13.0,
                      fontFamily: font,
                    )),
                TextSpan(
                  text: 'Regjistrohu',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: font,
                    fontSize: 14.0,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      MyNavigator.goToSignUp(context);
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
    username.text = getUserName();
    password.text = getPassowrd();
  }

  bool checkFields() {
    if (username.text.isEmpty || password.text.isEmpty) {
      return true;
    }
    return false;
  }
}
