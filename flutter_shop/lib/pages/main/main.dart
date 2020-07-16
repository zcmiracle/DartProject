import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/main/initialize_item.dart';

class ZCMainScreen extends StatefulWidget {
  // 路由
  static const String routeName = "/";

  @override
  _ZCMainScreenState createState() => _ZCMainScreenState();
}

class _ZCMainScreenState extends State<ZCMainScreen> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        type: BottomNavigationBarType.fixed,
        items: items,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
