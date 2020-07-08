import 'package:flutter/material.dart';
import 'package:learn_flutter/douban/pages/main/initialize_item.dart';
import 'initialize_item.dart';

class ZCMainPage extends StatefulWidget {
  @override
  _ZCMainPageState createState() => _ZCMainPageState();
}

class _ZCMainPageState extends State<ZCMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: 0,
        children: <Widget>[

        ],
      ),
      /// 底部导航
      bottomNavigationBar: BottomNavigationBar(
        /// 超过四个要设置type为 fixed，不然会隐藏文本
        type: BottomNavigationBarType.fixed,
        items: items,
      ),
    );
  }





}
