import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/main/bottom_bar_item.dart';

import '../home/home_page.dart';
import '../category/category_page.dart';
import '../shopping_car/cart_page.dart';
import '../member/member_page.dart';

final List<Widget> pages = [
  HomePage(),
  CategoryPage(),
  ShoppingCarPage(),
  MemberPage(),
];

final List<BottomNavigationBarItem> items = [
  BottomNavigationBarItem(
    title: Text("首页"),
    icon: Icon(Icons.home),
  ),
  BottomNavigationBarItem(
    title: Text("分类"),
    icon: Icon(Icons.category),
  ),
  BottomNavigationBarItem(
    title: Text("购物车"),
    icon: Icon(Icons.shopping_cart),
  ),
  BottomNavigationBarItem(
    title: Text("会员中心"),
    icon: Icon(Icons.person),
  ),
];