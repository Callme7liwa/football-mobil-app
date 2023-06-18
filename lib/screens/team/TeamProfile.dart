import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_flutter_application/utils/FunctionsUtils.dart';
import 'package:my_flutter_application/utils/MyAppBoxShadow.dart';
import 'package:my_flutter_application/utils/MyAppColors.dart';

class InfoTeam {
  final String iconPath;
  final String title;
  final String information;
  final Color? color;

  InfoTeam(this.iconPath, this.title, this.information, this.color);
}

class TeamProfile extends StatefulWidget {
  const TeamProfile({Key? key}) : super(key: key);

  @override
  _TeamProfileState createState() => _TeamProfileState();
}

class _TeamProfileState extends State<TeamProfile> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  Color dominantColor = MyAppColors.blueSecondColor;
  int currentTab = 0 ;

  @override
  void initState() {
    super.initState();
    setDominantColor();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

// Call this method whenever the `currentTab` value changes
  void animateTab() {
    _animationController.forward(from: 0.0);
  }



  List<InfoTeam> informations = [
    InfoTeam(
        "assets/images/ball.png", 'Playing', "10", MyAppColors.blueSecondColor),
    InfoTeam("assets/images/icons/icon_losing.png", 'Losing', "3",
        MyAppColors.redColor),
    InfoTeam("assets/images/icons/icon_winning.png", 'Winning', "7",
        MyAppColors.greenSecondColor),
    InfoTeam("assets/images/icons/icon_draw.png", 'Draw', "2",
        MyAppColors.beigeColor),
  ];



  Future<void> setDominantColor() async {
    Color? extractedColor = await FunctionUtils.extractDominantColor(
        "assets/images/equipes/barca.png");
    setState(() {
      dominantColor = extractedColor ?? MyAppColors.blueSecondColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final desiredHeight = screenHeight / 2;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                Container(
                  height: desiredHeight,
                  child: Stack(children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/equipes/background/bayern.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(1, 1, 1, 0.5450980392156862),
                            dominantColor.withOpacity(0.7)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ]),
                ),
                Expanded(
                  child: Container(
                    color: MyAppColors.backgroundColor,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: desiredHeight - 35,
            width: screenWidth * 0.8,
            left: screenWidth * 0.1,
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [MyAppBoxShadow.boxShadowSecond]),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 10.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: informations.map((information) {
                      final index = informations.indexOf(information);
                      return renderItemTeam(
                          information, index, screenWidth * 0.8);
                    }).toList()),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Container(
                    height: desiredHeight,
                    child: Stack(
                      children: [
                        makeAppBar(),
                        Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(
                                  image: AssetImage(
                                      "assets/images/equipes/barca.png"),
                                  width: 150,
                                  height: 150),
                              Text(
                                "Bayern Munich",
                                style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: MyAppColors.backgroundColor),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Team Members : ",
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(241, 246, 249,
                                              0.7294117647058823),
                                          fontFamily: "Cairo")),
                                  Text("21",
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w900,
                                          color: MyAppColors.backgroundColor,
                                          fontFamily: "Cairo"))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
          Positioned(
            top: desiredHeight + 50,
            child: IntrinsicWidth(
              child: Transform.translate(
                offset: Offset(screenWidth / 2 - 150, 0.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [MyAppBoxShadow.boxShadowThird],
                      color: MyAppColors.backgroundColor),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedBuilder(
                            animation: _opacityAnimation,
                            builder: (context, child) {
                              return Opacity(
                                opacity: _opacityAnimation.value,
                                child: child,
                              );
                            },
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  currentTab = 0; // Update currentTab to the desired value
                                });
                                animateTab();
                              },
                              child: Container(
                                width: 100,
                                padding: EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(25),
                                    ),
                                    boxShadow: [MyAppBoxShadow.boxShadowThird],
                                    color: currentTab == 0 ? dominantColor.withOpacity(0.7) : null) ,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Informations".toUpperCase(),
                                      style: TextStyle(
                                        color: currentTab == 0 ? Colors.white : Colors.black ,
                                        fontFamily: "Cairo",
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          AnimatedBuilder(
                            animation: _opacityAnimation,
                            builder: (context, child) {
                              return Opacity(
                                opacity: _opacityAnimation.value,
                                child: child,
                              );
                            },
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  currentTab = 1; // Update currentTab to the desired value
                                });
                                animateTab();
                              },
                              child: Container(
                                width: 100,
                                padding: EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(25),
                                    ),
                                    boxShadow: [MyAppBoxShadow.boxShadowThird],
                                    color: currentTab == 1 ? dominantColor.withOpacity(0.7) : null) ,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Statistiques".toUpperCase(),
                                      style: TextStyle(
                                        color: currentTab == 1 ? Colors.white : Colors.black ,
                                        fontFamily: "Cairo",
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          AnimatedBuilder(
                            animation: _opacityAnimation,
                            builder: (context, child) {
                              return Opacity(
                                opacity: _opacityAnimation.value,
                                child: child,
                              );
                            },
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  currentTab = 2; // Update currentTab to the desired value
                                });
                                animateTab();
                              },
                              child: Container(
                                width: 100,
                                padding: EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(25),
                                    ),
                                    boxShadow: [MyAppBoxShadow.boxShadowThird],
                                    color: currentTab == 2 ? dominantColor.withOpacity(0.7) : null) ,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Historique".toUpperCase(),
                                      style: TextStyle(
                                        color: currentTab == 2 ? Colors.white : Colors.black ,
                                        fontFamily: "Cairo",
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: desiredHeight + 100,
            width: screenWidth,
            bottom: 0,
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              child: renderContent(desiredHeight,screenWidth),
            ),
          ),
        ],
      ),
    );
  }

  Widget renderContent(desiredHeight,screenWidth) {
    switch (currentTab) {
      case 0:
        return InformationContent(desiredHeight,screenWidth); // Replace with your widget for the "Informations" tab
      case 1:
        return StatisticsContent(desiredHeight,screenWidth); // Replace with your widget for the "Statistiques" tab
      case 2:
        return HistoriqueContent(desiredHeight,screenWidth); // Replace with your widget for the "Historique" tab
      default:
        return Container(); // Replace with a default widget if needed
    }
  }

  Widget makeAppBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: MyAppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [MyAppBoxShadow.boxShadowSecond]),
              child: Center(
                child: Text(
                  String.fromCharCode(Icons.chevron_left.codePoint),
                  style: TextStyle(
                    fontFamily: Icons.chevron_left.fontFamily,
                    fontSize: 28,
                    color: MyAppColors.blueSecondColor,
                    shadows: [MyAppBoxShadow.boxShadowSecond],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget renderItemTeam(InfoTeam information, int index, screenWidth) {
    return Container(
      constraints: BoxConstraints.tightForFinite(),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          /*color: information.color ?? MyAppColors.blueSecondColor,*/
          color: MyAppColors.backgroundColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [MyAppBoxShadow.boxShadowSecond]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            information.title,
            style: TextStyle(
                color: Colors.black87,
                fontFamily: "Cairo",
                fontWeight: FontWeight.bold,
                fontSize: 11),
          ),
          Text(
            information.information,
            style: TextStyle(
                color: Colors.black87,
                fontFamily: "Cairo",
                fontWeight: FontWeight.bold,
                fontSize: 12),
          )
        ],
      ),
    );
  }

  Widget makeItemInfoTeam(String iconPath, String title, String value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Image(
                image: AssetImage(iconPath),
                width: 20,
                height: 20,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                title.toUpperCase(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "Cairo",
                    fontSize: 11),
              )
            ],
          ),
          Text(value.toUpperCase(),
              style: TextStyle(
                  color: dominantColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Cairo",
                  fontSize: 11))
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200, // Hauteur du BottomSheet
          child: Center(
            child: Text('Contenu du BottomSheet'),
          ),
        );
      },
    );
  }

  Widget makeTitle (String title){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal : 15.0 , vertical : 12),
      child: Row(
        children : [
          Text(title.toUpperCase() , style : TextStyle(color : dominantColor , fontSize: 13 , fontWeight: FontWeight.bold )),
          SizedBox(width: 5,),
          Expanded(
            child: Container(
              width: double.infinity,
              height: 1,
              decoration : BoxDecoration(
                color: Colors.black87.withOpacity(0.1)
              )
            ),
          )
        ]
      ),
    );
  }

  Widget makeItemPlayer (String number , String player_name , String player_age) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          decoration : BoxDecoration(
            color : Colors.white.withOpacity(0.7) ,
            boxShadow:  [MyAppBoxShadow.boxShadowSecond],
            borderRadius: BorderRadius.circular(10)
          ),
          child: Row(
            children  : [
              Row(
                children : [
                  Container(
                    width: 30,
                    height: 30,
                    decoration : BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color : MyAppColors.backgroundColor,
                      boxShadow: [MyAppBoxShadow.boxShadowSecond]
                    ),
                    child: Center(child: Text(number.toUpperCase() , style: TextStyle(color: MyAppColors.blackColor , fontFamily : "Cairo" , fontWeight: FontWeight.bold),)),
                  ),
                  SizedBox(width: 10,),
                  Text(player_name.toUpperCase() ,style: TextStyle(color: Colors.black87 , fontFamily : "Cairo" , fontSize: 13 , fontWeight: FontWeight.bold , letterSpacing: 0.5),),
                ]
              ),
              SizedBox(width: 5,),
              Expanded(
                child: Container(
                    width: double.infinity,
                    height: 1,
                    decoration : BoxDecoration(
                        color: Colors.black87.withOpacity(0.1)
                    )
                ),
              ),
              SizedBox(width: 5,),
              Text("26 ans".toUpperCase() , style : TextStyle(color : Colors.black , fontWeight : FontWeight.bold , fontFamily: "Nunito", fontSize : 11)),
              SizedBox(width: 5,),
              Expanded(
                child: Container(
                    width: double.infinity,
                    height: 1,
                    decoration : BoxDecoration(
                        color: Colors.black87.withOpacity(0.1)
                    )
                ),
              ),
              SizedBox(width: 5,),
              Container(
                width: 30,
                height: 30,
                decoration : BoxDecoration(
                  color : dominantColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [MyAppBoxShadow.boxShadowSecond]
                ),
                child:  Icon(Icons.chevron_right , color: MyAppColors.backgroundColor , size: 19,),
              )
            ]
          ),
      ),
    );
  }

  Widget InformationContent(desiredHeight,screenWidth)
  {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              makeTitle("General Information"),
              makeItemInfoTeam(
                "assets/images/icons/icon_map.png",
                "location",
                "Fes, Morocco",
              ),
              makeItemInfoTeam(
                "assets/images/icons/icon_founded.png",
                "Founded At",
                "01/11/2022",
              ),
              makeItemInfoTeam(
                "assets/images/icons/icon_player.png",
                "Players",
                "26",
              ),
              makeTitle("Players"),
              makeItemPlayer("1", "Ayoub Seddiki", "26 ans"),
              makeItemPlayer("1", "Ayoub Seddiki", "26 ans"),
              makeItemPlayer("1", "Ayoub Seddiki", "26 ans"),
            ],
          ),
        ),
    );
  }

  Widget StatisticsContent(desiredHeight,screenWidth)
  {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            makeTitle("Team performance metrics per game"),
            makeItemInfoTeam(
              "assets/images/icons/icon_goal.png",
              "Goals",
              "2",
            ),
            makeItemInfoTeam(
              "assets/images/icons/icon_soccer_ball.png",
              "Assists",
              "1",
            ),
            makeItemInfoTeam(
              "assets/images/icons/icon_draw.png",
              "Contre goals",
              "1",
            ),
            makeTitle("Player statistics"),
            makeItemInfoTeam(
              "assets/images/icons/icon_top_soccer.png",
              "Top Soccer ",
              "Ayoub Sghir",
            ),
            makeItemInfoTeam(
              "assets/images/icons/icon_soccer_ball.png",
              "Top Assister",
              "Finida",
            ),
            makeItemInfoTeam(
              "assets/images/icons/icon_rebound_leader.png",
              "rebound leader",
              "Ahmed Aouinti",
            ),
          ],
        ),
      ),
    );
  }

  Widget HistoriqueContent(desiredHeight,screenWidth) {
    return Text("Historique");
  }

}
