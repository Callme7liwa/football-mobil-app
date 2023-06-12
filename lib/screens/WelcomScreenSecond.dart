import 'package:flutter/material.dart';
import 'package:my_flutter_application/utils/MyAppBoxShadow.dart';
import 'package:my_flutter_application/utils/MyAppColors.dart';

class WelcomScreenSecond extends StatelessWidget {

  const WelcomScreenSecond({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final desiredHeight = screenHeight * (2.2 / 3);
    final descriptionWelcome = "Cherish the moments, embrace the passion, and unlock the power of football";
    return  Scaffold(
      backgroundColor: MyAppColors.greenColor,
      body: Padding(
        padding: EdgeInsets.only(top: 10.0 , left: 10.0 , right: 10.0),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: desiredHeight,
                decoration: BoxDecoration(
                  boxShadow: [MyAppBoxShadow.boxShadowSecond],
                  borderRadius: BorderRadius.circular(10),
                  color: MyAppColors.blackColor
                ),
                child: Center(
                  child: Column(
                    children: [
                      Image(image: AssetImage("assets/images/player.png") , width: desiredHeight * 1.8/3  ),
                      SizedBox(height: 10,),
                      Text("LOG IN" , style: TextStyle(fontSize: 22  , fontWeight: FontWeight.bold , color: Colors.white),),
                      SizedBox(height: 10,),
                      Text("PLAY MORE" , style: TextStyle(fontSize: 22  , fontWeight: FontWeight.bold , color: Colors.white),),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image(image: AssetImage("assets/images/ball.png"),width: 20,height: 20,),
                          SizedBox(width: 5,),
                          Text("our services".toUpperCase() , style: TextStyle(color: MyAppColors.greenColor , fontSize: 11 , fontWeight: FontWeight.bold),),
                          Icon(Icons.chevron_right , color: MyAppColors.greenColor,)
                        ],
                      )
                    ],
                  ),
                )
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15 , horizontal: 50),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: MyAppColors.blackColor
                    ),
                    child:
                     Row(
                       children: [
                         Text("Next".toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold , fontSize: 12 , color: MyAppColors.greenColor),),
                         Icon(Icons.chevron_right , color: MyAppColors.greenColor,)
                       ],
                     )
                  )
                ],
              ),
              /*Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Continue".toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold,color: MyAppColors.blackColor),),
                    CircleAvatar(
                      backgroundColor: MyAppColors.blackColor,
                      child: Icon(Icons.chevron_right , color: MyAppColors.greenColor,),
                    ),
                  ],
                ),
              ),*/
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Center(
                    child: Text(descriptionWelcome , textAlign: TextAlign.center,style: TextStyle(fontSize: 10 , fontWeight: FontWeight.bold, color: MyAppColors.backgroundColor ,),)
                ),
              ),
              SizedBox(height: 10,),
              Center(
                child: Image(image: AssetImage("assets/images/ball.png"), width: 30,height: 30,),
              )
            ],
          ),
        ),
      ) ,
    );
  }

}
