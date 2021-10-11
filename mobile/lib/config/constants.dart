import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:merchant_helper/models/bottombar.dart';

class Constants {
  static const String baseApiUrl = "http://192.168.31.72:3000/";
  static const String _appFontFamily = 'Inter';
  static const MaterialColor _appPrimarySwatch = MaterialColor(
    0xff35B8BE,
    <int, Color>{
      50: Color(0xff9adcdf),
      100: Color(0xff86d4d8),
      200: Color(0xff72cdd2),
      300: Color(0xff5dc6cb),
      400: Color(0xff49bfc5),
      500: Color(0xff35b8be),
      600: Color(0xff30a6ab),
      700: Color(0xff2a9398),
      800: Color(0xff2a9398),
      900: Color(0xff258185),
    },
  );

  /// Custom light theme
  static ThemeData lightTheme() {
    final typography = Typography.material2014();
    final lightTextTheme = typography.black.apply(
      fontFamily: _appFontFamily,
      displayColor: const Color(0xff161616),
      bodyColor: const Color(0xff161616),
    );

    return ThemeData(
      brightness: Brightness.light,
      fontFamily: _appFontFamily,
      typography: typography,
      textTheme: lightTextTheme,
      primarySwatch: _appPrimarySwatch,
      inputDecorationTheme: const InputDecorationTheme(
        contentPadding: const EdgeInsets.only(left: 12, right: 8),
        filled: true,
        fillColor: Color(0xffFAFAFA),
        border: const OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 0.0),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 0.0),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 0.0),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0.5,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
        ),
        foregroundColor: Color(0xffffffff),
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  static List<BottomBarItem> get bottomNavBarData {
    return [
      BottomBarItem(Icon(Icons.table_chart_rounded), "Table"),
      BottomBarItem(Icon(Icons.map_rounded), "Map"),
      BottomBarItem(Icon(Icons.analytics), "Analytics"),
    ];
  }

  static const String alert_text =
      "The selected orders will be permanently deleted. Do you want to proceed?";
}
