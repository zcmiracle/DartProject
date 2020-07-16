import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../config/index.dart';
import '../provide/current_index_provide.dart';

import 'home_page.dart';
import 'category_page.dart';
import 'cart_page.dart';
import 'member_page.dart';

class IndexPage extends StatelessWidget {

  final List<BottomNavigationBarItem> bottomTabs = [
    // 首页
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text(ZCString.homeTitle),
    ),
    // 分类
    BottomNavigationBarItem(
        icon: Icon(Icons.category),
        title: Text(ZCString.categoryTitle),
    ),
    // 购物车
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      title: Text(ZCString.shoppingCarTitle),
    ),
    // 会员中心
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      title: Text(ZCString.memberTitle),
    ),
  ];

  final List<Widget>tabBody = [
    HomePage(),
    CategoryPage(),
    ShoppingCarPage(),
    MemberPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<CurrentIndexProvide>(
      builder: (ctx, child, val) {
//        final currentInx = context
//        int currentIndex = ;
        return Scaffold(
          backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: 1,
            items: bottomTabs,
            onTap: (index) {

            },
          ),
          body: IndexedStack(
            index: 1,
            children: tabBody,
          ),
        );
      },
    );
  }
}

