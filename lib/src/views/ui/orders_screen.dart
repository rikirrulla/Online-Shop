import 'package:flutter/material.dart';
import 'package:online_shop/src/business_logic/models/order.dart';
import 'package:online_shop/src/business_logic/utils/constants.dart';
import 'package:online_shop/src/business_logic/services/api_services/order-api.dart';
import 'package:online_shop/src/views/utils/orders.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}
String idUser;

class _OrdersScreenState extends State<OrdersScreen> {

  @override
  void initState() {
    super.initState();
    setState(() {
      getData();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: kPrimaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: kPrimaryColor,
            ),
            onPressed: () {
              setState(() {});
            },
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: orders.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return OrderPage(
              order: orders[index],
              press: (){

              },
            );
          }),
    );
  }

  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    idUser = prefs.getString("id");
    getOrders(idUser);
    setState(() {
      orders.shuffle();
    });
  }

}