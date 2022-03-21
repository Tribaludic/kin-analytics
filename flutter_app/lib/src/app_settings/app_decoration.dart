import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_images.dart';
import 'app_text_styles.dart';

class AppDecoration
{
  static const BoxDecoration titledBackground =
  BoxDecoration(
      color: AppColors.backgroundColor,
      image: DecorationImage(
        image: AssetImage(AppImages.titledBackground),
        fit: BoxFit.fill,
      )
  );

  static InputDecoration inputDecoration({String? hintText, Icon? icon, Widget? suffix}){
    return InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: AppColors.unfocusedColor,
              width: 1
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: AppColors.focusedColor,
              width: 2
          ),
        ),
        hintText: hintText,
        hintStyle: AppTextStyle.bodyText(color: Colors.grey),
        icon: icon,
        suffix: suffix
    );
  }

  static final RoundedRectangleBorder rectangleButtonBorder = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(18.0),
    //side: BorderSide(color: Colors.black),
  );

  static RoundedRectangleBorder rectangleRoundedBorder ({Color borderColor = Colors.transparent}){
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25.0),
      side: BorderSide(color: borderColor),
    );
  }


  static const CircleBorder outlinedCircleButtonShape = CircleBorder(
    side: BorderSide(color: Colors.black, width: 2),
  );

  static const double alertIconSize = 120;
//static const Color alertIconColor = AppColors.primaryColor;
//static const Color dividerColor = AppColors.primaryColor;

}