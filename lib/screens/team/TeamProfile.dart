import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';
import 'package:my_flutter_application/utils/FunctionsUtils.dart';
import 'package:my_flutter_application/utils/MyAppBoxShadow.dart';
import 'package:my_flutter_application/utils/MyAppColors.dart';
import 'package:lorem_ipsum/util/words.dart';

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

class _TeamProfileState extends State<TeamProfile>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  //
  bool popUpIsShowing = false;
  //
  Color dominantColor = MyAppColors.blueSecondColor;
  //
  int currentTab = 0;
  int stateData = 0;
  //
  int reviewCurrentTab = 0;
  //
  var screenWidth, screenHeight;
  late double desiredHeight;
  //

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
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    desiredHeight = screenHeight / 2;
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
          SafeArea(child: makeAppBar()),
          renderContentByState(),
          popUpIsShowing == true ? makePopUp() : Container()
        ],
      ),
    );
  }

  Widget renderContentByState() {
    return stateData == 0
        ? firstPage()
        : stateData == 1
            ? makeReviewsTeam()
            : makeRequestByTeam();
  }

  Widget makeAppBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: MyAppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [MyAppBoxShadow.boxShadowSecond]),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      popUpIsShowing = !popUpIsShowing;
                    });
                  },
                  child: Text(
                    String.fromCharCode(Icons.more_vert.codePoint),
                    style: TextStyle(
                      fontFamily: Icons.more_vert.fontFamily,
                      fontSize: 28,
                      color: MyAppColors.blueSecondColor,
                      shadows: [MyAppBoxShadow.boxShadowSecond],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget firstPage() {
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

    Widget makeTitle(String title) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12),
        child: Row(children: [
          Text(title.toUpperCase(),
              style: TextStyle(
                  color: dominantColor,
                  fontSize: 13,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Container(
                width: double.infinity,
                height: 1,
                decoration:
                    BoxDecoration(color: Colors.black87.withOpacity(0.1))),
          )
        ]),
      );
    }

    Widget makeItemPlayer(
        String number, String player_name, String player_age) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.7),
              boxShadow: [MyAppBoxShadow.boxShadowSecond],
              borderRadius: BorderRadius.circular(10)),
          child: Row(children: [
            Row(children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: MyAppColors.backgroundColor,
                    boxShadow: [MyAppBoxShadow.boxShadowSecond]),
                child: Center(
                    child: Text(
                  number.toUpperCase(),
                  style: TextStyle(
                      color: MyAppColors.blackColor,
                      fontFamily: "Cairo",
                      fontWeight: FontWeight.bold),
                )),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                player_name.toUpperCase(),
                style: TextStyle(
                    color: Colors.black87,
                    fontFamily: "Cairo",
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5),
              ),
            ]),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Container(
                  width: double.infinity,
                  height: 1,
                  decoration:
                      BoxDecoration(color: Colors.black87.withOpacity(0.1))),
            ),
            SizedBox(
              width: 5,
            ),
            Text("26 ans".toUpperCase(),
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Nunito",
                    fontSize: 11)),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Container(
                  width: double.infinity,
                  height: 1,
                  decoration:
                      BoxDecoration(color: Colors.black87.withOpacity(0.1))),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  color: dominantColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [MyAppBoxShadow.boxShadowSecond]),
              child: Icon(
                Icons.chevron_right,
                color: MyAppColors.backgroundColor,
                size: 19,
              ),
            )
          ]),
        ),
      );
    }

    Widget InformationContent(desiredHeight, screenWidth) {
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

    Widget StatisticsContent(desiredHeight, screenWidth) {
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

    Widget HistoriqueContent(desiredHeight, screenWidth) {
      return Text("Historique");
    }

    Widget renderContent(desiredHeight, screenWidth) {
      switch (currentTab) {
        case 0:
          return InformationContent(desiredHeight,
              screenWidth); // Replace with your widget for the "Informations" tab
        case 1:
          return StatisticsContent(desiredHeight,
              screenWidth); // Replace with your widget for the "Statistiques" tab
        case 2:
          return HistoriqueContent(desiredHeight,
              screenWidth); // Replace with your widget for the "Historique" tab
        default:
          return Container(); // Replace with a default widget if needed
      }
    }
    return Stack(
      children: [
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
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
                                        color: Color.fromRGBO(
                                            241, 246, 249, 0.7294117647058823),
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
                                currentTab =
                                    0; // Update currentTab to the desired value
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
                                  color: currentTab == 0
                                      ? dominantColor.withOpacity(0.7)
                                      : null),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Informations".toUpperCase(),
                                    style: TextStyle(
                                      color: currentTab == 0
                                          ? Colors.white
                                          : Colors.black,
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
                                currentTab =
                                    1; // Update currentTab to the desired value
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
                                  color: currentTab == 1
                                      ? dominantColor.withOpacity(0.7)
                                      : null),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Statistiques".toUpperCase(),
                                    style: TextStyle(
                                      color: currentTab == 1
                                          ? Colors.white
                                          : Colors.black,
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
                                currentTab =
                                    2; // Update currentTab to the desired value
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
                                  color: currentTab == 2
                                      ? dominantColor.withOpacity(0.7)
                                      : null),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Historique".toUpperCase(),
                                    style: TextStyle(
                                      color: currentTab == 2
                                          ? Colors.white
                                          : Colors.black,
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
            child: renderContent(desiredHeight, screenWidth),
          ),
        ),
      ],
    );
  }

  Widget makePopUp() {
    const items = ["first page", "reviews", "request"];
    double popUpWidth = 200;
    double popUpHeight = (items.length) * 70;
    return AnimatedContainer(
      duration: Duration(milliseconds: 1000),
      width: screenWidth,
      height: screenHeight,
      decoration: BoxDecoration(
        color: dominantColor.withOpacity(0.4),
      ),
      child: Center(
        child: Stack(children: [
          Container(
            width: popUpWidth,
            height: popUpHeight,
            decoration: BoxDecoration(
                color: MyAppColors.backgroundColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [MyAppBoxShadow.boxShadow]),
            child: Column(
              children: items.map((e) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      stateData = items.indexOf(e.toString());
                      popUpIsShowing = !popUpIsShowing;
                    });
                  },
                  child: Container(
                    width: popUpWidth,
                    height: popUpHeight / items.length,
                    decoration: BoxDecoration(
                        border: items.indexOf(e.toString()) != items.length - 1
                            ? Border(
                                bottom: BorderSide(
                                    color: Color.fromRGBO(1, 1, 1, 0.1),
                                    width: 1))
                            : null),
                    child: Center(
                        child: Text(
                      e.toUpperCase(),
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Cairo",
                          letterSpacing: 1),
                    )),
                  ),
                );
              }).toList(),
            ),
          ),
          Positioned(
            right: 10,
            top: 10,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  popUpIsShowing = !popUpIsShowing;
                });
              },
              child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                    color: dominantColor,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [MyAppBoxShadow.boxShadowSecond]),
                child: Center(
                    child: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 14,
                  weight: 800,
                )),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget makeReviewsTeam() {
    String text = loremIpsum(
      words: 30,
    );
    final double choiceWidthCard = screenWidth * 0.9;

    Widget makeChoiceItem(int index, String name) {
      return GestureDetector(
        onTap: () {
          setState(() {
            reviewCurrentTab = index;
          });
        },
        child: Container(
            width: choiceWidthCard * 0.46,
            decoration: BoxDecoration(
                color: reviewCurrentTab == index ? Colors.white : null,
                borderRadius: BorderRadius.circular(40)),
            child: Center(
                child: Text(name.toUpperCase(),
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 11)))),
      );
    }

    return Stack(children: [
      Positioned(
        top: (desiredHeight / 2 - 50),
        width: screenWidth,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                color: MyAppColors.backgroundColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [MyAppBoxShadow.boxShadowSecond]),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Wrap(spacing: 5, children: [
                Container(
                  constraints: BoxConstraints.tightForFinite(),
                  padding: EdgeInsets.all(10),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      /*color: information.color ?? MyAppColors.blueSecondColor,*/
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [MyAppBoxShadow.boxShadowSecond]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Icon(
                          Icons.confirmation_number_rounded,
                          size: 14,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Number".toUpperCase(),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 11,
                              fontWeight: FontWeight.bold),
                        )
                      ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("47",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold)),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  constraints: BoxConstraints.tightForFinite(),
                  padding: EdgeInsets.all(10),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      /*color: information.color ?? MyAppColors.blueSecondColor,*/
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [MyAppBoxShadow.boxShadowSecond]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Icon(
                          Icons.reviews,
                          size: 14,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Average".toUpperCase(),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 11,
                              fontWeight: FontWeight.bold),
                        )
                      ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          for (int i = 2; i < 5; i++)
                            Icon(
                              Icons.star,
                              color: MyAppColors.blueSecondColor,
                              size: 12,
                            ),
                          for (int i = 1; i <= 2; i++)
                            Icon(Icons.star,
                                color: MyAppColors.weighLightColor, size: 12)
                        ],
                      )
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
      Positioned(
        top: desiredHeight - 35,
        width: screenWidth,
        child: Column(
          children: [
            Center(
              child: Container(
                width: choiceWidthCard,
                padding: EdgeInsets.all(10),
                height: 70,
                decoration: BoxDecoration(
                    color: dominantColor.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [MyAppBoxShadow.boxShadowSecond]),
                child: Row(children: [
                  makeChoiceItem(1, "recents"),
                  makeChoiceItem(2, "all reviews"),
                ]),
              ),
            ),
            Container(
              height: screenHeight / 2 - 35,
              padding: EdgeInsets.only(bottom: 2),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Container(
                        margin: EdgeInsets.only(top: 10),
                        width: screenWidth * 0.9,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: MyAppColors.whiteCardColor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [MyAppBoxShadow.boxShadowSecond]),
                        child: Column(children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  for (int i = 0; i <= 3; i++)
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 25,
                                    ),
                                  Icon(
                                    Icons.star,
                                    color: MyAppColors.weighLightColor,
                                    size: 25,
                                  )
                                ]),
                                Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(" 4 /",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 21)),
                                      Text(" 5",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15)),
                                    ])
                              ]),
                          SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(text.toUpperCase(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 9,
                                    fontWeight: FontWeight.bold,
                                    height: 1.7),
                                textAlign: TextAlign.justify),
                          ),
                          SizedBox(height: 15),
                          Row(children: [
                            Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/players/neymar.jpg"),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(22),
                                  border: Border.all(
                                      color: Color.fromRGBO(
                                          0, 0, 0, 0.796078431372549),
                                      width: 1),
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Neymar Jr".toUpperCase(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("@Paris Saint Jerman".toUpperCase(),
                                      style: TextStyle(
                                          color: Colors.black26,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 9))
                                ])
                          ])
                        ]))
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Container(
                        margin: EdgeInsets.only(top: 10),
                        width: screenWidth * 0.9,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: MyAppColors.whiteCardColor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [MyAppBoxShadow.boxShadowSecond]),
                        child: Column(children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  for (int i = 0; i <= 3; i++)
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 25,
                                    ),
                                  Icon(
                                    Icons.star,
                                    color: MyAppColors.weighLightColor,
                                    size: 25,
                                  )
                                ]),
                                Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(" 4 /",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 21)),
                                      Text(" 5",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15)),
                                    ])
                              ]),
                          SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(text.toUpperCase(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 9,
                                    fontWeight: FontWeight.bold,
                                    height: 1.7),
                                textAlign: TextAlign.justify),
                          ),
                          SizedBox(height: 15),
                          Row(children: [
                            Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/players/neymar.jpg"),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(22),
                                  border: Border.all(
                                      color: Color.fromRGBO(
                                          0, 0, 0, 0.796078431372549),
                                      width: 1),
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Neymar Jr".toUpperCase(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("@Paris Saint Jerman".toUpperCase(),
                                      style: TextStyle(
                                          color: Colors.black26,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 9))
                                ])
                          ])
                        ]))
                  ]),
                ]),
              ),
            )
          ],
        ),
      ),
    ]);
  }

  Widget makeRequestByTeam() {
    double cardWidth;
    double space;

    if (screenWidth > 700) {
      cardWidth = screenWidth * 0.20;
      space = screenWidth * 0.012;
    } else {
      if (screenWidth > 550) {
        cardWidth = screenWidth * 0.3;
        space = screenWidth * 0.015;
      } else {
        cardWidth = screenWidth * 0.45;
        space = screenWidth * 0.025;
      }
    }

    Widget makeRequestItem(String playerName, String submitionDate , String imagePath ) {
      return Container(
        width: cardWidth,
        height : 160,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [MyAppBoxShadow.boxShadowSecond]
        ),
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(1, 1, 1, 0.5450980392156862),
                  dominantColor
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  imagePath),
                              fit: BoxFit.cover,
                            ),
                            border: Border.all(
                                color: Colors.white.withOpacity(0.5), width: 1),
                            borderRadius: BorderRadius.circular(25))),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(playerName.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    )),
                Divider(
                    thickness: 1,
                    indent: cardWidth * 0.2,
                    endIndent: cardWidth * 0.2,
                    color: Colors.white
                ),
                Text(("Submitted at " + submitionDate).toUpperCase()  , style: TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                )),
                SizedBox(
                  height: 10,
                ),
                IntrinsicWidth(
                  child: Container(
                    padding : EdgeInsets.all(8.0),
                    decoration : BoxDecoration(
                      color : Colors.red,
                      borderRadius: BorderRadius.circular(10)
                    ) ,
                    child : Row(children : [
                      Icon(Icons.close , size: 11, color : Colors.white) ,
                      Text("remove".toUpperCase() , style : TextStyle(color : Colors.white , fontSize: 10, fontWeight: FontWeight.bold ))
                    ])
                  ),
                )
              ],
            ),
          )
        ]),
      );
    }

    return Stack(children: [
      Positioned(
          width: screenWidth,
          top: screenHeight * 0.2,
          height: screenHeight * 0.8,
          child: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(screenHeight * 0.05),
                      topRight: Radius.circular(screenHeight * 0.05)),
                ),
                child: Column(children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Your Request".toUpperCase(),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 19)),
                      ]),
                  Center(
                    child: Container(
                        margin: EdgeInsets.only(top: 5),
                        width: screenWidth * 0.6,
                        child: Row(children: [
                          Image.asset("assets/images/icons/icon_soccer_ball.png",
                              width: 20, height: 20),
                          Expanded(
                              child: Container(
                                  width: double.infinity,
                                  color: Color.fromRGBO(
                                      197, 197, 197, 0.21568627450980393),
                                  height: 2)),
                          Image.asset("assets/images/icons/icon_soccer_ball.png",
                              width: 20, height: 20),
                        ])),
                  ),
                  SizedBox(height: 10),
                  Wrap(
                    spacing: space,
                    runSpacing: space,
                    children: [
                      makeRequestItem("Neymar Jr" , "2023-01-11" , "assets/images/players/neymar.jpg"),
                      makeRequestItem("Benzema" , "2023-11-11" , "assets/images/players/benzema.jpg"),
                      makeRequestItem("Ronaldo" , "2023-02-11" , "assets/images/players/ronaldo.jpg"),
                      makeRequestItem("Ziyech" , "2023-03-11" , "assets/images/players/ziyech.jpg"),
                      makeRequestItem("Avatar" , "2023-03-11" , "assets/images/players/avatar.jpg"),   makeRequestItem("Neymar Jr" , "2023-01-11" , "assets/images/players/neymar.jpg"),
                      makeRequestItem("Benzema" , "2023-11-11" , "assets/images/players/benzema.jpg"),
                      makeRequestItem("Ronaldo" , "2023-02-11" , "assets/images/players/ronaldo.jpg"),
                      makeRequestItem("Ziyech" , "2023-03-11" , "assets/images/players/ziyech.jpg"),
                      makeRequestItem("Avatar" , "2023-03-11" , "assets/images/players/avatar.jpg"),
                    ],
                  )
                ])),
          ))
    ]);
  }

  Widget makeRequestByPlayer() {
    return Stack(children: [
      Positioned(
          width: screenWidth,
          top: screenHeight * 0.2,
          height: screenHeight * 0.8,
          child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: Text("hello world")))
    ]);
  }

}
