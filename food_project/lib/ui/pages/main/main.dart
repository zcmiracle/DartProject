import 'package:flutter/material.dart';
import 'initialize_items.dart';

class ZCMainScreen extends StatefulWidget {

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
        // 超过四个要写
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
