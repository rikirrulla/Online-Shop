import 'package:flutter/material.dart';
import 'package:online_shop/src/business_logic/models/product.dart';
import 'package:online_shop/src/business_logic/utils/constants.dart';
import 'package:online_shop/src/business_logic/utils/my_navigator.dart';
import 'package:online_shop/src/views/ui/payment_screen.dart';
import 'package:online_shop/src/views/utils/cart_counter.dart';
import 'package:online_shop/src/views/utils/dropdown_button.dart';
import 'package:online_shop/src/views/utils/input_text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  _AddAddressScreenState createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  TextEditingController name = new TextEditingController();
  TextEditingController mobile = new TextEditingController();
  TextEditingController address1 = new TextEditingController();
  TextEditingController address2 = new TextEditingController();
  TextEditingController coutry = new TextEditingController();
  TextEditingController city = new TextEditingController();

  List itemCity = [
    "Prizreni",
    "Prishtina",
    "Peja",
    "Gjilani",
    "Ferizaj",
    "Gjakova",
    "Mitrovica",
  ];

  List itemCountry = [
    "Kosova",
    "Shqiperia",
  ];
  var dropdownValue;
  String valueChoose1;
  String valueChoose2;

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
                height: 35,
              ),
              InputTextField(
                label: 'Emri*Mbiemri*: ',
                onChange: (value) {
                  name.text = value;
                },
              ),
              InputTextField(
                label: 'Telefoni*',
                onChange: (value) {
                  mobile.text = value;
                },
              ),
              InputTextField(
                label: 'Adresa1*: ',
                onChange: (value) {
                  address1.text = value;
                },
              ),
              InputTextField(
                label: 'Adresa2*: ',
                onChange: (value) {
                  address2.text = value;
                },
              ),
              SizedBox(
                height: 16,
              ),
              Dropdown(
                title: 'Zgjedhe shtetin',
                valueChoose: valueChoose1,
                onChanged: (newValue) {
                  setState(() {
                    valueChoose1 = newValue;
                    coutry.text = newValue;
                  });
                },
                item: itemCountry,
              ),
              SizedBox(
                height: 16,
              ),
              Dropdown(
                title: 'Zgjedhe qytetin',
                valueChoose: valueChoose2,
                onChanged: (newValue) {
                  setState(() {
                    valueChoose2 = newValue;
                    city.text = newValue;
                  });
                },
                item: itemCity,
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
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (context) => new PaymentScreen(
                              product: widget.product,
                              name: name.text,
                              mobile: mobile.text,
                              address1: address1.text,
                              address2: address2.text,
                              country: coutry.text,
                              city: city.text,
                              counter: numOfItems.toString(),
                            ),
                          ),
                        );
                      } else {
                        Fluttertoast.showToast(
                          msg: "Ju lutem mbushni te dhenat!",
                          backgroundColor: Colors.grey,
                        );
                      }
                    },
                    color: kPrimaryColor,
                    padding: EdgeInsets.symmetric(horizontal: 70, vertical: 15),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "VAZHDONI",
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
        ),
      ),
    );
  }

  bool checkFields() {
    if (name.text.isEmpty ||
        mobile.text.isEmpty ||
        address1.text.isEmpty ||
        address2.text.isEmpty ||
        coutry.text.isEmpty ||
        city.text.isEmpty) {
      return false;
    } else {
      return true;
    }
  }
}
