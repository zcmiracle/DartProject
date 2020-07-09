import 'package:flutter/material.dart';
import 'package:learn_flutter/douban/pages/main/initialize_item.dart';
import 'initialize_item.dart';

class ZCMainPage extends StatefulWidget {
  @override
  _ZCMainPageState createState() => _ZCMainPageState();
}

class _ZCMainPageState extends State<ZCMainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      /// 底部导航
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        /// 超过四个要设置type为 fixed，不然会隐藏文本
        type: BottomNavigationBarType.fixed,
        items: items,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }





}
