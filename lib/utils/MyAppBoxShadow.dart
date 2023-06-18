import 'package:flutter/material.dart';

class MyAppBoxShadow {

  static const BoxShadow boxShadow =  BoxShadow(
                                            blurRadius: 7,
                                            offset: Offset(0, 7),
                                            spreadRadius: 0,
                                          );

  static const BoxShadow boxShadowSecond =  BoxShadow(
                                              color: Color.fromRGBO(0, 0, 0, 0.16),
                                              blurRadius: 4,
                                              offset: Offset(0, 1),
                                              spreadRadius: 0,
                                            );
  static const BoxShadow boxShadowThird =  BoxShadow(
                                            color: Color.fromRGBO(0, 0, 0, 0.1),
                                            offset: Offset(0, 4),
                                            blurRadius: 12,
                                          );
  static const BoxShadow boxShadowFour =   BoxShadow(
                                            color: Color.fromRGBO(0, 0, 0, 0.05),
                                            offset: Offset(0, 0),
                                            blurRadius: 0,
                                            spreadRadius: 1,
                                          );
  static final BoxShadow boxShadowFive = BoxShadow(
                                          color: Color.fromRGBO(17, 17, 26, 0.1),
                                          offset: Offset(0, 1),
                                          blurRadius: 0,
                                        );



}