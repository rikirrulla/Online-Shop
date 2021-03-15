import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/src/business_logic/models/product.dart';
import 'package:online_shop/src/business_logic/utils/constants.dart';

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Dyqani Online",
            style: TextStyle(color: Colors.white, fontFamily: font),
          ),
          Text(
            product.title,
            style: TextStyle(
                fontSize: 42,
                fontFamily: font,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30.0,),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(text: "Qmimi\n"),
                TextSpan(
                  text: "\€${product.price}",
                  style: TextStyle(
                      fontSize: 36,
                      fontFamily: font,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              SizedBox(width: kDefaultPaddin*10),
              Expanded(
                child: Hero(
                  tag: "${product.id}",
                  child: Image.asset(product.image),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
