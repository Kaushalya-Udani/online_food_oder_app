import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:food_oder_app/screen/widget/my_text_field.dart';

class LoginPage extends StatefulWidget {
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  RegExp regExp = RegExp(LoginPage.pattern.toString());
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  TextEditingController email= TextEditingController();
  TextEditingController password= TextEditingController();

  void validation(){

    if(email.text.trim().isEmpty||email.text.trim()==null){
      globalKey.currentState!.showSnackBar(
        SnackBar(
          content: Text(
            "Email is Empty",
          ),
        ),
      );
      return;
    }
    else if(!regExp.hasMatch(email.text)){
      globalKey.currentState!.showSnackBar(
        SnackBar(
          content: Text(
            "Please enter valid Email",
          ),
        ),
      );
      return;
    }
    if(password.text.trim().isEmpty||password.text.trim()==null){
      globalKey.currentState!.showSnackBar(
        SnackBar(
          content: Text(
            "Password is Empty",
          ),
        ),
      );
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,
          color: Colors.black,),
          onPressed: () { },
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 140),
              child: Text(
                  "Login In",
                  style: TextStyle(
                    color: Colors.white,fontSize: 40,
                    fontWeight: FontWeight.bold
                  ),
              ),
            ),
            Column(
              children: [
                MytextField(
                  controller: email,
                  hintText: 'Email',
                  obscureText: false,
                ),

                SizedBox(height: 30,),
                MytextField(
                  controller: password,
                  hintText: 'Password',
                  obscureText: true ,
                ),
              ],
            ),
            Container(
              height: 60,
              width: 200,
              child: RaisedButton(
                color: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                onPressed: () {},
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("New user?",
                  style: TextStyle(color:Colors.grey ),),
                Text("Register now",
                  style: TextStyle(color: Colors.red),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
