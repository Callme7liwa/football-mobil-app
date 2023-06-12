import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_flutter_application/utils/MyAppColors.dart';
import 'package:my_flutter_application/utils/MyAppTextSize.dart';
import 'package:my_flutter_application/utils/MyAppBoxShadow.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> titles = [
    {"index": 0, "name": "Current"},
    {"index": 1, "name": "Executed"},
    {"index": 2, "name": "All"},
  ];

  List<dynamic> items  = [{
    "image": "assets/images/one.jpg",
    "price":"29",
    "isFavorite": false,
     },
    {
      "image": "assets/images/two.jpg",
      "price":"29",
      "isFavorite": false,
    },
    {
      "image": "assets/images/three.jpg",
      "price":"29",
      "isFavorite": false,
    }
  ];


  int selectedTitleIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyAppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Applications",
                  style: TextStyle(
                    fontSize: MyAppTextSizes.headline,
                    color: MyAppColors.headlineColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                  ),
                ),
                Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(255, 205, 0, 0.9294117647058824),
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(children: [
              makeTitle(title : titles[0],index: 0),
              makeTitle(title : titles[1],index: 1),
              makeTitle(title : titles[2],index: 2),
            ],),
            SizedBox(height: 30),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10.0 , horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [MyAppBoxShadow.boxShadowSecond]
                //boxShadow:[ MyAppBoxShadow.boxShadow]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Villa for guests in ubud " ,style: TextStyle(color: MyAppColors.headlineColor , fontWeight: FontWeight.bold , ),),
                      Row(
                        children: [
                            Icon(Icons.local_fire_department , color: Colors.orange,),
                            Text("3 offers" , style: TextStyle(
                              color: MyAppColors.beigeColor,
                              fontWeight: FontWeight.bold,
                              fontSize: MyAppTextSizes.small
                            ),)
                          ]
                      )
                    ],
                  ),
                    SizedBox(height: 5,),
                    Text("Nov 20 2020 - Dec 4 , 2020" , style: TextStyle(color: MyAppColors.weighLightColor , fontWeight: FontWeight.bold , fontSize: MyAppTextSizes.caption),),
                    SizedBox(height: 10,),
                    Wrap(
                        spacing: 10, // Set the spacing between items
                        runSpacing: 10, // Set the spacing between lines
                        children: [
                          makeContainer(title : "16 guests"),
                          makeContainer(title : "5 bedrooms"),
                          makeContainer(title : "1400 - 1800"),
                          makeContainer(title : "Open pool"),
                          makeContainer(title : "Kitchen"),
                          makeContainer(title : "Wifi"),
                        ],
                    )
                ],
              ),
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Popular stays" ,style : TextStyle(fontSize : MyAppTextSizes.title,fontWeight: FontWeight.bold , color: MyAppColors.headlineColor ),),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [MyAppBoxShadow.boxShadowSecond]
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.menu_open_rounded),
                  ),
                )
              ],
            ),
            SizedBox(height: 20,),
            SingleChildScrollView(

                child:Wrap(
                  direction: Axis.horizontal,

                  spacing: 10.0, // Set the spacing between items
                      runSpacing: 10.0, // Set the spacing between lines
                      children: <Widget>[
                        makePicture(image: "assets/images/one.jpg"),
                        makePicture(image: "assets/images/one.jpg"),
                        makePicture(image: "assets/images/one.jpg"),
                        makePicture(image: "assets/images/one.jpg"),
                      ],
                    ),
            ),
        ],
        ),
      ),
    );
  }

  Widget makeTitle({title,index})
  {
    final textColor =
    index == selectedTitleIndex ? MyAppColors.headlineColor : MyAppColors.titleNotSelected;
    return Container(
        padding: EdgeInsets.only(right: 15),
        child :  Text(title["name"] , style: TextStyle(fontWeight: FontWeight.bold , fontSize: MyAppTextSizes.title , color: textColor),)
    ) ;
  }

  Widget makeContainer({ title})
  {
    Color randomColor = getRandomColor();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
      decoration: BoxDecoration(
        color: randomColor ,
        boxShadow: [MyAppBoxShadow.boxShadowSecond],
        borderRadius: BorderRadius.circular(15)
      ),
      child: Text(title ,
        style: TextStyle(color: Colors.white,fontSize: MyAppTextSizes.small , fontWeight: FontWeight.bold) ,),
    );
  }

  Widget makePicture({image,mark,price}) {
     return
        Container(
          width: 200,
          height: 250,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black.withOpacity(0.1),
                Colors.transparent,
              ],
            ),
            image : DecorationImage(
                image: AssetImage(image) ,
                fit : BoxFit.cover
            ),
          ),
        );
  }

  Color getRandomColor() {
    Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

}
