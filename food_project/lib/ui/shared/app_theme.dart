import 'package:flutter/material.dart';

class ZCAppTheme {
  // 1、共有属性
  static const double smallFontSize = 16;
  static const double normalFontSize = 22;
  static const double largeFontSize = 24;


  // 2、普通模式
  static final Color normalTextColors = Colors.red;

  static final ThemeData normalTheme = ThemeData(
    primarySwatch: Colors.yellow,
    // 设置整个应用程序的背景颜色
    canvasColor: Color.fromRGBO(255, 254, 222, 1),
    textTheme: TextTheme(
      body1: TextStyle(fontSize: normalFontSize, color: normalTextColors)
    )
  );


  // 3、暗黑模式
  static final Color darkTextColors = Colors.green;

  static final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    textTheme: TextTheme(
      body1: TextStyle(fontSize: normalFontSize, color: darkTextColors)
    )
  );

}