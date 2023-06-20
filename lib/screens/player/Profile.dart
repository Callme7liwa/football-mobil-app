import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_application/utils/FunctionsUtils.dart';
import 'package:my_flutter_application/utils/MyAppBoxShadow.dart';
import 'package:my_flutter_application/utils/MyAppColors.dart';
import 'package:my_flutter_application/utils/MyAppLinearGradient.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late var screenWidth;
  Future<Color?> extractedColor = FunctionUtils.extractDominantColor("assets/images/players/ziyech.jpg");



  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    final desiredHeight = screenHeight * 0.5;
    final screenTopHeight = screenHeight * 0.3;
    Color dominantColor = MyAppColors.greenSecondColor;

    return Scaffold(
      body: FutureBuilder<Color?>(
        future: extractedColor,
        builder: (BuildContext context, AsyncSnapshot<Color?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Show a loading indicator while waiting for the color extraction
          } else if (snapshot.hasError) {
            return Text(
                'Error: ${snapshot.error}'); // Show an error message if the extraction fails
          } else {
            Color? extractedColor = snapshot.data;
            return Stack(
              children: [
                Positioned.fill(
                  child: Stack(
                    children: [
                      Container(
                        height: desiredHeight,
                        child: Stack(children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/players/ziyech.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(1, 1, 1, 0.5450980392156862),
                                  extractedColor?.withOpacity(0.7) ?? MyAppColors.blueSecondColor
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),


                          Row(children: [
                            SafeArea(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Row(children: [
                                    Icon(
                                      Icons.chevron_left,
                                      color : extractedColor ?? MyAppColors.blueSecondColor,
                                      size: 19,
                                    ),
                                    Text("BACK".toUpperCase(),
                                        style: TextStyle(
                                            color : extractedColor ?? MyAppColors.blueSecondColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11))
                                  ]),
                                ),
                              ),
                            )
                          ])
                        ]),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: desiredHeight - 80),
                          decoration: BoxDecoration(
                              color : MyAppColors.backgroundColor,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20))),
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      width: screenWidth,
                      height: screenTopHeight,
                      child:
                      Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                          Text(
                            "hakim ziyech".toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                        Divider(
                            height: 5,
                            thickness: 1,
                            endIndent: screenWidth * 0.2,
                            indent: screenWidth * 0.2,
                            color: Colors.white),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                            decoration: BoxDecoration(
                                color: MyAppColors.backgroundColor,
                                borderRadius: BorderRadius.circular(25)),
                            child: Row(mainAxisSize: MainAxisSize.min, children: [
                              Text(
                                "Edit your profile".toUpperCase(),
                                style: TextStyle(
                                    color : extractedColor ?? MyAppColors.blueSecondColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: extractedColor ?? MyAppColors.blueSecondColor,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Center(
                                      child: Icon(
                                        Icons.edit,
                                        color: MyAppColors.backgroundColor,
                                        size: 16,
                                      )))
                            ]))
                      ]),
                    ),
                    SizedBox(
                      height: (screenHeight * 0.2 - 80),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                          child: Container(
                            margin: EdgeInsets.only(top: 20),
                            width: screenWidth,
                            child: Column(
                              children: [
                                Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [
                                  displayInformationContainer("assets/images/icons/icon_last_update.png","Last Update" , "11-12-2023 at 19:30"),
                                  displayInformationContainer("assets/images/icons/icon_last_update.png","Last Update" , "11-12-2023 at 19:30"),
                                ],),
                                displayManagementContainer(
                                  "assets/images/icons/icon_information_second.png",
                                  "Profile management",
                                ),
                                displayManagementContainer(
                                  "assets/images/icons/icon_offer.png",
                                  "Request management",
                                ),
                                displayManagementContainer(
                                  "assets/images/icons/icon_request_second.png",
                                  "Offers management",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            );

          }
        },
      ),
    );
  }

  Widget displayManagementContainer(String iconPath, String title) {
    Future<Color?> extractedColor =
        FunctionUtils.extractDominantColor(iconPath);
    Color defaultColor = Colors.grey;
    return Container(
      width: double.infinity,

      child: FutureBuilder<Color?>(
        future: extractedColor,
        builder: (BuildContext context, AsyncSnapshot<Color?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Show a loading indicator while waiting for the color extraction
          } else if (snapshot.hasError) {
            return Text(
                'Error: ${snapshot.error}'); // Show an error message if the extraction fails
          } else {
            Color? extractedColor = snapshot.data;
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              margin: EdgeInsets.only(top: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                  boxShadow: [MyAppBoxShadow.boxShadowSecond],
                  image: DecorationImage(
                    image: AssetImage("assets/images/background.jpg"),
                    fit: BoxFit.cover
                  ),
                  /*gradient: LinearGradient(
                    colors: [
                      extractedColor?.withOpacity(0.8) ?? defaultColor,
                      Color.fromRGBO(1, 1, 1, 0.77)
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),*/
                  borderRadius: BorderRadius.circular(10)),
              child: Row(mainAxisAlignment : MainAxisAlignment.spaceBetween , children: [
                Row(children: [
                  Container(
                    width: 40,
                    height: 40,
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Image(
                      image: AssetImage(iconPath),
                   ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.02,
                  ),
                  Text(title.toUpperCase(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold))
                ]),
                Icon(Icons.chevron_right , color: Colors.white,)
              ]),
            );
          }
        },
      ),
    );
  }

  Widget displayInformationContainer(String iconPath , String title , String value){

    var widthContainer = screenWidth * 0.45;

    return Container(
      width: widthContainer,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover
        ),
        boxShadow: [MyAppBoxShadow.boxShadowSecond]
      ),
      child: Column( children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5)
          ),
          child: Center(
            child: Row(children: [
              Image(image: AssetImage(iconPath) , width: 20, height: 20,),
              SizedBox(width: 5,),
              Text(title.toUpperCase() , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontFamily: "Cairo" ,fontSize: 11),),
            ],),
          ),
        ),
        Container(
          height: widthContainer*0.3,
          child: Center(
            child: Divider(
              thickness: 1.5,
              color: Colors.white,
              indent: (widthContainer)*0.1,
              endIndent: (widthContainer)*0.1,
            ),
          ),
        ),
        Container(
            height:widthContainer*0.3 ,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  value.toUpperCase() ,
                  style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontFamily: "Cairo" , fontSize: 11),
                ),
              ],
            )
        ),
      ],),
    );
  }
}
