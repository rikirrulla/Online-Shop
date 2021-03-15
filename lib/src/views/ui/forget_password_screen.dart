import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/src/business_logic/utils/constants.dart';
import 'package:online_shop/src/business_logic/utils/my_navigator.dart';
import 'package:online_shop/src/business_logic/utils/shop.dart';
import 'package:online_shop/src/views/utils/forget_password_form.dart';
import 'package:online_shop/src/views/utils/rounded_button.dart';
import 'package:online_shop/src/views/utils/welcome.dart';

class ForgetPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Welcome(Shop.forget_password),
          ForgetPasswordForm(),
          SizedBox(
            height: 60,
          ),
          RoundedButton('Vazhdo',(){

          }),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 16,
            ),
            alignment: Alignment.center,
            child: RichText(
              text: TextSpan(style: TextStyle(color: Colors.grey), children: [
                TextSpan(
                    text: 'Sign in instead. ',
                    style: TextStyle(
                      fontSize: 13.0,
                      fontFamily: font,
                    )),
                TextSpan(
                  text: 'Login',
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
          )
        ],
      ),
    );
  }
}
