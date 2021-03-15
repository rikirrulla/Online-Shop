import 'package:flutter/material.dart';
import 'package:online_shop/src/business_logic/utils/constants.dart';

class Welcome extends StatelessWidget {

  Welcome(this.title);
  final String title;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 45,vertical: 20),
      alignment: Alignment.topCenter,
      child: Text(
        title,
        style: TextStyle(
          color: kTextColor,
          fontSize: 30,
          fontWeight: FontWeight.w500,
          fontFamily: 'Countryside two',
        ),
      ),
    );
  }
}