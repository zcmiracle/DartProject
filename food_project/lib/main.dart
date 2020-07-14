import 'package:flutter/material.dart';
import 'package:food_project/ui/shared/app_theme.dart';
import 'core/router/route.dart';
import 'ui/shared/size_fit.dart';
import 'core/service/meal_request.dart';

/// https://javiercbk.github.io/json_to_dart/
/// https://app.quicktype.io

void main() {

  // 测试发送网络请求
  ZCMealRequest.getMealData().then((res) {
    print(res);
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 对ZCSizeFit 进行初始化
    ZCSizeFit.initialize();

    return MaterialApp(
      // 标题
      title: '美食广场',

      // 主题
      theme: ZCAppTheme.normalTheme,

      // 路由
      initialRoute: ZCRouter.initialRoute,
      routes: ZCRouter.routes,
      onGenerateRoute: ZCRouter.generateRoute,
      onUnknownRoute: ZCRouter.unknownRoute,
    );
  }
}

