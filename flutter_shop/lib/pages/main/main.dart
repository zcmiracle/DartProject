import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/main/initialize_item.dart';
import 'package:provider/provider.dart';
import '../../provide/current_index_provide.dart';

class ZCMainScreen extends StatefulWidget {
  // 路由
  static const String routeName = "/";
  @override
  _ZCMainScreenState createState() => _ZCMainScreenState();
}

class _ZCMainScreenState extends State<ZCMainScreen> {

//  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    int _currentIndex = Provider.of<CurrentIndexProvide>(context, listen:
    true).currentIndex;
    print('currentIndex = ${_currentIndex}');
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
          Provider.of<CurrentIndexProvide>(context, listen: false).changeIndex(index);
//          setState(() {
//            _currentIndex = index;
//          });
        },
      ),
    );
  }
}
