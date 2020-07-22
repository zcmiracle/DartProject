import 'package:flutter/material.dart';
import '../../provide/detail_info_provide.dart';
import 'package:provider/provider.dart';
import '../../config/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 商品详情页 首屏区域，包括图片 商品名称 商品价格 商品编号等UI的展示
class DetailsTopArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DetailsInfoProvide>(
      builder: (context, child, value) {
        var goodsInfo = Provider.of<DetailsInfoProvide>(context).goodsInfo
            .data.goodInfo;
        if (goodsInfo != null) {
          return Container(
            color: Colors.white,
            padding: EdgeInsets.all(2.0),
            child: Column(
              children: <Widget>[
                /// 商品图片
                _buildGoodsImage(goodsInfo.image1),
                /// 商品名称
                _buildGoodsName(goodsInfo.goodsName),
                /// 商品编号
                _buildGoodsNumber(goodsInfo.goodsSerialNumber),
                /// 商品当前价 + 市场价
                _buildGoodsPrice(goodsInfo.presentPrice, goodsInfo.oriPrice),
              ],
            ),
          );
        } else {
          return Text(ZCString.onLoadingTitle);
        }
      },
    );
  }

  /// 商品图片
  Widget _buildGoodsImage(url) {
    return Image.network(
      url,
      width: ScreenUtil().setWidth(740),
    );
  }

  /// 商品名称
  Widget _buildGoodsName(name) {
    return Container(
      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(left: 15.0),
      child: Text(
        name,
        maxLines: 1,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(30),
        ),
      ),
    );
  }

  /// 商品编号
  Widget _buildGoodsNumber(num) {
    return Container(
      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(left: 15.0),
      margin: EdgeInsets.only(top: 8.0),
      child: Text(
        '编号:${num}',
        style: TextStyle(
          color: ZCColor.detailGoodsIdColor,
        ),
      ),
    );
  }

  /// 商品价格 当前价格 + 市场价
  Widget _buildGoodsPrice(presentPrice, oriPrice) {
    return Container(
      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(left: 15.0),
      margin: EdgeInsets.only(top: 8.0),
      child: Row(
        children: <Widget>[
          Text(
            "￥${presentPrice}",
            style: TextStyle(
              color: ZCColor.presentPriceTextColor,
              fontSize: ScreenUtil().setSp(40),
            ),
          ),
          Text(
            ' 市场价￥${oriPrice}',
            style: TextStyle(
              color: ZCColor.originPriceTextColor,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ],
      ),
    );
  }

}

