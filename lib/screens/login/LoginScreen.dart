import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_application/utils/MyAppColors.dart';
import '../../../../../../StudioProjects/Deliver_Ease/lib/utils/MyAppBoxShadow.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>  {
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: MyAppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              SizedBox(height: 30,),
              //Start Header
              Container(
                width: double.infinity,
                height: 100,
                child: Image(image: AssetImage("assets/images/ball.png")),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("LOG".toUpperCase() , style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold , color: MyAppColors.blackColor , fontFamily: "Cairo" ),),
                  Text(" IN !".toUpperCase() , style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold , color: MyAppColors.blueSecondColor , fontFamily: "Cairo" ),),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text("Welcome back , you have been missed <3.".toUpperCase() , style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold , color: Color.fromRGBO(168, 168, 168, 0.7294117647058823)),),
              ),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      child: Image(image: AssetImage("assets/images/ball.png") ,),
                    ),
                    Expanded(
                        child: Container(
                          height: 1,
                          color: Color.fromRGBO(
                              93, 93, 93, 0.13137254901960784),
                        )
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      child: Image(image: AssetImage("assets/images/ball.png") ,),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              // Inputs .
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Row(
                        children: [
                          Container(
                            width: 20,
                            height:20,
                            child: Image(image: AssetImage("assets/images/icons/icon_email.png")),
                          ),
                          SizedBox(width: 5,),
                          Text("Your email".toUpperCase() , textAlign: TextAlign.left , style: TextStyle(color: MyAppColors.blackColor , fontWeight: FontWeight.bold , fontFamily: "Cairo" , fontSize: 12),),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    CupertinoTextField(
                      style: TextStyle(color: Colors.black , fontFamily: "Nunito" , fontSize: 13),
                      placeholder: 'Ayoubseddiki132@gmail.com',
                      placeholderStyle: TextStyle(color: Color.fromRGBO(
                          103, 103, 103, 0.7333333333333333) , fontSize: 13),
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                      decoration: BoxDecoration(
                        color: MyAppColors.whiteCardColor,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          MyAppBoxShadow.boxShadowSecond
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Row(
                        children: [
                          Image(image: AssetImage("assets/images/icons/icon_password.png"),width: 20,),
                          SizedBox(width: 5,),
                          Text("your password".toUpperCase() , textAlign: TextAlign.left , style: TextStyle(color: MyAppColors.blackColor , fontWeight: FontWeight.bold , fontFamily: "Cairo" , fontSize: 12),),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    CupertinoTextField(
                      style: TextStyle(color: Colors.black , fontFamily: "Nunito" , fontSize: 13),
                      placeholder: '*******',
                      placeholderStyle: TextStyle(color: Color.fromRGBO(
                          103, 103, 103, 0.7333333333333333) , fontSize: 13),
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                      decoration: BoxDecoration(
                        color: MyAppColors.whiteCardColor,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          MyAppBoxShadow.boxShadowSecond
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //End Header
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical:15),
                  decoration: BoxDecoration(
                    color: MyAppColors.blueSecondColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [MyAppBoxShadow.boxShadowThird]
                  ),
                  child: Center(
                    child: Text("Login".toUpperCase() , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold ),),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Container(
                          height: 1,
                          color: Color.fromRGBO(
                              93, 93, 93, 0.3411764705882353),
                        )
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      child: Image(image: AssetImage("assets/images/ball.png") ,),
                    ),
                    Text("Or Login with".toUpperCase() , style: TextStyle(color: MyAppColors.blueSecondColor , fontSize: 12 , fontWeight: FontWeight.bold),),
                    Container(
                      width: 20,
                      height: 20,
                      child: Image(image: AssetImage("assets/images/ball.png") ,),
                    ),
                    Expanded(
                        child: Container(
                          height: 1,
                          color: Color.fromRGBO(
                              93, 93, 93, 0.3411764705882353),
                        )
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              IntrinsicWidth(
                child: Container(
                  decoration: BoxDecoration(
                    color: MyAppColors.backgroundColor,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Color.fromRGBO(
                        1, 1, 1, 0.07450980392156863) ,width: 1)

                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 130,
                        padding: EdgeInsets.symmetric( vertical: 15),
                        decoration: BoxDecoration(
                          color: MyAppColors.backgroundColor,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(5),bottomLeft: Radius.circular(5)),
                          boxShadow: [MyAppBoxShadow.boxShadowThird]
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.facebook , color: Color.fromRGBO(0, 14, 255, 1.0),),
                            SizedBox(width: 5,),
                            Text("Facebook".toUpperCase() , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 11),)
                          ],
                        ),
                      ),
                      Container(
                        width: 130,
                        padding: EdgeInsets.symmetric( vertical: 15),
                        decoration: BoxDecoration(
                          boxShadow: [MyAppBoxShadow.boxShadowFour],
                          borderRadius: BorderRadius.only(topRight: Radius.circular(5),bottomRight: Radius.circular(5)),
                        ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(image: AssetImage("assets/images/icons/icon_gmail.png"), width: 24,),
                              SizedBox(width: 5,),
                              Text("Gmail".toUpperCase() , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 11),)
                            ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("You Don't have an account yet ? ".toUpperCase(),style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                  Text("Register here".toUpperCase(),style: TextStyle(color : MyAppColors.blueSecondColor , fontFamily: "Cairo",fontWeight:FontWeight.bold,fontSize: 11),),
                ],
              ),
              SizedBox(height: 10,),
              Image(image: AssetImage("assets/images/ball.png") , width: 20,height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}
