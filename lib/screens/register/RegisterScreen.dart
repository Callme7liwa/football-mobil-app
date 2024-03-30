import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_application/utils/MyAppColors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var screenWidth, screenHeight;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MyAppColors.backgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  child: Column(children: [
                SizedBox(height: screenHeight * 0.025),
                Image.asset("assets/images/ball.png", width: 130),
                Row(children: [
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: double.infinity,
                    color: Colors.black.withOpacity(0.1),
                    height: 1,
                  )),
                  Text(
                    "Wanna play more ?".toUpperCase(),
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.8),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: double.infinity,
                    color: Colors.black.withOpacity(0.1),
                    height: 1,
                  )),
                ]),
                SizedBox(height: 10),
                Text(
                  "Register here ".toUpperCase(),
                  style: TextStyle(
                      color: MyAppColors.blueSecondColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 11),
                ),
                SizedBox(height: screenHeight * 0.05),
              ])),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(children: [
                    Container(
                      width: screenWidth * 0.9,
                      child: TextField(
                        autofocus: true,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x3f130404),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: 'Enter Your First name'.toUpperCase(),
                          labelStyle: TextStyle(color: Colors.black),
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          prefixIcon: IconButton(
                            icon: Image.asset(
                              "assets/images/icons/icon_first_name.png",
                            ),
                            iconSize: 20, // Adjust the size of the icon here
                            onPressed: () {},
                          ),
                        ),
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                    Container(
                      width: screenWidth * 0.9,
                      margin: EdgeInsets.only(
                        top: screenHeight * 0.025,
                      ),
                      child: TextField(
                        autofocus: true,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x3f130404),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: 'Enter Your Second Name'.toUpperCase(),
                          labelStyle: TextStyle(color: Colors.black),
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          prefixIcon: IconButton(
                            icon: Image.asset(
                              "assets/images/icons/icon_second_name.png",
                            ),
                            iconSize: 20, // Adjust the size of the icon here
                            onPressed: () {},
                          ),
                        ),
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                    Container(
                      width: screenWidth * 0.9,
                      margin: EdgeInsets.only(
                        top: screenHeight * 0.025,
                      ),
                      child: TextField(
                        autofocus: true,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x3f130404),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: 'Enter Your Email'.toUpperCase(),
                          labelStyle: TextStyle(color: Colors.black),
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          prefixIcon: IconButton(
                            icon: Image.asset(
                              "assets/images/icons/icon_email.png",
                            ),
                            iconSize: 20, // Adjust the size of the icon here
                            onPressed: () {},
                          ),
                        ),
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                    Container(
                      width: screenWidth * 0.9,
                      margin: EdgeInsets.only(
                        top: screenHeight * 0.025,
                      ),
                      child: TextField(
                        autofocus: true,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x3f130404),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: 'Enter Your password'.toUpperCase(),
                          labelStyle: TextStyle(color: Colors.black),
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          prefixIcon: IconButton(
                            icon: Image.asset(
                              "assets/images/icons/icon_password.png",
                            ),
                            iconSize: 20, // Adjust the size of the icon here
                            onPressed: () {},
                          ),
                        ),
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                    Container(
                      width: screenWidth * 0.9,
                      margin: EdgeInsets.only(
                        top: screenHeight * 0.025,
                      ),
                      child: TextField(
                        autofocus: true,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x3f130404),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: 'Confirm your password'.toUpperCase(),
                          labelStyle: TextStyle(color: Colors.black),
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          prefixIcon: IconButton(
                            icon: Image.asset(
                              "assets/images/icons/password.png",
                            ),
                            iconSize: 20, // Adjust the size of the icon here
                            onPressed: () {},
                          ),
                        ),
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                    Container(
                        width: screenWidth * 0.9,
                        margin: EdgeInsets.only(
                          top: screenHeight * 0.025,
                        ),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: MyAppColors.blueSecondColor,
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                            child: Text(
                          "Next".toUpperCase(),
                          style: TextStyle(color: Colors.white),
                        ))),
                    Center(
                      child: Container(
                        width: screenWidth * 1,
                        margin: EdgeInsets.only(
                          top: screenHeight * 0.02,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("If you have an account yet , ".toUpperCase(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold)),
                            Text(
                              "click here".toUpperCase(),
                              style: TextStyle(
                                  color: MyAppColors.blueSecondColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    )
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
