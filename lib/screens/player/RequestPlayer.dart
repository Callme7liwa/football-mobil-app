import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_application/utils/MyAppBoxShadow.dart';
import 'package:my_flutter_application/utils/MyAppColors.dart';

class RequestPlayer extends StatefulWidget {
  const RequestPlayer({Key? key}) : super(key: key);

  @override
  _RequestPlayerState createState() => _RequestPlayerState();
}

class _RequestPlayerState extends State<RequestPlayer> {

  late double screenWidth , screenHeight ;


  @override
  Widget build(BuildContext context) {
    screenWidth  = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    double desiredHeight = screenHeight * 0.20 ;
    return Scaffold(
      backgroundColor: MyAppColors.backgroundColor,
      body: Stack(
        children : [
          Container(
            margin: EdgeInsets.only(top : desiredHeight+10),
            padding: EdgeInsets.symmetric(horizontal: screenWidth*0.03),
            width: screenWidth,
            child: Column(children: [
              makeCardRequest(true , "2022-11-11" , "63"  ),
              makeCardRequest(false , "2023-12-24" , "55"  ),
            ],),
          ),
          Container(
            width: screenWidth,
            height: desiredHeight,
            padding : EdgeInsets.only(left: 10 , bottom: 20),
            decoration : BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(45) , bottomRight: Radius.circular(45))
            ),
            child : SafeArea(
              child : Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children : [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 50,
                        height : 50,
                        decoration : BoxDecoration(
                            boxShadow: [MyAppBoxShadow.boxShadowSecond],
                            color : Color.fromRGBO(
                              246, 246, 246, 0.15294117647058825) ,
                          borderRadius: BorderRadius.circular(25)
                        ),
                        child : Center(
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [MyAppBoxShadow.boxShadowSecond]
                            ),
                            child : Icon(Icons.arrow_circle_left_rounded , size: 40, color: Colors.white,)
                          ),
                        )
                      ),
                    ],
                  ),
                  Row(mainAxisAlignment:MainAxisAlignment.center , children : [
                    Text("Your Requests".toUpperCase() ,
                        style : TextStyle(color : Colors.white , fontSize: 17 , fontWeight: FontWeight.bold , fontFamily: "Roboto")
                    )
                  ]),
                ]
              )
            )
          )
        ]
      ),
    );
  }


  Widget makeCardRequest(bool state ,String date , String submitionsNumber  ) {

    final Color  stateColor = state
                              ? MyAppColors.greenSecondColor
                              : MyAppColors.redSecondColor;
    final String textStatus = state ? "Opened" : "Closed";
    DateTime dateTime = DateTime.parse(date);

    int year = dateTime.year;
    int month = dateTime.month;
    int day = dateTime.day;

    return  Container(
      width: double.infinity,
      padding : EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom : 15),
      decoration: BoxDecoration(
          color: MyAppColors.whiteCardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [MyAppBoxShadow.boxShadowSecond]
      ),
      child: Column(children : [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children:[
          Row(
            children: [
              Image.asset("assets/images/icons/icon_status.png" , width: 20,),
              SizedBox(width: 5,),
              Text("status".toUpperCase() , style: TextStyle(color : Colors.black , fontSize: 11 , fontFamily: "Cairo" , fontWeight: FontWeight.bold),),
            ],
          ),
          Expanded(child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            height: 1,
            decoration: BoxDecoration(
                color : Color.fromRGBO(
                    1, 1, 1, 0.043137254901960784)
            ),
          )),
          Container(
              padding :  EdgeInsets.symmetric(horizontal: 10 , vertical : 7),
              decoration : BoxDecoration(
                color : stateColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [MyAppBoxShadow.boxShadowThird],
              ),
              child : Row(children : [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color : MyAppColors.backgroundColor,
                    boxShadow: [MyAppBoxShadow.boxShadowSecond],
                  ),
                  child: Center(
                      child : Image.asset("assets/images/icons/icon_flash.png", width: 12, height: 12,)
                  ),
                ),
                SizedBox(width: 10,),
                Text(
                    textStatus ,
                    style : TextStyle(color : Colors.white , fontFamily: "Cairo" , fontWeight: FontWeight.bold , fontSize: 11))
              ])
          )
        ]),
        SizedBox(height: 10,),
        Container(
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children : [
            Row(
              children: [
                Image.asset("assets/images/icons/icon_date.png" , width: 20,),
                SizedBox(width: 5,),
                Text("Date".toUpperCase() , style: TextStyle(color : Colors.black , fontSize: 11 , fontFamily: "Cairo" , fontWeight: FontWeight.bold),),
              ],
            ),
            Expanded(child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              height: 1,
              decoration: BoxDecoration(
                  color : Color.fromRGBO(
                      1, 1, 1, 0.043137254901960784)
              ),
            )),
            Row(
              children: [
                Container(
                    padding : EdgeInsets.symmetric(vertical : 5 , horizontal: 7),
                    decoration: BoxDecoration(
                        color:MyAppColors.backgroundColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [MyAppBoxShadow.boxShadowSecond],
                        border: Border.all(color : Color.fromRGBO(
                            1, 1, 1, 0.17254901960784313) , width: 1)
                    ),
                    child : Text(year.toString(), style : TextStyle(color : Colors.black ,  fontSize: 9 , fontWeight: FontWeight.bold))
                ),
                SizedBox(width: 5,),
                Container(
                    padding : EdgeInsets.symmetric(vertical : 5 , horizontal: 7),
                    decoration: BoxDecoration(
                        color:MyAppColors.backgroundColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [MyAppBoxShadow.boxShadowSecond],
                        border: Border.all(color : Color.fromRGBO(
                            1, 1, 1, 0.17254901960784313) , width: 1)
                    ),
                    child : Text(month.toString(), style : TextStyle(color : Colors.black ,  fontSize: 9 , fontWeight: FontWeight.bold))
                ),
                SizedBox(width: 5,),
                Container(
                    padding : EdgeInsets.symmetric(vertical : 5 , horizontal: 7),
                    decoration: BoxDecoration(
                        color:MyAppColors.backgroundColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [MyAppBoxShadow.boxShadowSecond],
                        border: Border.all(color : Color.fromRGBO(
                            1, 1, 1, 0.17254901960784313) , width: 1)
                    ),
                    child : Text(day.toString(), style : TextStyle(color : Colors.black ,  fontSize: 9 , fontWeight: FontWeight.bold))
                ),
              ],
            ),
          ]),
        ),
        SizedBox(height: 10,),
        Container(
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children : [
            Row(
              children: [
                Icon(Icons.send , size: 20,),
                SizedBox(width: 5,),
                Text("Submition".toUpperCase() , style: TextStyle(color : Colors.black , fontSize: 11 , fontFamily: "Cairo" , fontWeight: FontWeight.bold),),
              ],
            ),
            Expanded(child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              height: 1,
              decoration: BoxDecoration(
                  color : Color.fromRGBO(
                      1, 1, 1, 0.043137254901960784)
              ),
            )),
            Row(
              children: [
                Container(
                    padding : EdgeInsets.symmetric(vertical : 5 , horizontal: 7),
                    decoration: BoxDecoration(
                        color : stateColor ,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [MyAppBoxShadow.boxShadowSecond],
                        border: Border.all(color : Color.fromRGBO(
                            1, 1, 1, 0.17254901960784313) , width: 1)
                    ),
                    child : Text(submitionsNumber, style : TextStyle(color : Colors.white ,  fontSize: 9 , fontWeight: FontWeight.bold))
                ),
              ],
            ),
          ]),
        ),
        SizedBox(height: 15,),
        Container(
            width : double.infinity,
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                color : stateColor ,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [MyAppBoxShadow.boxShadowSecond]
            ),
            child : Center(child: Text("More Details".toUpperCase()  , style: TextStyle(color : Colors.white , fontSize: 11 , fontWeight: FontWeight.bold , fontFamily: "Cairo"),))
        )
      ]),
    );
  }

}


