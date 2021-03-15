import 'package:flutter/material.dart';
import 'package:online_shop/src/business_logic/services/api_services/api.dart';
import 'package:online_shop/src/business_logic/utils/constants.dart';
import 'package:online_shop/src/business_logic/utils/my_navigator.dart';
import 'package:online_shop/src/views/utils/input_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController password = new TextEditingController();
  TextEditingController newPassword = new TextEditingController();
  TextEditingController reEnterPassword = new TextEditingController();
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
                "Ndrysho fjalkalimin",
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: font,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 35,
              ),
              InputTextField(
                label: 'Fjalkalimi vjter',
                onChange: (value) {
                  password.text = value;
                },
              ),
              InputTextField(
                label: 'Fjalkalimi i ri',
                onChange: (value) {
                  newPassword.text = value;
                },
              ),
              SizedBox(
                height: 16,
              ),
              InputTextField(
                label: 'Shkuraj perseri fjalkalimin',
                onChange: (value) {
                  reEnterPassword.text = value;
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
                      changePassword();
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

  void changePassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = prefs.getString('id');
    String pass = prefs.getString('password');
    if(checkFields()){
      if(newPassword.text == reEnterPassword.text){
        if(pass == password.text){
          toDb(id,newPassword.text);
        }else{
          Fluttertoast.showToast(
            msg: "Fjalkalimi vjeter eshte gabim",
            backgroundColor: Colors.grey,
          );
        }
      }else{
        Fluttertoast.showToast(
          msg: "Fjalkalimet nuk perputhen",
          backgroundColor: Colors.grey,
        );
      }
    }else{
      Fluttertoast.showToast(
        msg: "Ju lutem mbushni te dhenat",
        backgroundColor: Colors.grey,
      );
    }
  }

  bool checkFields() {
    if(password.text.isEmpty || newPassword.text.isEmpty || reEnterPassword.text.isEmpty){
      return false;
    }else{
      return true;
    }
  }

  void toDb(String id,String pw) async {
    final response = await http.post(Api.urlPrefix + "change_password.php", body: {
      "id": id,
      "password": pw,
    });
    MyNavigator.goToSettingsFromEditProfile(context);

    Fluttertoast.showToast(
      msg: "Fjalkalimi u ndryshe me sukses",
      backgroundColor: Colors.grey,
    );
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('password', pw);
  }
}
