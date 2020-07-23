import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../provide/cart_provide.dart';
import '../../model/cart/cart_info_model.dart';
import '../../config/index.dart';
import 'cart_count.dart';

/// 购物车底部组件
class CartBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      color: Colors.white,
      width: ScreenUtil().setWidth(750),
      child: Consumer<CartProvide>(
        builder: (BuildContext context, CartProvide cartProvider, Widget
            child) {
          return Row(
            children: <Widget>[
              /// 全选按钮
              _buildSelectAllButton(context),
              /// 合计区域
              _buildAllPriceArea(context),
              /// 结算按钮
              _buildGoButton(context),
            ],
          );
        },
      ),
    );
  }

  /// 全选按钮
  Widget _buildSelectAllButton(BuildContext context) {

    /// 搞不懂这里为啥用 listent:true
    bool isAllCheck = Provider.of<CartProvide>(context, listen: false)
        .isAllCheck;
    return Container(
      child: Row(
        children: <Widget>[
          Checkbox(
            value: isAllCheck,
            activeColor: ZCColor.checkBoxColor,
            onChanged: (bool value) {
              Provider.of<CartProvide>(context, listen: false).changeAllCheckButtonState(value);
            },
          ),
        ],
      ),
    );
  }

  /// 合计区域
  Widget _buildAllPriceArea(BuildContext context) {

    double allPrice = Provider.of<CartProvide>(context, listen: false).allPrice;
    String allPriceString = allPrice.toStringAsFixed(2);

    return Container(
      width: ScreenUtil().setWidth(430),
      alignment: Alignment.centerRight,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              /// 合计
              Container(
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(200),
                child: Text(
                  ZCString.allPriceTitle, // 合计
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(36),
                  ),
                ),
              ),

              /// 金额
              Container(
                alignment: Alignment.centerLeft,
                width: ScreenUtil().setWidth(230),
                child: Text(
                  "￥${allPriceString}",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(36),
                    color: ZCColor.presentPriceTextColor
                  ),
                ),
              ),
            ],
          ),

          /// 满10元免配送费,预购免配送费
          Container(
            alignment: Alignment.centerRight,
            width: ScreenUtil().setWidth(430),
            child: Text(
              ZCString.allPriceBannerTitle, // 满10元免配送费,预购免配送费
              style: TextStyle(
                fontSize: ScreenUtil().setSp(22),
                color: Colors.black38,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 结算按钮
  Widget _buildGoButton(BuildContext context) {

    int allGoodsCount = Provider.of<CartProvide>(context, listen: false)
        .allGoodsCount;
    return Container(
      width: ScreenUtil().setWidth(160),
      padding: EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: () {
          /// 结算按钮点击
        },
        child: Container(
          padding: EdgeInsets.all(10.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: ZCColor.primaryColor,
            borderRadius: BorderRadius.circular(3.0),
          ),
          child: Text(
            "结算${allGoodsCount}",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

}
