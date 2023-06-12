import 'package:flutter/material.dart';
import 'package:my_flutter_application/screens/HomeScreen.dart';
import 'package:my_flutter_application/screens/WelcomScreenSecond.dart';
import 'package:my_flutter_application/screens/WelcomeScreen.dart';
import 'package:my_flutter_application/screens/WelcomeThird.dart';
import 'package:my_flutter_application/screens/login/LoginPage.dart';
import 'package:my_flutter_application/screens/login/LoginScreen.dart';
import 'package:my_flutter_application/screens/registration/OtpScreen.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(fontFamily: 'Montserrat'),
    home: LoginScreen(),
));


