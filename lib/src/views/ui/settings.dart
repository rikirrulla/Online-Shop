import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/src/business_logic/utils/constants.dart';
import 'package:online_shop/src/business_logic/utils/my_navigator.dart';
import 'package:online_shop/src/views/ui/orders_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:online_shop/src/views/ui/edit_profile.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            MyNavigator.goToHome(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: kPrimaryColor,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            Text(
              "Te dhenat",
              style: TextStyle(
                  fontSize: 24, fontFamily: font, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: kPrimaryColor,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Llogaria",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: font,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            buildAccountOptionRow(context, "Ndrysho profilin"),
            buildAccountOptionRow(context, "Ndrysho fjalkalimin"),
            buildAccountOptionRow(context, "Blerjet"),
            buildAccountOptionRow(context, "Theme"),
            buildAccountOptionRow(context, "Gjuha"),
            buildAccountOptionRow(context, "Siguria dhe privatsia"),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.volume_up_outlined,
                  color: kPrimaryColor,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Njoftimet",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: font,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            buildNotificationOptionRow("Te rejat", true),
            buildNotificationOptionRow("Aktivitet", false),
            SizedBox(
              height: 50,
            ),
            Center(
              child: OutlineButton(
                padding: EdgeInsets.symmetric(horizontal: 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  showAlert(context);
                },
                child: Text("DILNI",
                    style: TextStyle(
                        fontFamily: font,
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                        letterSpacing: 2.2,
                        color: Colors.black)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildNotificationOptionRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontFamily: font,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]),
        ),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              value: isActive,
              onChanged: (bool val) {
                if (title == 'Te rejat') {
                  setState(() {
                    val = false;
                  });
                }
              },
            ))
      ],
    );
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () async {
        if (title == 'Ndrysho profilin') {
          getProfile();
          MyNavigator.goToEditProfile(context);
        } else if (title == 'Ndrysho fjalkalimin') {
          MyNavigator.goToChangePassowrd(context);
        } else if (title == 'Blerjet') {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => OrdersScreen()));
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontFamily: font,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

showAlert(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Dilni.'),
        content: Text("A jeni i sigurt qe doni te dilni?"),
        actions: <Widget>[
          FlatButton(
            child: Text("PO"),
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.clear();
              MyNavigator.goToLogin(context);
            },
          ),
          FlatButton(
            child: Text("JO"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          FlatButton(
            child: Text("ANULO"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
