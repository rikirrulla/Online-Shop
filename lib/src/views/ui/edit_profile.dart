import 'package:flutter/material.dart';
import 'package:online_shop/src/business_logic/services/api_services/api.dart';
import 'package:online_shop/src/business_logic/utils/constants.dart';
import 'package:online_shop/src/business_logic/utils/my_navigator.dart';
import 'package:online_shop/src/views/utils/input_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

TextEditingController id = new TextEditingController();
TextEditingController name = new TextEditingController();
TextEditingController email = new TextEditingController();
TextEditingController mobile = new TextEditingController();
TextEditingController username = new TextEditingController();

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  void initState() {
    super.initState();
    setState(() {
      getProfile();
    });
  }

  bool showPassword = false;

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
            MyNavigator.goToSettingsFromEditProfile(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: kPrimaryColor,
            ),
            onPressed: () {
              MyNavigator.goToSettingsFromEditProfile(context);
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
              Text(
                "Ndrysho profilin",
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: font,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                "https://www.clipartkey.com/mpngs/m/71-714421_blank-profile-logo.png",
                              ))),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: kPrimaryColor,
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              InputTextField(
                label: 'Emri/Mbiemri: ' + name.text,
                onChange: (value) {
                  name.text = value;
                },
              ),
              InputTextField(
                label: 'Emaili: ' + email.text,
                onChange: (value) {
                  email.text = value;
                },
              ),
              InputTextField(
                label: 'Telefoni: ' + mobile.text,
                onChange: (value) {
                  mobile.text = value;
                },
              ),
              SizedBox(
                height: 16,
              ),
              InputTextField(
                label: 'Perdoruesi: ' + username.text,
                onChange: (value) {
                  username.text = value;
                },
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      MyNavigator.goToSettings(context);
                    },
                    child: Text("ANULO",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            fontFamily: font,
                            color: Colors.black)),
                  ),
                  RaisedButton(
                    onPressed: () {
                      updateProfile();
                    },
                    color: kPrimaryColor,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "RUAJ",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: font,
                          letterSpacing: 2.2,
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

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }

  bool checkFields() {
    if (name.text.isEmpty ||
        email.text.isEmpty ||
        mobile.text.isEmpty||
        username.text.isEmpty) {
      return true;
    }
    return false;
  }

  void updateProfile() async {
    final response = await http.post(Api.urlPrefix + "edit_profile.php", body: {
      "id": id.text,
      "name": name.text,
      "email": email.text,
      "mobile": mobile.text,
      "username": username.text,
    });

    MyNavigator.goToSettingsFromEditProfile(context);
    Fluttertoast.showToast(
      msg: "Te dhenat u edituan me sukses ",
      backgroundColor: Colors.grey,
    );
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name.text);
    await prefs.setString('username', username.text);
    await prefs.setString('password', email.text);
    await prefs.setString('mobile', mobile.text);
    await prefs.setString('username', username.text);
  }
}

void getProfile() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  id.text = prefs.getString('id');
  name.text = prefs.getString('name');
  email.text = prefs.getString('email');
  mobile.text = prefs.getString('mobile');
  username.text = prefs.getString('username');
  print(id.text);
}
