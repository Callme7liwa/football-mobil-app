import 'package:flutter/material.dart';
import 'package:my_flutter_application/utils/MyAppColors.dart';

class WelcomThird extends StatelessWidget {
  const WelcomThird({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final desiredHeight = screenHeight * (1.6 / 3);
    final descriptionWelcome = "Cherish the moments, embrace the passion, and unlock the power of football";
    return  Scaffold(
       backgroundColor: MyAppColors.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SafeArea(
            child: Column(
              children: [
                Image(image:  AssetImage("assets/images/player_third.png"),height: desiredHeight,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text("Play Your Matches Under Control ", textAlign: TextAlign.center ,style: TextStyle(fontSize:23, color: MyAppColors.blackColor , fontWeight: FontWeight.w900 , ),)
                ),
                SizedBox(height: 10,),
                Image(image: AssetImage("assets/images/icons/icon_flash.png") , width:40,),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text(descriptionWelcome,textAlign: TextAlign.center,style: TextStyle(
                      color: Color.fromRGBO(87, 87, 87, 0.3) ,fontWeight: FontWeight.bold,fontSize: 11),),
                ),
                SizedBox(height: 20,),
                makeButton(),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      child: Image(image: AssetImage("assets/images/ball.png") ,),
                    ),
                    Expanded(
                        child: Container(
                          height: 1,
                          color: Color.fromRGBO(
                              93, 93, 93, 0.13137254901960784),
                        )
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      child: Image(image: AssetImage("assets/images/ball.png") ,),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
    );
  }

  Widget makeButton()
  {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color:MyAppColors.blueLightSecondColor,
        borderRadius: BorderRadius.circular(30)
      ),
      child: Center(
        child: Text("Next" , style: TextStyle(color: MyAppColors.backgroundColor , fontWeight: FontWeight.bold ,  ),),
      ),
    );
  }
}
