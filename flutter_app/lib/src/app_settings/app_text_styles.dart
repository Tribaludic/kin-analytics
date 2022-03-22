import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyle {
  static TextStyle displayText({Color color = AppColors.secondaryColor}) {
    return TextStyle(
      color: color,
      fontSize: 36,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle titleText({Color color = AppColors.secondaryColor, FontWeight fontWeight = FontWeight.bold}) {
    return TextStyle(
      color: color,
      fontSize: 30,
      fontWeight: fontWeight,
    );
  }

  static TextStyle headerText({Color color = Colors.black, FontWeight fontWeight = FontWeight.bold}) {
    return TextStyle(
      fontSize: 20,
      color: color,
      fontWeight: fontWeight,
    );
  }


  static TextStyle bodyText({Color color = Colors.black, FontWeight fontWeight = FontWeight.normal}) {
    return TextStyle(
      color: color,
      fontSize: 17,
      fontWeight: fontWeight,
    );
  }


  static TextStyle subTitle({Color color = Colors.black}) {
    return TextStyle(
      color: color,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    );
  }


  static TextStyle smallText ({Color color = AppColors.primaryColor, FontWeight fontWeight = FontWeight.normal}){
    return TextStyle(
      color: color,
      fontSize: 15,
      fontWeight: fontWeight,
    );
  }
}