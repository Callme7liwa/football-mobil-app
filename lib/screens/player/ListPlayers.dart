import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:my_flutter_application/utils/Data.dart';
import 'package:my_flutter_application/utils/MyAppBoxShadow.dart';
import 'package:my_flutter_application/utils/MyAppColors.dart';
import 'package:my_flutter_application/utils/MyAppLinearGradient.dart';
import '../../controllers/SortingController.dart';

class Player {
  final String name;
  final String age;
  final String imagePath;
  final String position;

  Player(this.name, this.age, this.imagePath, this.position);
}

class ListPlayers extends StatefulWidget {
  const ListPlayers({Key? key}) : super(key: key);

  @override
  _ListPlayersState createState() => _ListPlayersState();
}

class _ListPlayersState extends State<ListPlayers> with SingleTickerProviderStateMixin {

  var players = Data.players;
  var width, height;
  var popUpIsShowing = false;
  String selectedCities = "";
  String testString = "hello ";
  var filteredPlayers = [];

  void searchPlayers(String query) {
    setState(() {
      filteredPlayers = Data.players.where((player) {
        // Filter based on player name or any other desired criteria
        return player.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyAppColors.backgroundColor,
      body: Stack(children: [
        SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Column(children: [
              makeAppBar(),
              Expanded(
                child: Container(
                  width: width * 0.9,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(children: [
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: makeInput(),
                      ),
                      getPlayers()
                    ]),
                  ),
                ),
              ),
            ]),
          ),
        ),
        // Pop Up
        AnimatedOpacity(
          opacity: popUpIsShowing ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: Visibility(
            // If the widget is visible, animate to 0.0 (invisible).
            // If the widget is hidden, animate to 1.0 (fully visible).
            visible: popUpIsShowing,
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: Color.fromARGB(194, 0, 0, 0),
              ),
              child: Center(
                child: Container(
                    width: width * 0.8,
                    height: height * 0.5,
                    decoration: BoxDecoration(
                      color: MyAppColors.backgroundColor,
                      image: DecorationImage(
                          image: AssetImage("assets/images/zellije_bg.jpg"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xEC1E1E1E),
                              Color.fromRGBO(1, 1, 1, 0.7450980392156863)
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          )),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Sort By".toUpperCase(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Cairo",
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                            Divider(
                              color: Colors.white,
                              thickness: 1,
                              height: 5,
                              indent: width * 0.2,
                              endIndent: width * 0.2,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            renderPopUp()
                          ]),
                    )),
              ),
            ),
          ),
        )
      ]),
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
            onChanged: (value) {
              // Perform search based on the entered value
              searchPlayers(value);
            },
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
        GestureDetector(
          onTap: () {
            setState(() {
              popUpIsShowing = !popUpIsShowing;
            });
          },
          child: Container(
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
        ),
      ],
    );
  }

  Widget getPlayers() {

    var my_players = Data.players;

    var players = filteredPlayers.isNotEmpty ? filteredPlayers : my_players;

    return Column(
      children: players.map((player) {
        return Column(
          children: [
            SizedBox(height: 15),
            Row(
              children: [
                Container(
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(player.imagePath),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      MyAppBoxShadow.boxShadowSecond,
                      MyAppBoxShadow.boxShadowSecond,
                    ],
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(1, 1, 1, 0.6078431372549019),
                          Color.fromRGBO(1, 1, 1, 0.77)
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 58,
                                height: 58,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage(player.imagePath),
                                    fit: BoxFit.cover,
                                  ),
                                  boxShadow: [MyAppBoxShadow.boxShadow],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    player.name,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    textBaseline: TextBaseline.alphabetic,
                                    children  : [
                                      Text(
                                        player.position,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        " || "+player.location,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12
                                        ),
                                      ),
                                    ]
                                  )
                                ],
                              ),
                            ],
                          ),
                          Icon(
                            Icons.chevron_right,
                            size: 22,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      }).toList(),
    );
  }

  Widget renderPopUp() {
    SortingController controller = SortingController();

    return Column(
      children: [
        MultiSelectDialogField(
          decoration: BoxDecoration(
            color: Color.fromRGBO(1, 1, 1, 0.4),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(
              color: Color.fromRGBO(1, 1, 1, 1),
              width: 1,
            ),
          ),
          buttonIcon: Icon(Icons.location_city , color: Colors.white
            ,),
          buttonText: Text(
            "City".toUpperCase(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: "Cairo",
              fontWeight: FontWeight.bold,
            ),
          ),
          listType: MultiSelectListType.LIST,
          chipDisplay: MultiSelectChipDisplay.none(),
          items: controller.cities
              .map((city) => MultiSelectItem<String>(city, city.toLowerCase()!))
              .toList(),
          title: Text("Players"),
          selectedColor: Colors.blue,
          searchable: true,
          onConfirm: (results) {
            controller.selectedCities = results;
            controller.selectedCitiesValue.value = "";
            selectedCities = "";
            controller.selectedCities.forEach((element) {
              controller.selectedCitiesValue.value =
                  controller.selectedCitiesValue.value + " " + element.toString();
              setState(() {
                selectedCities = selectedCities + element.toString() + ",";
              });
            }
            );
          },
        ),
        Visibility(
          visible: !selectedCities.isEmpty,
          child :  Wrap(
            children: selectedCities.split(",").map((city) {
              return city.isNotEmpty ? Container(
                  margin: EdgeInsets.only(right: 10 , top: 10),
                  padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
                  decoration: BoxDecoration(
                      color: MyAppColors.blueSecondColor,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child : Text(city.toUpperCase() ,style: TextStyle(color: Colors.white  , fontSize: 11 , fontWeight: FontWeight.bold ,),)
              ) : Container();
            }).toList(),
          )
        )
      ],
    );
  }


}
