import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static final ThemeData themeData = ThemeData(
      primaryColor: AppColors.secondaryColor,//color fondo icono app en background
      secondaryHeaderColor: AppColors.secondaryColor,

      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(AppColors.primaryColor),
          )
      ),

      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.secondaryColor,
        selectionColor: AppColors.primaryColor,
        selectionHandleColor: AppColors.secondaryColor,
      )
  );
}