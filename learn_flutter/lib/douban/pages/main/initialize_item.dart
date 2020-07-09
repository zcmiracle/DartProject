import 'package:flutter/material.dart';
import 'bottom_bar_item.dart';
import '../home/home.dart';
import '../subject/subject.dart';
import '../mall/mall.dart';
import '../group/group.dart';
import '../my/my.dart';

List<ZCBottomBarItem> items = [
  ZCBottomBarItem("home", "首页"),
  ZCBottomBarItem("subject", "书影音"),
  ZCBottomBarItem("group", "小组"),
  ZCBottomBarItem("mall", "市集"),
  ZCBottomBarItem("profile", "我的"),
];

List<Widget> pages = [
  ZCHomePage(),
  ZCSubjectPage(),
  ZCGroupPage(),
  ZCMallPage(),
  ZCMyPage(),
];
