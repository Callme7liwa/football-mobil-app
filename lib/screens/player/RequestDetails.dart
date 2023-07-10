import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_application/utils/MyAppBoxShadow.dart';
import 'package:my_flutter_application/utils/MyAppColors.dart';

class RequestDetails extends StatefulWidget {
  const RequestDetails({Key? key}) : super(key: key);

  @override
  State<RequestDetails> createState() => _RequestDetailsState();
}

class _RequestDetailsState extends State<RequestDetails> {
  var screenWidth;
  var screenHeight;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: MyAppColors.backgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Icon(Icons.chevron_left,
                          color: Colors.black45, size: 32, weight: 600),
                      Expanded(
                        child: Text(
                          "Details".toUpperCase(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                renderRequestInformation(),
                SizedBox(
                  height: 15,
                ),
                Row(children: [
                  renderTeamSubmitted("assets/images/equipes/barca.png"),
                  renderTeamSubmitted("assets/images/equipes/bayern.png"),
                  renderTeamSubmitted("assets/images/equipes/lyon.png"),
                ]),
                SizedBox(
                  height: 15,
                ),
                renderOffer("assets/images/equipes/barca.png","barcelonna" , "01/11/2023"),
                renderOffer("assets/images/equipes/bayern.png","Bayern" , "11/11/2023"),
                renderOffer("assets/images/equipes/lyon.png","Lyon" , "11/02/2023"),
              ],
            ),
          ),
        ));
  }

  Widget renderTeamSubmitted(String imagePath) {
    return Row(children: [
      SizedBox(width: 10,),
      Stack(children: [
        Container(
            width: 50,
            height: 50,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: MyAppColors.whiteCardColor,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.white, width: 1),
                boxShadow: [MyAppBoxShadow.boxShadowSecond]),
            child: Image.asset(imagePath)),
        Container(
          width: 6,
          height: 2,
          margin: EdgeInsets.only(left: 3.5, top: 40),
          decoration: BoxDecoration(
              color: MyAppColors.blueSecondColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [MyAppBoxShadow.boxShadowSecond]),
        ),
        Container(
          width: 6,
          height: 2,
          margin: EdgeInsets.only(left: 43, top: 10),
          decoration: BoxDecoration(
              color: MyAppColors.blueSecondColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [MyAppBoxShadow.boxShadowSecond]),
        ),
      ])
    ]);
  }

  Widget renderOffer(String imagePath , String teamName , String date )
  {
    return Column(
      children: [
        SizedBox(height: 10,),
        Container(
            width: screenWidth* 0.95 ,
            padding: EdgeInsets.all(8.0),
            decoration : BoxDecoration(
                color : MyAppColors.whiteCardColor,
                border : Border.all( color : Colors.white , width: 1 ),
                borderRadius : BorderRadius.circular(10),
                boxShadow: [MyAppBoxShadow.boxShadowSecond]
            ),
            child : Row(children : [
              Container(
                  width: 40,
                  height: 40,
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: MyAppColors.whiteCardColor,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.white, width: 0.5),
                      boxShadow: [MyAppBoxShadow.boxShadowFive]),
                  child: Image.asset(imagePath)),
              SizedBox(width: 10,),
              Column(crossAxisAlignment : CrossAxisAlignment.start , children:[
                Row(children: [
                  Container(
                    width: 4,
                    height: 4,
                    decoration: BoxDecoration(
                      color : MyAppColors.blueSecondColor ,
                      borderRadius:  BorderRadius.circular(2),
                    ),
                  ),
                  SizedBox(width: 3,),
                  Text(teamName , style: TextStyle(color : Colors.black45 , fontWeight: FontWeight.bold , fontSize: 11),),
                ],),
                IntrinsicWidth(
                  child: Row(children: [
                    Text("Submitted an offre at "  , style: TextStyle(color : Colors.black87 , fontWeight: FontWeight.bold , fontSize: 9),),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8 , vertical: 3),
                      decoration: BoxDecoration(
                        color: MyAppColors.blueSecondColor,
                        borderRadius: BorderRadius.circular(15),
                        border : Border.all(color : Colors.white)
                      ),
                      child : Text(date , style: TextStyle(color : MyAppColors.whiteCardColor , fontWeight: FontWeight.bold , fontSize: 8),)
                    )
                  ],),
                )
              ]),
              Expanded(child: Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: MyAppColors.redSecondColor,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color : Colors.black26)
                    ),
                    child : Center(child: Icon(Icons.close , size: 18 , color: Colors.white,))
                ),
                SizedBox(width: 5,),
                Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: MyAppColors.greenSecondColor,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color : Colors.black26)
                    ),
                    child : Center(child: Icon(Icons.check , size: 18 , color: Colors.white,))
                ),
              ],))
            ])
        ),
      ],
    );
  }

  Widget renderRequestInformation() {

    Widget renderItemInformation(String iconPath , String name , String value)
    {
      return Column(
        children: [
          Row(mainAxisAlignment : MainAxisAlignment.spaceBetween , children : [
            Row(children: [
              Image.asset(iconPath , width: 22, height: 22,),
              SizedBox(width: 7,),
              Text(name, style : TextStyle(color : Colors.black , fontWeight: FontWeight.bold , fontSize: 11 ))
            ],),
            Expanded(child: Container(
              color : Color.fromRGBO(1, 1, 1, 0.11372549019607843),
              width: screenWidth,
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 1,
            )),
            Text(value, style : TextStyle(color: Colors.black , fontWeight: FontWeight.bold , fontSize: 13))
          ]),
          SizedBox(height: 15,),
        ],
      );
    }

    return Container(
      padding: EdgeInsets.all(9),
      decoration: BoxDecoration(
        color : MyAppColors.whiteCardColor,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [MyAppBoxShadow.boxShadowSecond]
      ),
      child: Column(children: [
        Row(children: [
          Image.asset("assets/images/icons/icon_flash.png" , width: 25, height: 25,),
          SizedBox(width: 7,),
          Text("About the request".toUpperCase(), style : TextStyle(color : Colors.black , fontWeight: FontWeight.bold , fontSize: 13 ))
        ],),
        SizedBox(height: 20,),
        Padding(padding: EdgeInsets.symmetric(horizontal: 20) , child : Column(children :[
          renderItemInformation("assets/images/icons/icon_position.png" , "position".toUpperCase() , "MT"),
          renderItemInformation("assets/images/icons/icon_date.png" , "date".toUpperCase() , "01/11/2022"),
        ]))
      ],),
    );
  }


}
