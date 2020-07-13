import 'package:flutter/material.dart';
import '../../ui/pages/main/main.dart';

class ZCRouter {
  static final String initialRoute = ZCMainScreen.routeName;

  static final Map<String, WidgetBuilder> routes = {
    ZCMainScreen.routeName: (ctx) => ZCMainScreen(),
  };

  static final RouteFactory generateRoute = (settings) {
    return null;
  };

  static final RouteFactory unknownRoute = (settings) {
    return null;
  };
}