import 'package:flutter/material.dart';

import 'input_text_field.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

String name;
String email;
String mobile;
String username;
String password;

class _SignUpFormState extends State<SignUpForm> {
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
            label: 'Emri / Mbiemri',
            onChange: (value) {
              name = value;
            },
          ),
          InputTextField(
            label: 'Emaili',
            onChange: (value) {
              email = value;
            },
          ),
          InputTextField(
            label: 'Numri Telefonit',
            onChange: (value) {
              mobile = value;
            },
          ),
          SizedBox(
            height: 16,
          ),
          InputTextField(
            label: 'Perdoruesi',
            onChange: (value) {
              username = value;
            },
          ),
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

String getName(){
  return name;
}

String getEmail(){
  return email;
}

String getMobile(){
  return mobile;
}

String getUsername(){
  return username;
}

String getPassword(){
  return password;
}
