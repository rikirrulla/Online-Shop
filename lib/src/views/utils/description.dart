import 'package:flutter/material.dart';
import 'package:online_shop/src/business_logic/models/product.dart';
import 'package:online_shop/src/business_logic/utils/constants.dart';

class Description extends StatelessWidget {
  const Description({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Text(
        product.description,
        style: TextStyle(height: 1.5,fontFamily: font,fontSize: 14.0),
      ),
    );
  }
}