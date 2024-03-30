import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../../StudioProjects/Deliver_Ease/lib/utils/MyAppBoxShadow.dart';
import 'package:my_flutter_application/utils/MyAppColors.dart';

class ProfileScreenSecond extends StatefulWidget {
  const ProfileScreenSecond({Key? key}) : super(key: key);

  @override
  State<ProfileScreenSecond> createState() => _ProfileScreenSecondState();
}

class _ProfileScreenSecondState extends State<ProfileScreenSecond> {
  var screenWidth, screenHeight;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(children: [
            SizedBox(
              height: screenHeight * 0.025,
            ),
            SizedBox(
                width: screenWidth * 0.9,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: MyAppColors.blueSecondColor,
                                borderRadius: BorderRadius.circular(22),
                                boxShadow: [MyAppBoxShadow.boxShadowSecond]),
                            child: Center(
                                child: Icon(Icons.chevron_left,
                                    color: Colors.white))),
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                              boxShadow: [MyAppBoxShadow.boxShadowSecond],
                              borderRadius: BorderRadius.circular(35),
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/players/neymar.jpg"),
                                  fit: BoxFit.cover),
                              border: Border.all(
                                  color: Color.fromRGBO(
                                      1, 1, 1, 0.2901960784313726),
                                  width: 2)),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Neymar Junior".toUpperCase(),
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: screenWidth * 0.25,
                      height: 1.5,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(1, 1, 1, 0.07450980392156863)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        makeCardInformation("assets/images/icons/icon_email.png","ayoubseddiki132@gmail.com" ),
                        makeCardInformation("assets/images/icons/icon_map.png","Fes , Maroc", ),
                      ],
                    ) ,
                    SizedBox(height : 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        makeCardInformation("assets/images/icons/icon_phone.png", "06 45 29 83 85")
                      ],
                    ) ,
                  ],
                )),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            SizedBox(
              width: screenWidth * 0.9,
              child: Wrap(
                runSpacing: 15,
                children: [
                  makeCardSettings("assets/images/icons/icon_information_second.png" ,"Profile Management" ),
                  makeCardSettings("assets/images/icons/icon_password.png" ,"Change Password" ),
                  makeCardSettings("assets/images/icons/icon_offer.png", "Requests Management"),
                  makeCardSettings( "assets/images/icons/icon_chance.png", "Offers management"),
                ],
              ),
            ),
            SizedBox(height : 15),
            Expanded(
              child : Container(
                width : double.infinity ,
                padding : EdgeInsets.all(10),
                decoration : BoxDecoration(
                  color : MyAppColors.blackColor ,
                  borderRadius: BorderRadius.only(topRight : Radius.circular(20) , topLeft : Radius.circular(20)) ,
                  boxShadow : [MyAppBoxShadow.boxShadowSecond]
                ) ,
                child : Column(mainAxisAlignment:MainAxisAlignment.center , children : [
                  Text("Last Update".toUpperCase() , style : TextStyle(color : Colors.white , fontWeight: FontWeight.bold , letterSpacing: 1)),
                  SizedBox(height : 20),
                  Text("Thur 31 mai 2023 , at 22:10" , style : TextStyle(color : Colors.white  , letterSpacing: 1  , fontSize: 11)),
                  SizedBox(height : 20),
                  Container(
                    width: 30,
                    height : 30,
                    padding: EdgeInsets.all(5),
                    decoration : BoxDecoration(
                      color : MyAppColors.whiteCardColor,
                      borderRadius : BorderRadius.circular(15) ,
                      boxShadow: [MyAppBoxShadow.boxShadowSecond]
                    ),
                    child : Image.asset("assets/images/icons/icon_flash.png" )
                  )
                ])
              )
            )
          ]),
        ),
      ),
    );
  }

  Widget makeCardInformation( String iconPath , String value){
    return  Container(
      padding:
      EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      margin: EdgeInsets.only(left : 10),
      decoration: BoxDecoration(
          color: MyAppColors.whiteCardColor,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [MyAppBoxShadow.boxShadowSecond],
          border: Border.all(
              color: Color.fromRGBO(
                  1, 1, 1, 0.17647058823529413))),
      child: Row(
        children: [
          Image.asset(iconPath,
              width: 20, height: 20),
          SizedBox(
            width: 2,
          ),
          Text(
            value,
            style:
            TextStyle(color: Colors.black, fontSize: 9),
          )
        ],
      ),
    );
  }

  Widget makeCardSettings(String iconPath , String value) {
    return  Container(
        width: double.infinity,
        padding:
        EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
        height: 60,
        decoration: BoxDecoration(
            color: MyAppColors.whiteCardColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [MyAppBoxShadow.boxShadowSecond]),
        child: Row(
          children: [
            Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white.withOpacity(0.7),
                    boxShadow: [MyAppBoxShadow.boxShadowSecond]),
                child: Center(
                    child: Image.asset(
                      iconPath,
                      height: 25,
                      width: 25,
                    ))),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                value.toUpperCase(),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 11,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(children : [
              Icon(Icons.chevron_right  , size: 12 , color : Colors.black.withOpacity(0.2) ),
              Icon(Icons.chevron_right , size: 15, color : Colors.black.withOpacity(0.5)),
              Icon(Icons.chevron_right , size: 18, color : Colors.black.withOpacity(1)),
            ])
          ],
        )) ;

  }
}
