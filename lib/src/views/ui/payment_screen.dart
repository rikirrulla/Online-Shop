import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:online_shop/src/business_logic/models/product.dart';
import 'package:online_shop/src/business_logic/services/api_services/api.dart';
import 'package:online_shop/src/business_logic/utils/constants.dart';
import 'package:online_shop/src/business_logic/utils/my_navigator.dart';
import 'package:online_shop/src/views/utils/cart_counter.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({
    Key key,
    this.product,
    this.name,
    this.mobile,
    this.address1,
    this.address2,
    this.country,
    this.city,
    this.counter,
  }) : super(key: key);

  final Product product;
  final String name, mobile, address1, address2, country, city, counter;

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _picked1 = "";
  String _picked2 = "";
  String _picked3 = "";

  String _buying;
  String _transport;
  String _payment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .scaffoldBackgroundColor,
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
              Icons.close,
              color: kPrimaryColor,
            ),
            onPressed: () {
              MyNavigator.goToHome(context);
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: "${widget.product.title}",
                    child: Image.asset(
                      widget.product.image,
                      height: 80,
                      width: 80,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        '${widget.product.title}',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: font,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${widget.product.price}\€',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: font,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${numOfItems.toString()} artikull',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: font,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Ju jeni duke blere si: ',
                    style: TextStyle(
                        fontFamily: font,
                        fontSize: 14,
                        fontWeight: FontWeight.w900),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RadioButtonGroup(
                        orientation: GroupedButtonsOrientation.HORIZONTAL,
                        labelStyle: TextStyle(
                          fontFamily: font,
                          fontSize: 14,
                        ),
                        margin: const EdgeInsets.only(left: 9.0),
                        onSelected: (String selected) =>
                            setState(() {
                              _picked1 = selected;
                              _buying = selected;
                            }),
                        labels: <String>[
                          "Individual   ",
                          "Biznes",
                        ],
                        picked: _picked1,
                        itemBuilder: (Radio rb, Text txt, int i) {
                          return Column(
                            children: <Widget>[
                              rb,
                              txt,
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Transportimi*',
                    style: TextStyle(
                        fontFamily: font,
                        fontSize: 14,
                        fontWeight: FontWeight.w900),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RadioButtonGroup(
                        orientation: GroupedButtonsOrientation.HORIZONTAL,
                        labelStyle: TextStyle(
                          fontFamily: font,
                          fontSize: 14,
                        ),
                        margin: const EdgeInsets.only(left: 13.0),
                        onSelected: (String selected) =>
                            setState(() {
                              _picked2 = selected;
                              _transport = selected;
                            }),
                        labels: <String>[
                          "Standard   ",
                          "Merre vet",
                        ],
                        picked: _picked2,
                        itemBuilder: (Radio rb, Text txt, int i) {
                          return Column(
                            children: <Widget>[
                              rb,
                              txt,
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Pagesa*',
                    style: TextStyle(
                        fontFamily: font,
                        fontSize: 15,
                        fontWeight: FontWeight.w900),
                  ),
                  Text(
                    '(Zgjedhni njeren nga metodat e pageses)',
                    style: TextStyle(
                      fontFamily: font,
                      fontSize: 12,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RadioButtonGroup(
                        orientation: GroupedButtonsOrientation.HORIZONTAL,
                        labelStyle: TextStyle(
                          fontFamily: font,
                          fontSize: 14,
                        ),
                        margin: const EdgeInsets.only(left: 13.0),
                        onSelected: (String selected) =>
                            setState(() {
                              _picked3 = selected;
                              _payment = selected;
                            }),
                        labels: <String>[
                          "Paguaj me para ne dore      ",
                          "Paguaj me kartele",
                        ],
                        picked: _picked3,
                        itemBuilder: (Radio rb, Text txt, int i) {
                          return Column(
                            children: <Widget>[
                              rb,
                              txt,
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RadioButtonGroup(
                        orientation: GroupedButtonsOrientation.HORIZONTAL,
                        labelStyle: TextStyle(
                          fontFamily: font,
                          fontSize: 14,
                        ),
                        margin: const EdgeInsets.only(left: 13.0),
                        onSelected: (String selected) =>
                            setState(() {
                              _picked3 = selected;
                              _payment = selected;
                            }),
                        labels: <String>[
                          "Paguaj me transfer bankar  ",
                          "Paguaj me keste",
                        ],
                        picked: _picked3,
                        itemBuilder: (Radio rb, Text txt, int i) {
                          return Column(
                            children: <Widget>[
                              rb,
                              txt,
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                        onPressed: () {
                          if (checkFields()) {
                            insertToDb();
                            Fluttertoast.showToast(
                              msg: "Blerja u krye me sukses",
                              backgroundColor: Colors.grey,
                            );
                            MyNavigator.goToHome(context);
                          } else {
                            Fluttertoast.showToast(
                              msg: "Ju lutem plotsoni te dhenat!",
                              backgroundColor: Colors.grey,
                            );
                          }
                        },
                        color: kPrimaryColor,
                        padding:
                        EdgeInsets.symmetric(horizontal: 70, vertical: 15),
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "BLEJ TANI",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: font,
                              letterSpacing: 2,
                              color: Colors.white),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool checkFields() {
    if (_picked1.isEmpty || _picked2.isEmpty || _picked3.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  void insertToDb() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double subTotal = double.parse(widget.product.price) * numOfItems;
    print(prefs.getString('id'));
    print(widget.country);
    final response = await http.post(Api.urlPrefix + "orders.php", body: {
      "userId": prefs.getString('id'),
      "productId": widget.product.id,
      "status": 'Rregullt',
      "subTotal": subTotal.toString(),
      "counter": numOfItems.toString(),
      "buying": _buying,
      "transport": _transport,
      "payment": _payment,
      "name": prefs.getString('name'),
      "mobile": widget.mobile,
      "email": prefs.getString('email'),
      "line1": widget.address1,
      "line2": widget.address2,
      "city": widget.city,
      "country": widget.country,
    });

    var datauser = json.decode(response.body);
    //print(datauser);
  }
}
