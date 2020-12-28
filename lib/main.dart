import 'package:flutter/material.dart';
import 'package:online_shop/src/views/ui/change_password_screen.dart';
import 'package:online_shop/src/views/ui/edit_profile.dart';
import 'package:online_shop/src/views/ui/forget_password_screen.dart';
import 'package:online_shop/src/views/ui/home_screen.dart';
import 'package:online_shop/src/views/ui/payment_screen.dart';
import 'package:online_shop/src/views/ui/settings.dart';
import 'package:online_shop/src/views/ui/sign_in_screen.dart';
import 'package:online_shop/src/views/ui/sign_up_screen.dart';
import 'package:online_shop/src/views/ui/splash_screen.dart';


var routes = <String, WidgetBuilder>{
  "/login": (BuildContext context) => LoginScreen(),
  "/register": (BuildContext context) => SignUpScreen(),
  "/forget": (BuildContext context) => ForgetPasswordScreen(),
  "/home": (BuildContext context) => HomeScreen(),
  "/settings": (BuildContext context) => SettingsScreen(),
  "/editprofile": (BuildContext context) => EditProfileScreen(),
  "/changepassword": (BuildContext context) => ChangePasswordScreen(),
  "/gotopay": (BuildContext context) => PaymentScreen(),
};

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        routes: routes);
  }
}
