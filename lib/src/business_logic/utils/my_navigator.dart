import 'package:flutter/material.dart';
import 'package:online_shop/src/business_logic/models/product.dart';

class MyNavigator {

  static void goToAddAddress(BuildContext context,Product product) {
    Navigator.pushNamed(context, "/addaddress");
  }

  static void goToLogin(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/login");
  }
  static void goToSettingsFromEditProfile(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/settings");
  }

  static void goToChangePassowrd(BuildContext context) {
    Navigator.pushNamed(context, "/changepassword");
  }

  static void goToForgetPassword(BuildContext context) {
    Navigator.pushNamed(context, "/forget");
  }

  static void goToHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/home");
  }

  static void goToSplashScreen(BuildContext context) {
    Navigator.pushNamed(context, "/splash");
  }

  static void goToSignUp(BuildContext context) {
    Navigator.pushNamed(context, "/register");
  }

  static void goToSettings(BuildContext context) {
    Navigator.pushNamed(context, "/settings");
  }

  static void goToEditProfile(BuildContext context) {
    Navigator.pushNamed(context, "/editprofile");
  }
}
