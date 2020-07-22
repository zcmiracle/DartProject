import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/main/main.dart';
import '../pages/details_page/details_page.dart';


/// XMG
class ZCRouter {

  static final String initialRouter = ZCMainScreen.routeName;

  static final Map<String, WidgetBuilder> routes = {
    ZCMainScreen.routeName: (ctx) => ZCMainScreen(),
//    DetailsPage.routeName: (ctx) => ZCMainScreen(),
  };

  // 扩展
  static final RouteFactory generateRoute = (settings) {
    return null;
  };

  static final RouteFactory unknownRoute = (settings) {
    return null;
  };

}