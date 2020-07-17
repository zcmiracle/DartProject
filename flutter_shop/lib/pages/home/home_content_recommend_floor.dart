import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 商品推荐下层
class HomeContentRecommendFloor extends StatelessWidget {

  final List<Map> floor;
  HomeContentRecommendFloor({this.floor});

  void jumpShopDetail(context, goodId) {
    /// 跳转到商品详情

  }

  @override
  Widget build(BuildContext context) {

    double width = ScreenUtil.screenWidth.toDouble();
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // 左侧商品
          Expanded(
            child: Column(
              children: <Widget>[
                /// 左上角大图
                Container(
                  padding: EdgeInsets.only(top: 4),
                  height: ScreenUtil().setHeight(400),
                  child: buildRecommendImage(context, floor[0]['image'], floor[0]["goodId"]),
                ),
                /// 左下角图
                Container(
                  padding: EdgeInsets.only(top: 1, right: 1),
                  height: ScreenUtil().setHeight(200),
                  child: buildRecommendImage(context, floor[1]['image'], floor[1]["goodId"]),
                ),
              ],
            ),
          ),
          // 右侧商品
          Expanded(
            child: Column(
              children: <Widget>[
                /// 右上图
                Container(
                  padding: EdgeInsets.only(top: 4, left: 1, bottom: 1),
                  height: ScreenUtil().setHeight(200),
                  child: buildRecommendImage(context, floor[2]['image'], floor[2]["goodId"]),
                ),
                /// 右中图
                Container(
                  padding: EdgeInsets.only(top: 1, left: 1),
                  height: ScreenUtil().setHeight(200),
                  child: InkWell(
                    child: buildRecommendImage(context, floor[3]['image'], floor[3]["goodId"]),
                  ),
                ),
                /// 右下图
                Container(
                  padding: EdgeInsets.only(top: 1, left: 1),
                  height: ScreenUtil().setHeight(200),
                  child: buildRecommendImage(context, floor[4]['image'], floor[4]["goodId"]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 组件抽取
  Widget buildRecommendImage(BuildContext context, String imageName, String
  goodId) {
    return InkWell(
      child: Image.network(imageName, fit: BoxFit.cover,),
      onTap: () {
        jumpShopDetail(context, goodId);
      },
    );
  }

}
