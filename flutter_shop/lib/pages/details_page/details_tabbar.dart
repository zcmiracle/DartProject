import 'package:flutter/material.dart';
import '../../provide/detail_info_provide.dart';
import 'package:provider/provider.dart';
import '../../config/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 商品详细评论切换
class DetailsTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DetailsInfoProvide>(
      builder: (BuildContext context, DetailsInfoProvide detailsInfoProvide, Widget child) {
        var isLeft = detailsInfoProvide.isLeft;
        var isRight = detailsInfoProvide.isRight;
        return Container(
          margin: EdgeInsets.only(top: 15.0),
          child: Row(
            children: <Widget>[
              _myTableLeft(context, isLeft),
              _myTableRight(context, isRight),
            ],
          ),
        );
      },
    );
  }

  /// 左侧tabBar
  Widget _myTableLeft(BuildContext context, bool isLeft) {
    return InkWell(
      onTap: () {
        Provider.of<DetailsInfoProvide>(context, listen: false).changeLeftAndRight("left");
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(375),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              width: 1.0,
              color: isLeft ? ZCColor.detailTextColor : ZCColor.defaultBorderColor,
            )
          ),
        ),
        child: Text(
          '详细',
          style: TextStyle(
            color: isLeft ? ZCColor.detailTextColor : Colors.black
          ),
        ),
      ),
    );
  }

  /// 右侧tabBar
  Widget _myTableRight(BuildContext context, bool isRight) {
    return InkWell(
      onTap: () {
        Provider.of<DetailsInfoProvide>(context, listen: false).changeLeftAndRight("right");
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(375),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(
                width: 1.0,
                color: isRight ? ZCColor.detailTextColor : ZCColor.defaultBorderColor,
              )
          ),
        ),
        child: Text(
          '评论',
          style: TextStyle(
              color: isRight ? ZCColor.detailTextColor : Colors.black
          ),
        ),
      ),
    );
  }

}