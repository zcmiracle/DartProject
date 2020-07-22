import 'package:flutter/material.dart';
import '../../config/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../routers/application.dart';

class HomeContentRecommend extends StatelessWidget {

  final List recommendList;
  HomeContentRecommend(this.recommendList);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget>[
          _titleWidegt(),
          _recommendList(context),
        ],
      ),
    );
  }

  // 推荐商品标题
  Widget _titleWidegt() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 0, 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 0.5, color: ZCColor.defaultBorderColor),
        ),
      ),
      child: Text(
        ZCString.recommendText, // '商品推荐'
        style: TextStyle(color: ZCColor.homeSubTitleTextColor),
      ),
    );
  }

  // 商品推荐列表
  Widget _recommendList(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(300),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommendList.length,
        itemBuilder: (context, index) {
          return _item(context, index);
        },
      ),
    );
  }

  // 商品推荐列表项
  Widget _item(context, index) {
    return InkWell(
      onTap: () {
        Application.router.navigateTo(context, "detail?id=${recommendList[index]["goodsId"]}");
      },
      child: Container(
        width: ScreenUtil().setWidth(280),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(width: 0.5, color: ZCColor.defaultBorderColor),
          ),
        ),
        child: Column(
          children: <Widget>[
            /// 防止溢出
            Expanded(
              child: Image.network(recommendList[index]['image'], fit: BoxFit.contain,),
            ),
            Text(
              '￥${recommendList[index]['presentPrice']}',
              style: TextStyle(color: ZCColor.presentPriceTextColor),
            ),
            Text(
              '￥${recommendList[index]['oriPrice']}',
              style: ZCFont.oriPriceStyle,
            ),
          ],
        ),
      ),
    );
  }

}
