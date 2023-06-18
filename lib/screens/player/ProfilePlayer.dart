import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_application/utils/FunctionsUtils.dart';
import 'package:my_flutter_application/utils/MyAppBoxShadow.dart';
import 'package:my_flutter_application/utils/MyAppColors.dart';
import 'package:my_flutter_application/utils/MyAppLinearGradient.dart';

class ProfilePlayer extends StatefulWidget {
  const ProfilePlayer({Key? key}) : super(key: key);

  @override
  State<ProfilePlayer> createState() => _ProfilePlayerState();
}

class _ProfilePlayerState extends State<ProfilePlayer> {
  int currentIndex = 0;
  late var screenWidth;
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
    final screenHeight = MediaQuery.of(context).size.height;
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
                    Row(children: [
                      SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                          padding : EdgeInsets.symmetric(horizontal: 10  , vertical : 10 ),
                          decoration : BoxDecoration(
                            color : Colors.white ,
                            borderRadius: BorderRadius.circular(25)
                          ),
                          child:Row(children: [
                            Icon(Icons.chevron_left , color: dominantColor,size: 19,),
                            Text("BACK".toUpperCase() , style : TextStyle(color:dominantColor , fontWeight : FontWeight.bold ,fontSize: 11 ))
                          ]),
                          ),
                        ),
                      )
                    ])
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
                            : screenWidth * (currentIndex * 0.4) +
                                screenWidth * 0.10),
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
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24)),
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Container(
                          color: Colors.blue,
                          height: 800,
                          child: Center(
                            child: Text('Slide 3',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
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
}
