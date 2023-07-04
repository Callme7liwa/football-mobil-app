import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_application/utils/MyAppBoxShadow.dart';
import 'package:my_flutter_application/utils/MyAppColors.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

var width;

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: MyAppColors.backgroundColor,
        body: Stack(
          children: [
            Positioned.fill(
                child: Column(children: [
              ClipPath(
                clipper: MyCustomClipper(),
                child: Container(
                  width: double.infinity,
                  height: 220,
                  decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      image: DecorationImage(
                          image: AssetImage("assets/images/players/neymar.jpg"),
                          fit: BoxFit.cover)),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(1, 1, 1, 0.77),
                        Color(0xFF396AFC).withOpacity(0.7),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )),
                  ),
                ),
              ),
              Expanded(
                child: Container(color: MyAppColors.backgroundColor),
              )
            ])),
            Positioned(
              width: width,
              height: height,
              top: 80,
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/players/neymar.jpg"),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: [MyAppBoxShadow.boxShadowSecond],
                            borderRadius: BorderRadius.circular(60),
                            border: Border.all(
                                color: MyAppColors.blueSecondColor, width: 2),
                          ),
                        ),
                        Positioned(
                          top: 80,
                          left: 80,
                          child: Container(
                              width: 36,
                              height: 36,
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  color: MyAppColors.backgroundColor,
                                  borderRadius: BorderRadius.circular(18),
                                  border: Border.all(
                                      color: MyAppColors.backgroundColor,
                                      width: 2)),
                              child: Container(
                                  width: 36,
                                  height: 36,
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      color: MyAppColors.blueSecondColor,
                                      borderRadius: BorderRadius.circular(14),
                                      border: Border.all(
                                          color: MyAppColors.blueSecondColor,
                                          width: 2)),
                                  child: Image(
                                    image: AssetImage(
                                        "assets/images/icons/icon_flash.png"),
                                  ))),
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          "Update Your Image".toUpperCase(),
                          style: TextStyle(
                              color: MyAppColors.blueSecondColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              fontFamily: "Cairo"),
                        )),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  width: 232,
                  decoration: BoxDecoration(
                    boxShadow: [MyAppBoxShadow.boxShadowFive],
                    color: Color(0x76F1F6F9),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        color:
                            Color.fromRGBO(241, 246, 249, 0.7294117647058823),
                        width: 1),
                  ),
                  child: Stack(children: [
                    Container(
                      width: 115,
                      height: 40,
                      margin: EdgeInsets.only(left: 116),
                      decoration: BoxDecoration(
                        boxShadow: [MyAppBoxShadow.boxShadowSix],
                        color: MyAppColors.blueSecondColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    Row(children: [
                      Container(
                        width: 115,
                        height: 40,
                        decoration: BoxDecoration(
                            /*color: Colors.black87,*/
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                            child: Text(
                          "Informations".toUpperCase(),
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Cairo",
                              fontWeight: FontWeight.bold,
                              fontSize: 11),
                        )),
                      ),
                      Column(children: [
                        Container(
                          width: 115,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                              child: Text(
                            "Password".toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Cairo",
                                fontWeight: FontWeight.bold,
                                fontSize: 11),
                          )),
                        ),
                      ])
                    ]),
                  ]),
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Old Password',
                      labelStyle: TextStyle(fontSize: 11),
                      icon: ImageIcon(AssetImage("assets/images/icons/icon_key.png"))
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Old Password',
                        labelStyle: TextStyle(fontSize: 11),
                        icon: ImageIcon(AssetImage("assets/images/icons/icon_key.png") , color: Colors.amber,)
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Old Password',
                        labelStyle: TextStyle(fontSize: 11),
                        icon: ImageIcon(AssetImage("assets/images/icons/icon_key.png") , color: Colors.amber,)
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 300,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      color: MyAppColors.blueSecondColor ,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Update".toUpperCase(),
                        style: TextStyle(color : Colors.white , fontWeight: FontWeight.bold , fontFamily: "Cairo" , fontSize: 12),
                      ),
                    ),
                  )
                ),
              ]),
            )
          ],
        ));
  }
}

Widget renderUpdatePasswordWidget() {
  return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white60, borderRadius: BorderRadius.circular(5)),
        child: Row(
          children: [
            TextField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0.0),
                labelText: 'Password',
                hintText: 'Password',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                ),
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
                prefixIcon: Icon(
                  Icons.key,
                  color: Colors.black,
                  size: 18,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                floatingLabelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.5),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ],
        ),
      ));
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();
    path.lineTo(0, h - 30);
    path.quadraticBezierTo(
      w * 0.25,
      h - 70,
      w * 0.5,
      h - 50,
    );
    path.quadraticBezierTo(
      w * 0.75,
      h - 30,
      w,
      h - 30,
    );
    path.lineTo(w, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
