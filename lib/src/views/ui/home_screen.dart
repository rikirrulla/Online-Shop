import 'package:flutter/material.dart';
import 'package:online_shop/src/business_logic/utils/constants.dart';
import 'package:online_shop/src/business_logic/utils/my_navigator.dart';
import 'package:online_shop/src/views/ui/orders_screen.dart';
import 'package:online_shop/src/views/utils/body_home.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: BodyHome(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          "assets/icons/cart.svg",
          color: kTextColor,
        ),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => OrdersScreen()));
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/search.svg",
            color: kTextColor,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/refresh.svg",
            color: kTextColor,
          ),
          onPressed: () {
            setState(() {});
          },
        ),
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/user1.svg",
            // By default our  icon color is white
            color: kTextColor,
          ),
          onPressed: () {
            MyNavigator.goToSettings(context);
          },
        ),
        SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }
}

