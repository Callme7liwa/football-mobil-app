import 'package:flutter/material.dart';
import 'package:my_flutter_application/screens/HomeScreen.dart';
import 'package:my_flutter_application/screens/WelcomScreenSecond.dart';
import 'package:my_flutter_application/screens/WelcomeScreen.dart';
import 'package:my_flutter_application/screens/WelcomeThird.dart';
import 'package:my_flutter_application/screens/login/LoginPage.dart';
import 'package:my_flutter_application/screens/login/LoginScreen.dart';
import 'package:my_flutter_application/screens/menu/MenuScreen.dart';
import 'package:my_flutter_application/screens/player/EditProfil.dart';
import 'package:my_flutter_application/screens/player/ListPlayers.dart';
import 'package:my_flutter_application/screens/player/Profile.dart';
import 'package:my_flutter_application/screens/player/ProfileScreenSecond.dart';
import 'package:my_flutter_application/screens/player/RequestDetails.dart';
import 'package:my_flutter_application/screens/player/RequestPlayer.dart';
import 'package:my_flutter_application/screens/player/ProfilePlayer.dart';
import 'package:my_flutter_application/screens/register/RegisterScreen.dart';
import 'package:my_flutter_application/screens/registration/OtpScreen.dart';
import 'package:my_flutter_application/screens/team/TeamProfile.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(fontFamily: 'Montserrat'),
    home: RequestDetails(),
));


