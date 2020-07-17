import 'package:flutter/material.dart';
import '../../config/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 首页分类导航组件
class HomeContentNavigator extends StatelessWidget {

  final List navigatorList;
  /// 构造方法
  HomeContentNavigator(this.navigatorList);

  @override
  Widget build(BuildContext context) {

    if (navigatorList.length > 10) {
      navigatorList.removeRange(10, navigatorList.length);
    }

    var tempIndex = -1;
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 5.0),
      height: ScreenUtil().setHeight(256),
      padding: EdgeInsets.all(3.0),
      child: GridView.count(
        // 禁止滚动
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 5,
        padding: EdgeInsets.all(5.0),
        children: navigatorList.map((item){
          tempIndex ++;
          return _gridViewItemUI(context, item, tempIndex);
        }).toList(),
      ),
    );
  }

  Widget _gridViewItemUI(BuildContext context, item, index) {
    return InkWell(
      onTap: () {
        // 跳转到分类页面
      },
      child: Column(
        children: <Widget>[
          Image.network(item['image'], width: ScreenUtil().setWidth(95),),
          Text(item['firstCategoryName'],),
        ],
      ),
    );
  }

}
