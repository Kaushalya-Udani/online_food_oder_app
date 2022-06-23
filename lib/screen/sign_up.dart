import 'package:flutter/material.dart';
import 'package:food_oder_app/screen/widget/my_text_field.dart';

class SignUp extends StatefulWidget {
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  RegExp regExp = RegExp(SignUp.pattern.toString());
  TextEditingController name= TextEditingController();
  TextEditingController registerNumber= TextEditingController();
  TextEditingController phoneNumber= TextEditingController();
  TextEditingController email= TextEditingController();
  TextEditingController password= TextEditingController();

  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  void validation(){
    if(name.text.trim().isEmpty||name.text.trim()==null){
      globalKey.currentState!.showSnackBar(
          SnackBar(
              content: Text(
                "Name is Empty",
              ),
          ),
      );
      return;
    }

    if(registerNumber.text.trim().isEmpty||registerNumber.text.trim()==null){
      globalKey.currentState!.showSnackBar(
        SnackBar(
          content: Text(
            "Registration Number is Empty",
          ),
        ),
      );
      return;
    }

    if(phoneNumber.text.trim().isEmpty||phoneNumber.text.trim()==null){
      globalKey.currentState!.showSnackBar(
        SnackBar(
          content: Text(
            "Phone Number is Empty",
          ),
        ),
      );
      return;
    }

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
Widget button({
  required String buttonName,
  required Color color,
  required Color textColor,
  required Function ontap,
}){
    return Container(
      width: 120,
      child: RaisedButton(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          buttonName,
          style: TextStyle(
              fontSize: 20,
            color: textColor,
          ),
        ),
        onPressed: () { },
      ),
    );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Sign Up",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              Container(
                height: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MytextField(
                      controller: name,
                      hintText: 'Name',
                      obscureText: false,
                    ),
                    MytextField(
                        controller: registerNumber,
                        hintText: 'Student Registration NUmber',
                        obscureText: false
                    ),
                    MytextField(
                        controller: phoneNumber,
                        hintText: 'Phone Number',
                        obscureText: false
                    ),
                    MytextField(
                        controller: email,
                        hintText: 'Email',
                        obscureText: false
                    ),
                    MytextField(
                        controller: password,
                        hintText: 'Password',
                        obscureText: true
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  button(
                    ontap: (){},
                    buttonName: "Cancel",
                    color: Colors.grey,
                    textColor: Colors.black,
                  ),
                  SizedBox(width: 10,),
                  button(
                    ontap: () {
                      validation();
                    },
                    buttonName: "Register",
                    color: Colors.red,
                    textColor: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
