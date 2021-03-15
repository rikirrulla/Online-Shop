import 'package:flutter/material.dart';
import 'package:online_shop/src/views/utils/input_text_field.dart';

String username;
String password;

class LoginForm extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 30,
      ),
      child: Column(
        children: <Widget>[
          InputTextField(
            label: 'Perdoruesi',
            onChange: (value) {
              username = value;
            },
          ),
          SizedBox(height: 16,),
          InputTextField(
            label: 'Fjalkalimi',
            password: true,
            onChange: (value) {
              password = value;
            },
          ),
        ],
      ),
    );
  }
}

String getUserName()  {
  return username;
}

String getPassowrd()  {
  return password;
}