import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_application/utils/FunctionsUtils.dart';
import 'package:my_flutter_application/utils/MyAppBoxShadow.dart';
import 'package:my_flutter_application/utils/MyAppColors.dart';
import 'package:my_flutter_application/utils/MyAppLinearGradient.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';

class ProfilePlayer extends StatefulWidget {
  const ProfilePlayer({Key? key}) : super(key: key);

  @override
  State<ProfilePlayer> createState() => _ProfilePlayerState();
}

class _ProfilePlayerState extends State<ProfilePlayer> {
  bool popUpIsShowing = false;
  int currentIndex = 0;
  int stateData = 2;
  var screenWidth, screenHeight;
  Color dominantColor = MyAppColors.blueSecondColor;
  PageController _pageController = PageController(initialPage: 0);

  Future<void> setDominantColor() async {
    Color? extractedColor = await FunctionUtils.extractDominantColor(
        "assets/images/players/neymar.jpg");
    setState(() {
      dominantColor = extractedColor ?? MyAppColors.blueSecondColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    final desiredHeight = screenHeight * 0.2;
    String fullName = "Neymar Jr";

    List<String> names = fullName.split(" ");

    return Scaffold(
      body: Stack(
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
                          image: AssetImage("assets/images/players/neymar.jpg"),
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
                    SafeArea(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(25)),
                                child: Row(children: [
                                  Row(children: [
                                    Icon(
                                      Icons.chevron_left,
                                      color: dominantColor,
                                      size: 19,
                                    ),
                                    Text("BACK".toUpperCase(),
                                        style: TextStyle(
                                            color: dominantColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11))
                                  ]),
                                ]),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(right: 10),
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        popUpIsShowing = !popUpIsShowing;
                                      });
                                    },
                                    child: Icon(
                                      Icons.more_vert,
                                      color: MyAppColors.blueSecondColor,
                                    )))
                          ]),
                    )
                  ]),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: desiredHeight - 20),
                    decoration: BoxDecoration(
                        color: MyAppColors.backgroundColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20))),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            width: screenWidth,
            top: desiredHeight - 75,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/players/neymar.jpg"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: dominantColor, width: 3),
                          boxShadow: [MyAppBoxShadow.boxShadowSecond]),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: names.map((name) {
                    int index = names.indexOf(name);

                    TextStyle textStyle = TextStyle(
                      color: index == 0 ? Colors.black : dominantColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      // Add other text styles as per your requirements
                    );

                    return Text(
                      name.toUpperCase() + " ",
                      style: textStyle,
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                          color: dominantColor.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(4)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Attacker".toUpperCase(),
                      style: TextStyle(
                          color:
                              Color.fromRGBO(197, 197, 197, 0.9235294117647058),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                          color: dominantColor.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(4)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                stateData == 0
                    ? makeGeneralInformation()
                    : stateData == 1
                        ? SingleChildScrollView(scrollDirection: Axis.vertical, child : Container(height : MediaQuery.of(context).size.height * 0.58 ,  child : makeReviewsInformation()))
                        : SingleChildScrollView(scrollDirection: Axis.vertical, child : Container(height : MediaQuery.of(context).size.height * 0.58 ,  child : makeRequestsInformation())),
              ],
            ),
          ),
          popUpIsShowing ? makePopUp() : Container(),
        ],
      ),
    );
  }

  Widget makeGeneralInfoPlayerCard(String title, String value) {
    return Container(
      width: screenWidth * 0.3,
      height: screenWidth * 0.3,
      child: Stack(
        children: [
          Container(
            width: screenWidth * 0.3,
            decoration: BoxDecoration(
                image: DecorationImage(
                  opacity: 0.6,
                  image: AssetImage("assets/images/background.jpg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [MyAppBoxShadow.boxShadowSecond]),
          ),
          Container(
            width: screenWidth * 0.3,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(1, 1, 1, 0.5450980392156862),
                    Color.fromRGBO(1, 1, 1, 0.5450980392156862),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [MyAppBoxShadow.boxShadowSecond]),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      Text(title.toUpperCase(),
                          style: TextStyle(
                              color: MyAppColors.backgroundColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ]),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Text(value.toUpperCase(),
                          style: TextStyle(
                              color: MyAppColors.backgroundColor,
                              fontSize: 23,
                              fontWeight: FontWeight.bold)),
                    ])
                  ]),
            ),
          )
        ],
      ),
    );
  }

  Widget makeTabTitle(String title, int index_tab) {
    TextStyle title_style = TextStyle(
      color: currentIndex == index_tab ? Colors.white : Colors.black87,
      fontWeight: FontWeight.bold,
      fontSize: 11,
    );
    return AnimatedContainer(
      width: screenWidth * 0.30,
      duration: Duration(milliseconds: 5000),
      child: GestureDetector(
        onTap: () {
          setState(() {
            currentIndex = index_tab;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
          decoration: BoxDecoration(
              image: currentIndex == index_tab
                  ? DecorationImage(
                      image: AssetImage("assets/images/background.jpg"),
                      fit: BoxFit.cover)
                  : null,
              boxShadow: [MyAppBoxShadow.boxShadowFive],
              color:
                  currentIndex != index_tab + 10 ? Colors.white : Colors.white,
              borderRadius: BorderRadius.circular(25)),
          child: Text(
            title.toUpperCase(),
            textAlign: TextAlign.center,
            style: title_style,
          ),
        ),
      ),
    );
  }

  Widget makeInformationItem(String imagePath, String title, String vals) {
    Future<Color?> extractedColor =
        FunctionUtils.extractDominantColor(imagePath);
    Color defaultColor = Colors.grey;

    List<String> values = vals.split(" ");
    List<Container> valueContainers = values.map((value) {
      return Container(
        width: 30,
        height: 30,
        margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
            color: MyAppColors.backgroundColor,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              MyAppBoxShadow.boxShadowThird,
              MyAppBoxShadow.boxShadowSecond
            ]),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            value,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: "Cairo"),
          ),
        ]),
      );
    }).toList();

    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Stack(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Container(
                      width: screenWidth * 0.4,
                      height: screenWidth * 0.4,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/background.jpg"),
                            fit: BoxFit.cover),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        gradient: MyAppLinearGradient.lieanr_gradient_second,
                        boxShadow: [MyAppBoxShadow.boxShadowFour],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Container(
                      width: screenWidth * 0.4,
                      height: screenWidth * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [
                            Colors.black87.withOpacity(0.3),
                            defaultColor.withOpacity(
                                0.5), // Start with the default color
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: FutureBuilder<Color?>(
                        future: extractedColor,
                        builder: (BuildContext context,
                            AsyncSnapshot<Color?> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator(); // Show a loading indicator while waiting for the color extraction
                          } else if (snapshot.hasError) {
                            return Text(
                                'Error: ${snapshot.error}'); // Show an error message if the extraction fails
                          } else {
                            Color? extractedColor = snapshot.data;
                            return Container(
                              width: screenWidth * 0.4,
                              height: screenWidth * 0.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black87.withOpacity(0.3),
                                    extractedColor?.withOpacity(0.5) ??
                                        defaultColor.withOpacity(
                                            0.5), // Use the extracted color if available, otherwise fallback to the default color
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                              // Your content goes here
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ]),
                Container(
                  width: screenWidth * 0.4,
                  height: screenWidth * 0.5,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FutureBuilder<Color?>(
                            future: extractedColor,
                            builder: (BuildContext context,
                                AsyncSnapshot<Color?> snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator(); // Show a loading indicator while waiting for the color extraction
                              } else if (snapshot.hasError) {
                                return Text(
                                    'Error: ${snapshot.error}'); // Show an error message if the extraction fails
                              } else {
                                Color? extractedColor = snapshot.data;
                                return Container(
                                  width: 50,
                                  height: 50,
                                  padding: EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(35),
                                      color: MyAppColors.backgroundColor,
                                      boxShadow: [
                                        MyAppBoxShadow.boxShadowFive
                                      ]),
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: MyAppColors.backgroundColor,
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.black87.withOpacity(0.6),
                                          extractedColor?.withOpacity(1) ??
                                              MyAppColors.backgroundColor
                                                  .withOpacity(1),
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      ),
                                    ),
                                    child: Image(
                                      image: AssetImage(
                                        imagePath,
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        title.toUpperCase(),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Cairo"),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Divider(
                        indent: 10,
                        endIndent: 10,
                        color: Colors.white,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: valueContainers,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget displayInformation() {
    return Column(
      children: [
        Row(
          children: [
            Image(
              image: AssetImage("assets/images/icons/icon_flash.png"),
              width: 20,
              height: 20,
            ),
            SizedBox(
              width: 3,
            ),
            Text(
              "General Information".toUpperCase(),
              style: TextStyle(
                  color: MyAppColors.blackColor, fontWeight: FontWeight.bold),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                height: 1,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: MyAppColors.blueSecondColor.withOpacity(0.4)),
              ),
            ))
          ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          makeInformationItem(
              "assets/images/icons/icon_position.png", "position", "MD AT"),
          makeInformationItem(
              "assets/images/icons/icon_number.png", "Numbers", "3 4"),
        ])
      ],
    );
  }

  Widget makePopUp() {
    const items = ["first page", "reviews", "request"];
    double popUpWidth = 200;
    double popUpHeight = (items.length) * 70;
    print("the pop up heigh " + popUpHeight.toString());
    return AnimatedContainer(
      duration: Duration(milliseconds: 1000),
      width: screenWidth,
      height: screenHeight,
      decoration: BoxDecoration(
        color: Color.fromRGBO(8, 0, 171, 0.3568627450980392),
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
                    color: MyAppColors.blueSecondColor,
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

  Widget makeGeneralInformation() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              makeGeneralInfoPlayerCard("Age", "29"),
              makeGeneralInfoPlayerCard("Games", "22"),
              makeGeneralInfoPlayerCard("Goals", "18"),
            ],
          ),
        ),
        Divider(
          color: Color.fromRGBO(1, 1, 1, 0.1),
          indent: screenWidth * 0.2,
          endIndent: screenWidth * 0.2,
          thickness: 1,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  makeTabTitle("Informations", 0),
                  makeTabTitle("Statistiques", 1),
                  makeTabTitle("Media", 2)
                ]),
          ),
          SizedBox(
            height: 5,
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            width: screenWidth * 0.10,
            height: 2,
            margin: EdgeInsets.only(
                left: currentIndex == 2
                    ? screenWidth * (currentIndex * 0.4) + 0
                    : screenWidth * (currentIndex * 0.4) + screenWidth * 0.10),
            color: Colors.black.withOpacity(0.7),
          ),
        ]),
        Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.only(top: 8.0),
          child: CarouselSlider(
            options: CarouselOptions(
              enableInfiniteScroll: true,
              viewportFraction: 1.0,
              onPageChanged: (index, _) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
            items: [
              SingleChildScrollView(child: displayInformation()),
              SingleChildScrollView(
                child: Container(
                  color: Colors.green,
                  height: 800,
                  child: Center(
                    child: Text('Slide 2',
                        style: TextStyle(color: Colors.white, fontSize: 24)),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  color: Colors.blue,
                  height: 800,
                  child: Center(
                    child: Text('Slide 3',
                        style: TextStyle(color: Colors.white, fontSize: 24)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget makeReviewsInformation() {

    String text = loremIpsum(
      words: 30,
    );
    List<Color> colors = [
      Color(0xFFFF9B9B),
      Color(0xFFFFEADD),
      Color(0xFFFF6666),
      Color(0xFFFCAEAE),
      Color(0xFF3AA6B9),
      Color(0xFF001C30),
    ];
    Random random = Random();
    int randomIndex = random.nextInt(colors.length);

    return Stack(
      children : [
        SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: EdgeInsets.only(top : 20),
          padding: EdgeInsets.only(bottom: 60),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children : [
                Container(
                  width: 130,
                  height : 100,
                  padding: EdgeInsets.symmetric(horizontal: 10 , vertical : 10),
                  decoration : BoxDecoration(
                    color: Color.fromRGBO(241, 246, 249, 1.0),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow : [MyAppBoxShadow.boxShadowSecond],
                    image: DecorationImage(
                      image:AssetImage("assets/images/background.jpg"),
                      fit: BoxFit.cover
                    )
                  ),
                  child : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    textBaseline: TextBaseline.alphabetic,
                    children : [
                      Text("Numbers".toUpperCase() , style : TextStyle(color : Colors.white , fontFamily :"Cairo" , fontWeight : FontWeight.bold  )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children : [
                          Text("25".toUpperCase() , style : TextStyle(color : Colors.white ,fontWeight : FontWeight.bold , fontSize: 21  )),
                        ]
                      )
                    ]
                  )
                ),
                SizedBox(width: 10,),
                Container(
                  width: 130,
                  height : 100,
                  padding: EdgeInsets.symmetric(horizontal: 10 , vertical : 10),
                  decoration : BoxDecoration(
                    color: Color.fromRGBO(241, 246, 249, 1.0),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow : [MyAppBoxShadow.boxShadowSecond],
                    image: DecorationImage(
                      image:AssetImage("assets/images/background.jpg"),
                      fit: BoxFit.cover
                    )
                  ),
                  child : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    textBaseline: TextBaseline.alphabetic,
                    children : [
                      Text("Average".toUpperCase() , style : TextStyle(color : Colors.white , fontFamily :"Cairo" , fontWeight : FontWeight.bold  )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children : [
                          for(int i= 1 ; i<5 ; i++)
                            Icon(Icons.star , color: Colors.blue, size: 13,),
                          Icon(Icons.star , color: Colors.white, size: 13,)
                        ]
                      )
                    ]
                  )
                ),
              ]
            ),
            Stack(children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      width: screenWidth * 0.85,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color(0xBAFCFCFC),
                          boxShadow: [MyAppBoxShadow.boxShadow],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color.fromRGBO(
                              255, 255, 255, 1.0) , width: 2)
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(width: 1, color: Colors.red),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/players/ronaldo.jpg"),
                                        fit: BoxFit.cover)),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Ronaldo Nazario",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Cairo"),
                                    ),
                                    Text(
                                      "Fc Shakhtar".toUpperCase(),
                                      style: TextStyle(
                                        color: Colors.black45,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                      ),
                                    )
                                  ])
                            ]),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                for (int i = 1; i <= 4; i++)
                                  Icon(
                                    Icons.star,
                                    color: MyAppColors.blueSecondColor,
                                    size: 13,
                                  ),
                                for (int i = 5; i <= 5; i++)
                                  Icon(
                                    Icons.star,
                                    color: MyAppColors.weighLightColor,
                                    size: 13,
                                  ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "01/11/2020 at 19h20",
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                  fontFamily: "Cairo"),
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  for (int i = 1; i < 10; i++)
                                    Icon(
                                      Icons.horizontal_rule,
                                      color:
                                          Color.fromRGBO(1, 1, 1, 0.109803921568628),
                                    )
                                ]),
                            Text(
                              text,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Cairo",
                                height: 0
                              ),
                              textAlign: TextAlign.justify,
                            )
                          ]),
                    )
                  ],
                ),
              ),
              Positioned(
                right: -10,
                top: 4,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: MyAppColors.backgroundColor),
                ),
              )
            ]),
            Stack(children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      width: screenWidth * 0.85,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color(0xBAFCFCFC),
                          boxShadow: [MyAppBoxShadow.boxShadow],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color.fromRGBO(
                              255, 255, 255, 1.0) , width: 2)
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(width: 1, color: Colors.red),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/players/ronaldo.jpg"),
                                        fit: BoxFit.cover)),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Ronaldo Nazario",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Cairo"),
                                    ),
                                    Text(
                                      "Fc Shakhtar".toUpperCase(),
                                      style: TextStyle(
                                        color: Colors.black45,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                      ),
                                    )
                                  ])
                            ]),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                for (int i = 1; i <= 4; i++)
                                  Icon(
                                    Icons.star,
                                    color: MyAppColors.blueSecondColor,
                                    size: 13,
                                  ),
                                for (int i = 5; i <= 5; i++)
                                  Icon(
                                    Icons.star,
                                    color: MyAppColors.weighLightColor,
                                    size: 13,
                                  ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "01/11/2020 at 19h20",
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                  fontFamily: "Cairo"),
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  for (int i = 1; i < 10; i++)
                                    Icon(
                                      Icons.horizontal_rule,
                                      color:
                                          Color.fromRGBO(1, 1, 1, 0.109803921568628),
                                    )
                                ]),
                            Text(
                              text,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Cairo",
                                height: 0
                              ),
                              textAlign: TextAlign.justify,
                            )
                          ]),
                    )
                  ],
                ),
              ),
              Positioned(
                right: -10,
                top: 4,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: MyAppColors.backgroundColor),
                ),
              )
            ]),
            Stack(children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      width: screenWidth * 0.85,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color(0xBAFCFCFC),
                          boxShadow: [MyAppBoxShadow.boxShadow],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color.fromRGBO(
                              255, 255, 255, 1.0) , width: 2)
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(width: 1, color: Colors.red),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/players/ronaldo.jpg"),
                                        fit: BoxFit.cover)),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Ronaldo Nazario",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Cairo"),
                                    ),
                                    Text(
                                      "Fc Shakhtar".toUpperCase(),
                                      style: TextStyle(
                                        color: Colors.black45,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                      ),
                                    )
                                  ])
                            ]),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                for (int i = 1; i <= 4; i++)
                                  Icon(
                                    Icons.star,
                                    color: MyAppColors.blueSecondColor,
                                    size: 13,
                                  ),
                                for (int i = 5; i <= 5; i++)
                                  Icon(
                                    Icons.star,
                                    color: MyAppColors.weighLightColor,
                                    size: 13,
                                  ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "01/11/2020 at 19h20",
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                  fontFamily: "Cairo"),
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  for (int i = 1; i < 10; i++)
                                    Icon(
                                      Icons.horizontal_rule,
                                      color:
                                          Color.fromRGBO(1, 1, 1, 0.109803921568628),
                                    )
                                ]),
                            Text(
                              text,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Cairo",
                                height: 0
                              ),
                              textAlign: TextAlign.justify,
                            )
                          ]),
                    )
                  ],
                ),
              ),
              Positioned(
                right: -10,
                top: 4,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: MyAppColors.backgroundColor),
                ),
              )
            ]),
            Stack(children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      width: screenWidth * 0.85,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color(0xBAFCFCFC),
                          boxShadow: [MyAppBoxShadow.boxShadow],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color.fromRGBO(
                              255, 255, 255, 1.0) , width: 2)
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(width: 1, color: Colors.red),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/players/ronaldo.jpg"),
                                        fit: BoxFit.cover)),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Ronaldo Nazario",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Cairo"),
                                    ),
                                    Text(
                                      "Fc Shakhtar".toUpperCase(),
                                      style: TextStyle(
                                        color: Colors.black45,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                      ),
                                    )
                                  ])
                            ]),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                for (int i = 1; i <= 4; i++)
                                  Icon(
                                    Icons.star,
                                    color: MyAppColors.blueSecondColor,
                                    size: 13,
                                  ),
                                for (int i = 5; i <= 5; i++)
                                  Icon(
                                    Icons.star,
                                    color: MyAppColors.weighLightColor,
                                    size: 13,
                                  ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "01/11/2020 at 19h20",
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                  fontFamily: "Cairo"),
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  for (int i = 1; i < 10; i++)
                                    Icon(
                                      Icons.horizontal_rule,
                                      color:
                                          Color.fromRGBO(1, 1, 1, 0.109803921568628),
                                    )
                                ]),
                            Text(
                              text,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Cairo",
                                height: 0
                              ),
                              textAlign: TextAlign.justify,
                            )
                          ]),
                    )
                  ],
                ),
              ),
              Positioned(
                right: -10,
                top: 4,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: MyAppColors.backgroundColor),
                ),
              )
            ]),
          ]),
        ),
        ),
        Positioned(bottom:0,left:0,width: screenWidth,child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            children : [
                Expanded(
                  child : Container(
                    decoration: BoxDecoration(
                        boxShadow: [MyAppBoxShadow.boxShadowThird]
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Add you review there",
                      ),
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 11
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Container(
                  height: 40,
                  width: 40,
                  padding: EdgeInsets.all(5),
                  decoration : BoxDecoration(
                    color : Color.fromRGBO(30, 255, 0, 1.0),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [MyAppBoxShadow.boxShadowThird]
                  ),
                  child : Center(child: Icon(Icons.send , color: Colors.white, size: 21,))
                )
            ]
          ),
        ))
      ]
    );
  }

  Widget makeRequestsInformation() {

    double cardWidth  ;
    if(screenWidth >= 900)
      cardWidth = screenWidth*0.45 ;
    else
      cardWidth = screenWidth*0.9 ;

    String text = loremIpsum(words: 20) ;


    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        margin : EdgeInsets.only(top: 10),
        width: screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Wrap(
              runSpacing: 10,
              spacing: 10,
              children: [
                Container(
                  width: cardWidth,
                  padding: EdgeInsets.all(15),
                  decoration : BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [MyAppBoxShadow.boxShadowSecond]
                  ),
                  child:Column(
                    children : [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, textBaseline: TextBaseline.alphabetic , crossAxisAlignment: CrossAxisAlignment.baseline, children : [
                        Row(
                          children: [
                            Image.asset("assets/images/icons/icon_map.png" , width: 20, height: 20,),
                            SizedBox(width: 10,),
                            Text("positions".toUpperCase() , style: TextStyle(color : Colors.black , fontSize: 11 , fontWeight: FontWeight.bold),)
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              margin: EdgeInsets.only(right : 5),
                              decoration: BoxDecoration(
                                color : Colors.black,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [MyAppBoxShadow.boxShadowSecond],
                                border : Border.all(color : MyAppColors.backgroundColor , width: 2)
                              ),
                              child : Center(child: Text("AT" , style: TextStyle(color:Colors.white , fontSize: 11 , fontWeight: FontWeight.bold),))
                            ),
                            Container(
                              width: 30,
                              height: 30,
                              margin: EdgeInsets.only(right : 5),
                              decoration: BoxDecoration(
                                color : Colors.black,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [MyAppBoxShadow.boxShadowSecond],
                                border : Border.all(color : MyAppColors.backgroundColor , width: 2)
                              ),
                              child : Center(child: Text("AT" , style: TextStyle(color:Colors.white , fontSize: 11 , fontWeight: FontWeight.bold),))
                            ),
                          ],
                        ),
                      ]),
                      SizedBox(height: 10,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top:5.0),
                            child: Image.asset("assets/images/icons/icon_flash.png", width: 20, height: 20),
                          ),
                          SizedBox(width: 10,),
                          Flexible(
                            child: Wrap(
                              children: [
                                Text(
                                  text,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Cairo"
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Container(
                        width: cardWidth,
                        padding: EdgeInsets.symmetric(
                          vertical: 10
                        ),
                        decoration : BoxDecoration(
                          borderRadius : BorderRadius.circular(10),
                          color : Color.fromRGBO(0, 37, 255, 1.0),
                          boxShadow: [MyAppBoxShadow.boxShadowSecond]
                        ),
                        child : Row( mainAxisAlignment: MainAxisAlignment.center,
                          children : [
                            Icon(Icons.send , size: 15, color: Colors.white,),
                            SizedBox(width : 10),
                            Text("Submit".toUpperCase() , style : TextStyle(color : Colors.white , fontWeight: FontWeight.bold , fontFamily: "Cairo"))
                          ]
                        )
                      )
                    ]
                  )
                ),
                Container(
                    width: cardWidth,
                    padding: EdgeInsets.all(15),
                    decoration : BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [MyAppBoxShadow.boxShadowSecond]
                    ),
                    child:Column(
                        children : [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, textBaseline: TextBaseline.alphabetic , crossAxisAlignment: CrossAxisAlignment.baseline, children : [
                            Row(
                              children: [
                                Image.asset("assets/images/icons/icon_map.png" , width: 20, height: 20,),
                                SizedBox(width: 10,),
                                Text("positions".toUpperCase() , style: TextStyle(color : Colors.black , fontSize: 11 , fontWeight: FontWeight.bold),)
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                    width: 30,
                                    height: 30,
                                    margin: EdgeInsets.only(right : 5),
                                    decoration: BoxDecoration(
                                        color : Colors.black,
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [MyAppBoxShadow.boxShadowSecond],
                                        border : Border.all(color : MyAppColors.backgroundColor , width: 2)
                                    ),
                                    child : Center(child: Text("AT" , style: TextStyle(color:Colors.white , fontSize: 11 , fontWeight: FontWeight.bold),))
                                ),
                                Container(
                                    width: 30,
                                    height: 30,
                                    margin: EdgeInsets.only(right : 5),
                                    decoration: BoxDecoration(
                                        color : Colors.black,
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [MyAppBoxShadow.boxShadowSecond],
                                        border : Border.all(color : MyAppColors.backgroundColor , width: 2)
                                    ),
                                    child : Center(child: Text("AT" , style: TextStyle(color:Colors.white , fontSize: 11 , fontWeight: FontWeight.bold),))
                                ),
                              ],
                            ),
                          ]),
                          SizedBox(height: 10,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top:5.0),
                                child: Image.asset("assets/images/icons/icon_flash.png", width: 20, height: 20),
                              ),
                              SizedBox(width: 10,),
                              Flexible(
                                child: Wrap(
                                  children: [
                                    Text(
                                      loremIpsum(words: 25),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Cairo"
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Container(
                              width: cardWidth,
                              padding: EdgeInsets.symmetric(
                                  vertical: 10
                              ),
                              decoration : BoxDecoration(
                                  borderRadius : BorderRadius.circular(10),
                                  color : Color.fromRGBO(148, 2, 8, 1.0),
                                  boxShadow: [MyAppBoxShadow.boxShadowSecond]
                              ),
                              child : Row( mainAxisAlignment: MainAxisAlignment.center,
                                  children : [
                                    Icon(Icons.lock , size: 15, color: Colors.white,),
                                    SizedBox(width : 10),
                                    Text("LOCKED".toUpperCase() , style : TextStyle(color : Colors.white , fontWeight: FontWeight.bold , fontFamily: "Cairo"))
                                  ]
                              )
                          )
                        ]
                    )
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
