import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/main/main.dart';

class ZCRouter {

  static final String initialRouter = ZCMainScreen.routeName;

  static final Map<String, WidgetBuilder> routes = {
    ZCMainScreen.routeName: (ctx) => ZCMainScreen(),
  };

  // 扩展
  static final RouteFactory generateRoute = (settings) {
    return null;
  };

  static final RouteFactory unknownRoute = (settings) {
    return null;
  };

}