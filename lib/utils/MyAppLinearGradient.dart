

import 'package:flutter/cupertino.dart';

class MyAppLinearGradient {

  static const linear_gradient_first = LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                        Color(0xFF0B00CB),
                                        Color(0xFF5275E8),
                                        ],
                                      );
  static const lieanr_gradient_second = LinearGradient(
                                        colors: [
                                          Color(0xFF396AFC),
                                          Color.fromRGBO(1, 1, 1, 0.77)
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      );
}