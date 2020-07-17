import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config/index.dart';
import 'home_content_hot_good_item.dart';


/// 火爆专区
class HomeContentHotGood extends StatelessWidget {

  /// 火爆专区列表 构造方法
  List<Map> hotGoodsLists = [];
  HomeContentHotGood({this.hotGoodsLists});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          hotTitle, // 火爆专区标题
          _wrapList(), // 火爆专区列表
        ],
      ),
    );
  }

  /// 火爆专区列表
  Widget _wrapList() {
    if (hotGoodsLists.length != 0) {
      List<Widget> listWidget = hotGoodsLists.map((value) {
        return InkWell(
          child: HomeContentHotGoodItem(hotGood: value,),
          onTap: () {

          },
        );
      }).toList();
      return Wrap(
        spacing: 2,
        children: listWidget,
      );
    } else {
      return Text("暂无数据");
    }
  }

  /// 火爆专区标题
  Widget hotTitle = Container(
    margin: EdgeInsets.only(top: 10.0),
    padding: EdgeInsets.all(10.0),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border(
        bottom: BorderSide(
          width: 0.5,
          color: ZCColor.defaultBorderColor
        ),
      ),
    ),
    /// 火爆专区
    child: Text(ZCString.hotGoodsTitle, style: TextStyle(color: ZCColor.homeSubTitleTextColor),),
  );

}
