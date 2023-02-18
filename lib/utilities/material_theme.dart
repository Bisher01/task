import 'package:bisher_task/utilities/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemeData {
  ThemeData get materialTheme {
    return ThemeData(
        fontFamily: "Alexandria",
        appBarTheme: const AppBarTheme(
          backgroundColor: MyColors.primary,
          centerTitle: true,
          elevation: 0,
          titleTextStyle: TextStyle(
            fontSize: 22,
            fontFamily: "Alexandria",
            color: Colors.white,
            fontWeight: FontWeight.bold,
          )
        ),
        // scaffoldBackgroundColor: Colors.white,
        // textTheme: const TextTheme(
        //   bodyText2: TextStyle(
        //     color: MyColors.textColor,
        //   ),
        //   headline6: TextStyle(color: MyColors.textColor),
        //   headline5: TextStyle(color: MyColors.textColor),
        //   headline4: TextStyle(color: MyColors.textColor),
        // ),
        );
  }
}
