
import 'package:flutter/material.dart';
import 'package:my_flutter_application/utils/MyAppColors.dart';

import '../../../../../StudioProjects/Deliver_Ease/lib/utils/MyAppBoxShadow.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: MyAppColors.greenColor,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only( top: 20 ),
                  child:  Text(
                    "Unlock your potential and asses your skills".toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold , fontSize: 36 , color: Colors.white ,),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    renderBalls(),
                    renderBalls(),
                    renderBalls(),
                    renderBalls(),
                  ],
                ),
                SizedBox(height: 20,),
                renderButton(),
                SizedBox(height:  20,),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    child: Image(image: AssetImage("assets/images/player.png"),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget renderBalls() {

    return Container(
        child: Row(
          children: [
            Image(
              image: AssetImage("assets/images/ball.png"),
              width: 30,
              height: 30,
            ),
            SizedBox(width: 20,)
          ],
        ),
    );
  }
  Widget renderButton()
  {
    return (
        GestureDetector(
          onTap: () {
            // Add your desired functionality or navigation logic here
            print('Container tapped');
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              // Container properties
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.black,
                boxShadow: [MyAppBoxShadow.boxShadowThird]
              ),
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: 
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Let's get started".toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold , color: MyAppColors.greenColor , fontSize: 11 ),),
                    Icon(Icons.chevron_right , color: MyAppColors.greenColor,)
                  ],
                ),
              ),
            ),
          ),
        )
    );

  }
}
