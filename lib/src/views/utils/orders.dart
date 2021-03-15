import 'package:flutter/material.dart';
import 'package:online_shop/src/business_logic/models/order.dart';

class OrderPage extends StatelessWidget {
  final Order order;
  final Function press;

  const OrderPage({
    Key key,
    this.order,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 70,
              child: Image.asset("${order.image}"),
            ),
            Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  "${order.title}",
                  style: TextStyle(
                    color: Color(0XFF174757),
                    fontSize: 20,
                  ),
                ),
                Text(
                  "${order.createdAt}",
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  "${order.price} x ${order.numOfItems}",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            )),
            Container(
                child: Row(
              children: <Widget>[
                Column(children: [
                  Text(
                    "${order.subTotal}  €",
                    style: TextStyle(
                      color: Color(0XFF174757),
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "${order.payment}",
                    style: TextStyle(color: Colors.grey),
                  ),
                ]),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: Colors.grey,
                )
              ],
            ))
          ]),
    );
  }
}
