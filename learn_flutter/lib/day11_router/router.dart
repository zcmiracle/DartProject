import 'package:flutter/material.dart';
import 'main.dart';
import 'about.dart';
import 'detail.dart';
import 'unknow.dart';

class ZCRouter {

  static final Map<String, WidgetBuilder> routes = {
    ZCHomePage.routeName: (ctx) => ZCHomePage(),
    ZCAbout.routeName: (ctx) => ZCAbout(),
  };

  /// 默认启动的路由
  static final String initialRoute = ZCHomePage.routeName;

  /// 钩子函数
  static final RouteFactory generateRoute = (settings) {
    if (settings.name == ZCDetailPage.routeName) {
      return MaterialPageRoute(
          builder: (ctx) {
            // 传递参数
            return ZCDetailPage(settings.arguments);
          }
      );
    }
//    else if (settings.name == ZCCategoryPage.routName)
    return null;
  };

  static final RouteFactory unknownRoute = (settings) {
    return MaterialPageRoute(
        builder: (context) {
          return ZCUnKnowPage();
        }
    );
  };

}