import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_color.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        primaryColor: AppColor.White,
        primaryColorLight: AppColor.White,
        primaryColorDark: AppColor.Blue,
        appBarTheme: AppBarTheme(
            elevation: 2,
            iconTheme: IconThemeData(color: AppColor.Black),
            backgroundColor: AppColor.White,
            titleTextStyle: TextStyle(
                color: AppColor.Black,
                fontSize: 16,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w800),
            systemOverlayStyle: SystemUiOverlayStyle.dark
                .copyWith(statusBarColor: AppColor.White)),
        scaffoldBackgroundColor: AppColor.BackgroundLight,
        cardColor: AppColor.CardLight,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColor.White,
          elevation: 8,
          selectedItemColor: AppColor.selectedBottomItemColor,
          unselectedItemColor: AppColor.unselectedBottomItemColor,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle:
              TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          unselectedLabelStyle:
              TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
        dividerColor: AppColor.DividerLight,
        splashColor: AppColor.Transparent,
        iconTheme: IconThemeData(color: AppColor.Black),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme,
        progressIndicatorTheme: ProgressIndicatorThemeData(color: AppColor.Red700),
        buttonTheme: ButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: AppColor.Red,
        ));
  }

  static ThemeData get darkTheme {
    return ThemeData(
        primaryColor: AppColor.Blue,
        primaryColorLight: AppColor.White,
        primaryColorDark: AppColor.Blue,
        appBarTheme: AppBarTheme(
            elevation: 2,
            iconTheme: IconThemeData(color: AppColor.White),
            backgroundColor: AppColor.Blue,
            titleTextStyle: TextStyle(
                color: AppColor.White,
                fontSize: 16,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w800),
            systemOverlayStyle: SystemUiOverlayStyle(
                systemNavigationBarColor: AppColor.Blue,
                statusBarColor: AppColor.Blue,
                statusBarBrightness: Brightness.dark,
                statusBarIconBrightness: Brightness.light)),
        scaffoldBackgroundColor: AppColor.BackgroundDark,
        cardColor: AppColor.CardDark,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColor.Blue,
          elevation: 8,
          selectedItemColor: AppColor.selectedBottomItemColor,
          unselectedItemColor: AppColor.unselectedBottomItemColor,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle:
              TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          unselectedLabelStyle:
              TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
        dividerColor: AppColor.DividerDark,
        splashColor: AppColor.Transparent,
        iconTheme: IconThemeData(color: AppColor.White),
        fontFamily: 'Raleway',
        textTheme: ThemeData.dark().textTheme,
        progressIndicatorTheme: ProgressIndicatorThemeData(color: AppColor.Red700),
        buttonTheme: ButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: AppColor.Red,
        ));
  }
}
