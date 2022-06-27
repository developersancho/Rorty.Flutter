import 'package:flutter/material.dart';

//
// val Colors.navigationBackIconColor: Color
// @Composable get() = if (isLight) navigationBackIconLight else navigationBackIconDark
//
// val Colors.dividerColor: Color
// @Composable get() = if (isLight) DividerLight else DividerDark
//
// val Colors.backgroundColor: Color
// @Composable get() = if (isLight) BackgroundLight else BackgroundDark
//
// val Colors.cardBackgroundColor: Color
// @Composable get() = if (isLight) CardLight else CardDark

class AppColor {
  static Color Black = const Color(0xFF000000);
  static Color White = const Color(0xFFFFFFFF);
  static Color Transparent = const Color(0x00000000);
  static Color Blue = const Color(0xFF252941);

  static Color BlueDark = const Color(0xFF05060B);
  static Color Red = const Color(0xFFD13438);
  static Color RedDark = const Color(0xFF982626);

  static Color CardDark = const Color(0xFF3B3E43);
  static Color CardLight = White;

  static Color BackgroundLight = const Color(0xFFF5F2F5);
  static Color BackgroundDark = const Color(0xFF24292E);

  static Color DividerLight = const Color(0xFFE0E0E0);
  static Color DividerDark = const Color(0xFF6E6E6E);

  static Color GrayCircle = const Color(0xFF919191);
  static Color RedCircle = const Color(0xFFD50000);
  static Color GreenCircle = const Color(0xFF00C853);
  static Color BorderLine = const Color(0xFFE5E5EA);

  static Color Red700 = const Color(0xFFD32F2F);

  static Color Gray25 = const Color(0xFFF8F8F8);
  static Color Gray50 = const Color(0xFFF1F1F1);
  static Color Gray75 = const Color(0xFFECECEC);
  static Color Gray100 = const Color(0xFFE1E1E1);
  static Color Gray200 = const Color(0xFFEEEEEE);
  static Color Gray300 = const Color(0xFFACACAC);
  static Color Gray400 = const Color(0xFF919191);
  static Color Gray500 = const Color(0xFF6E6E6E);
  static Color Gray600 = const Color(0xFF535353);
  static Color Gray700 = const Color(0xFF616161);
  static Color Gray800 = const Color(0xFF292929);
  static Color Gray900 = const Color(0xFF212121);
  static Color Gray950 = const Color(0xFF141414);

  static Color selectedBottomItemColor = Red;
  static Color unselectedBottomItemColor = Gray500;

  static Color navigationBackIconDark = White;
  static Color navigationBackIconLight = Black;
}
