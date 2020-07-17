import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config/index.dart';

/// 火爆专区单个item
class HomeContentHotGoodItem extends StatelessWidget {

  final Map hotGood;
  HomeContentHotGoodItem({this.hotGood});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: ScreenUtil().setWidth(372),
        color: Colors.white,
        padding: EdgeInsets.all(5.0),
        margin: EdgeInsets.only(bottom: 3.0),
        child: Column(
          children: <Widget>[
            Image.network(
              hotGood['image'],
              width: ScreenUtil().setWidth(375),
              height: 200,
              fit: BoxFit.cover,
            ),
            Text(
              hotGood['name'],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: ScreenUtil().setSp(26)),
            ),
            Row(
              children: <Widget>[
                Text(
                  '￥${hotGood['presentPrice']}',
                  style: TextStyle(color: ZCColor.presentPriceTextColor),
                ),
                Text(
                  '￥${hotGood['oriPrice']}',
                  style: TextStyle(color: ZCColor.originPriceTextColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
