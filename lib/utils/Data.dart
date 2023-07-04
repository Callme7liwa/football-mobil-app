
import 'package:flutter/cupertino.dart';

class Player {
  final String name ;
  final String location ;
  final String age ;
  final String imagePath ;
  final String position ;

  Player(this.name, this.location , this.age, this.imagePath, this.position);
}

class Data  {
  static List<Player> players = [
    Player("Neymar Jr", "Rio,Bresil" , "26", "assets/images/players/neymar.jpg", "MD AT" ),
    Player("Ronaldo", "Al Nassr,saudi arabic", "21", "assets/images/players/ronaldo.jpg", "ML AT"),
    Player("Ziyech", "Al Nassr,saudi arabic", "29" , "assets/images/players/ziyech.jpg", "MR AT"),
    Player("Benzema", "Al Ittihad,saudi arabic", "32", "assets/images/players/benzema.jpg", "MR AT"),
  ];
}
