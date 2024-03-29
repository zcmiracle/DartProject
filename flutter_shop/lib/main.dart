import 'package:flutter/material.dart';
import 'package:flutter_shop/config/app_theme.dart';
import 'package:flutter_shop/routers/routers.dart';
import 'provide/current_index_provide.dart';
import 'package:provider/provider.dart';
import 'provide/category_provide.dart';
import 'provide/category_goods_list_provide.dart';
import 'provide/detail_info_provide.dart';
import 'provide/cart_provide.dart';
import 'package:flutter_shop/routers/routes.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_shop/routers/application.dart';
import 'config/index.dart';

/**
 * Provide借助了InheritWidget，将共享状态放到顶层MaterialApp之上。底层部件通过Provier获取该状态
 * 并且通过混合ChangeNotifier通知依赖于该状态的组件刷新
 */

/**
 * 1、先创建自己需要共享的数据
 * 2、在应用程序的顶层ChangeNotifierProvider
 * 3、在其他位置使用共享的数据
 * > Provider.of： 当Provider中的数据发生改变，Provider.of所在的Widget整个build方法都会重新构建
 * > Consumer相对推荐：当Provider中的数据发生改变时，只会重新执行Consumer的builder
 * > Selector<A, S>：
 *   >> 1、selector方法作用：对原有的Provider数据进行转换，
 *   >> 2、shouldRebuild作用：要不要重新构建
 */
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CurrentIndexProvide(),),
        ChangeNotifierProvider(create: (context) => CategoryProvider(),),
        ChangeNotifierProvider(create: (context) => CategoryGoodsListProvider(),),
        ChangeNotifierProvider(create: (context) => DetailsInfoProvide(),),
        ChangeNotifierProvider(create: (context) => CartProvide(),),
      ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    /// 腾讯课堂
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;

    ZCSizeFit.initialize();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ZCString.mainTitle, // Flutter女装商城
      theme: ZCAppTheme.norTheme,
      initialRoute: ZCRouter.initialRouter,
      routes: ZCRouter.routes,
//      onGenerateRoute: ZCRouter.generateRoute,
//      onUnknownRoute: ZCRouter.unknownRoute,
      onGenerateRoute: Application.router.generator,
    );
  }
}

