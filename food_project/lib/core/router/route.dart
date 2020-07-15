import 'package:flutter/material.dart';
import '../../ui/pages/main/main.dart';
import '../../ui/pages/meal/meal.dart';
import '../../ui/pages/detail/detail.dart';

class ZCRouter {
  static final String initialRoute = ZCMainScreen.routeName;

  static final Map<String, WidgetBuilder> routes = {
    ZCMainScreen.routeName: (ctx) => ZCMainScreen(),
    ZCMealScreen.routeName: (ctx) => ZCMealScreen(),
    ZCDetailScreen.routeName: (ctx) => ZCDetailScreen(),
  };

  static final RouteFactory generateRoute = (settings) {
    return null;
  };

  static final RouteFactory unknownRoute = (settings) {
    return null;
  };
}