import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../../StudioProjects/Deliver_Ease/lib/utils/MyAppBoxShadow.dart';
import 'package:my_flutter_application/utils/MyAppColors.dart';
import 'package:my_flutter_application/utils/MyAppLinearGradient.dart';

class HorizontalItem {
  final String imagePath;
  final String name;
  HorizontalItem(this.imagePath, this.name);
}

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);
  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  int currentScreenState = 1;
  var width;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void switchScreen() {
    setState(() {
      currentScreenState = (currentScreenState == 0) ? 1 : 0;
      if (currentScreenState == 0) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  List<HorizontalItem> itemList = [
    HorizontalItem("assets/images/icons/icon_flash.png", 'Matches day'),
    HorizontalItem("assets/images/icons/icon_started.png", 'Offers'),
    HorizontalItem("assets/images/icons/icon_request.png", 'Requests'),
  ];

  List<HorizontalItem> teams = [
    HorizontalItem("assets/images/equipes/barca.png", 'Barcelonna'),
    HorizontalItem("assets/images/equipes/bayern.png", 'Bayern'),
    HorizontalItem("assets/images/equipes/france.png", 'France'),
    HorizontalItem("assets/images/equipes/lyon.png", 'Lyon'),
    HorizontalItem("assets/images/equipes/marseille.png", 'Marseille'),
  ];

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MyAppColors.backgroundColor,
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color : Color.fromRGBO(
                    1, 1, 1, 0.07450980392156863) , width: 1),
                borderRadius: BorderRadius.circular(5)
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: Column(
                  children: [
                    makeAppBar(),
                    Expanded(
                      child: Container(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: makeInput(),
                              ),
                              SizedBox(height: 10),
                              SizedBox(
                                width: double.infinity,
                                height: 70,
                                child: makeHorizontalList(),
                              ),
                              SizedBox(height: 10),
                              AnimatedSwitcher(
                                duration: Duration(
                                    milliseconds:
                                        500), // Set the transition duration
                                child: currentScreenState == 0
                                    ? renderTeams() // First child widget
                                    : currentScreenState == 1
                                        ? renderOffers()
                                        : renderRequests(), // Second child widget
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget makeAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image(
              image: AssetImage("assets/images/icons/icon_flash.png"),
              width: 25,
              height: 25,
            ),
            SizedBox(
              width: 2,
            ),
            Text(
              "Team",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 28,
                  fontFamily: "Cairo",
                  color: Color.fromRGBO(1, 1, 1, 0.7980392156862745)),
            ),
            Text(
              "Up",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 28,
                  fontFamily: "Cairo",
                  color: MyAppColors.blueSecondColor),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [MyAppBoxShadow.boxShadowSecond],
                  color: MyAppColors.backgroundColor),
              child: Center(
                child: Icon(Icons.search),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [MyAppBoxShadow.boxShadowSecond],
                  color: MyAppColors.backgroundColor),
              child: Center(
                child: Icon(Icons.menu),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget makeInput() {
    return Row(
      children: [
        Expanded(
          child: CupertinoTextField(
            style: TextStyle(
                color: Colors.black, fontFamily: "Nunito", fontSize: 13),
            placeholder: 'Search here',
            placeholderStyle: TextStyle(
                color: Color.fromRGBO(103, 103, 103, 0.7333333333333333),
                fontSize: 13),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [MyAppBoxShadow.boxShadowSecond],
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [MyAppBoxShadow.boxShadowSecond],
              color: MyAppColors.blueSecondColor),
          child: Center(
            child: Icon(
              Icons.sort,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget makeHorizontalList() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: itemList.length,
      itemBuilder: (BuildContext context, int index) {
        HorizontalItem item = itemList[index];
        return GestureDetector(
          onTap: () {
            setState(() {
              currentScreenState = index;
            });
          },
          child: Container(
              width: 150,
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: currentScreenState == index
                      ? MyAppColors.blueSecondColor
                      : Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: index == currentScreenState
                      ? [MyAppBoxShadow.boxShadow]
                      : [MyAppBoxShadow.boxShadowSecond]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage(item.imagePath),
                    width: 20,
                    height: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    item.name.toUpperCase(),
                    style: TextStyle(
                        color: index == currentScreenState
                            ? MyAppColors.backgroundColor
                            : Colors.black,
                        fontFamily: "Cairo",
                        fontWeight: FontWeight.bold),
                  )
                ],
              )),
        );
      },
    );
  }

  Widget renderTeams() {

    Widget makeCardGame() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 170,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  gradient: MyAppLinearGradient.lieanr_gradient_second,
                  boxShadow: [MyAppBoxShadow.boxShadowSecond],
                  borderRadius: BorderRadius.circular(15)),
              child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                //teams image
                Row(
                  children: <Widget>[
                    Image(
                      image: AssetImage("assets/images/equipes/barca.png"),
                      width: 40,
                      height: 40,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Image(
                      image: AssetImage("assets/images/equipes/bayern.png"),
                      width: 40,
                      height: 40,
                    )
                  ],
                ),
                //Divider
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 1,
                    width: (double.infinity * 0.10),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(197, 197, 197, 0.4235294117647059)),
                  ),
                ),
                //teams name
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(),
                            width: 10,
                            height: 10,
                            child: Image(
                              image: AssetImage(
                                  "assets/images/icons/icon_flash.png"),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Barcelona".toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 11,
                                letterSpacing: 1),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(),
                            width: 10,
                            height: 10,
                            child: Image(
                              image: AssetImage(
                                  "assets/images/icons/icon_flash.png"),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Bayern".toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 11,
                                letterSpacing: 1),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //Divider
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 1,
                    width: (double.infinity * 0.10),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(197, 197, 197, 0.4235294117647059)),
                  ),
                ),
                // Local and time
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage("assets/images/icons/icon_date.png"),
                        width: 10,
                        height: 10,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Fr 13 Jan 2023 , 19:30",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontFamily: "Nunito"),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage("assets/images/icons/icon_map.png"),
                        width: 10,
                        height: 10,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Al Adarissa ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontFamily: "Nunito"),
                      ),
                    ],
                  ),
                )
              ]),
            )
          ],
        ),
      );
    }

    Widget makeSuggestionPart() {

      Widget makeItemSuggested(HorizontalItem team) {
        return Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                //color: MyAppColors.blueSecondColor,
                //gradient: MyAppLinearGradient.lieanr_gradient_second,
                  color: MyAppColors.whiteCardColor,
                  boxShadow: [MyAppBoxShadow.boxShadowSecond],
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image(
                        image: AssetImage(team.imagePath),
                        width: 40,
                        height: 40,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        team.name.toUpperCase(),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 11),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [MyAppBoxShadow.boxShadowSecond],
                    ),
                    child: Text(
                      "Follow",
                      style: TextStyle(
                          color: MyAppColors.blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          fontFamily: "Cairo"),
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      }

      return Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Suggested".toUpperCase(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    fontFamily: "Cairo",
                    color: MyAppColors.blueSecondColor),
              ),
              Text(
                "Dont show it a gain ".toUpperCase(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    fontFamily: "Cairo",
                    color: Color.fromRGBO(87, 87, 87, 0.9176470588235294)),
              )
            ],
          ),
          Column(children: teams.map((team) => makeItemSuggested(team)).toList())
        ]),
      );
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int i = 0; i < teams.length; i += 2)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      makeCardGame(),
                      if (i + 1 < teams.length) makeCardGame(),
                    ],
                  ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 20,
                  height: 20,
                  child: Image(
                    image: AssetImage("assets/images/ball.png"),
                  ),
                ),
                Expanded(
                    child: Container(
                  height: 1,
                  color: Color.fromRGBO(93, 93, 93, 0.13137254901960784),
                )),
                Container(
                  width: 20,
                  height: 20,
                  child: Image(
                    image: AssetImage("assets/images/ball.png"),
                  ),
                ),
              ],
            ),
          ),
          makeSuggestionPart()
        ],
      ),
    );
  }

  Widget renderOffers() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [MyAppBoxShadow.boxShadowSecond]),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Row(children: [
                  Container(
                      width: 40,
                      height: 40,
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          color: MyAppColors.backgroundColor,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [MyAppBoxShadow.boxShadowSecond],
                          border: Border.all(
                              color:
                                  Color.fromRGBO(1, 1, 1, 0.0596078431372549),
                              width: 1)),
                      child: Image(
                        image: AssetImage("assets/images/equipes/barca.png"),
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Barcelona".toUpperCase(),
                          style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                              letterSpacing: 0.5),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "MT , AT ".toUpperCase(),
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                              letterSpacing: 0.5),
                        ),
                      ])
                ]),
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(1, 1, 1, 0.8431372549019608),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [MyAppBoxShadow.boxShadowThird]),
                    child: Text(
                      "Submit".toUpperCase(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ]),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [MyAppBoxShadow.boxShadowSecond]),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Row(children: [
                  Container(
                      width: 40,
                      height: 40,
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          color: MyAppColors.backgroundColor,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [MyAppBoxShadow.boxShadowSecond],
                          border: Border.all(
                              color:
                                  Color.fromRGBO(1, 1, 1, 0.0596078431372549),
                              width: 1)),
                      child: Image(
                        image: AssetImage("assets/images/equipes/barca.png"),
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Barcelona".toUpperCase(),
                          style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                              letterSpacing: 0.5),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "MT , AT ".toUpperCase(),
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                              letterSpacing: 0.5),
                        ),
                      ])
                ]),
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(1, 1, 1, 0.8431372549019608),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [MyAppBoxShadow.boxShadowThird]),
                    child: Text(
                      "Submit".toUpperCase(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ]),
            ],
          ),
        ),
      ],
    );
  }

  Widget renderRequests() {
    double cardWidth;

    if (width >= 800) {
      // For tablet or larger screens
      cardWidth = width * 0.25;
    } else {
      // For phones or smaller screens
      cardWidth = width * 0.45;
    }

    Widget makePlayerCard(String playerName , String playerPosition )
    {
      return Container(
        width: cardWidth,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [MyAppBoxShadow.boxShadowSecond]),
        child: Column(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [MyAppBoxShadow.boxShadowSecond],
                  border: Border.all(
                      color: MyAppColors.blueSecondColor, width: 1),
                  image: DecorationImage(
                      image: AssetImage("assets/images/players/avatar.png"),
                      fit: BoxFit.contain),
                  color: MyAppColors.backgroundColor),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              playerName.toUpperCase(),
              style: TextStyle(
                  color: Colors.black45,
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                  letterSpacing: 0.5),
            ),
            Divider(
              thickness: 1,
              indent: cardWidth * 0.2,
              endIndent: cardWidth * 0.2,
              color: Color.fromRGBO(1, 1, 1, 0.7019607843137255),
            ),
            Text(
              playerPosition.toUpperCase(),
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                  letterSpacing: 0.5),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(1, 1, 1, 0.8431372549019608),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [MyAppBoxShadow.boxShadowThird]),
                child: Center(
                    child: Text(
                      "Submit".toUpperCase(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    )),
              ),
            ),
          ],
        ),
      );
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      child: Wrap(spacing: 5, runSpacing: 5, children: [
        makePlayerCard("Mehdi seddiki ", "At"),
        makePlayerCard("Ayoub seddiki ", "MD"),
        makePlayerCard("Amine seddiki ", "GK"),
      ]),
    );
  }
}
