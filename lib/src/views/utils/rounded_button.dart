import 'package:flutter/material.dart';
import 'package:online_shop/src/business_logic/utils/constants.dart';

class RoundedButton extends StatelessWidget {

  RoundedButton(this.name,this.onPressed);

  final String name;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(36),
        ),
        color: kPrimaryColor,
        onPressed: onPressed,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 16),
          alignment: Alignment.center,
          child: Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontFamily: font,
            ),
          ),
        ),
      ),
    );
  }
}