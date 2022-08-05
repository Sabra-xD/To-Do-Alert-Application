import 'package:flutter/widgets.dart';

class SizeConfigs {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double defaultSize;
  static late Orientation orientation;


  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;

    // On iPhone 11 the defaultSize = 10 almost
    // So if the screen size increase or decrease then our defaultSize also vary

  }
}