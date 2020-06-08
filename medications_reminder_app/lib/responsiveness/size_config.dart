import 'package:flutter/material.dart';

///Custom class for scaling text sizes, margins and everything that needs to be responsive across different screens
class SizeConfig{

  double yMargin(BuildContext context, double height){
    double screenHeight =  MediaQuery.of(context).size.height/ 100;
    return height * screenHeight;
  }
  double xMargin(BuildContext context, double width){
    double screenWidth =  MediaQuery.of(context).size.width/ 100;
    return width * screenWidth;
  }

  double textSize(BuildContext context, double textSize){
    double screenWidth =  MediaQuery.of(context).size.width/ 100;
    return textSize * screenWidth;
  }

}