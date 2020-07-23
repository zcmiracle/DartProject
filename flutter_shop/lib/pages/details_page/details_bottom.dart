import 'package:flutter/material.dart';
import '../../provide/detail_info_provide.dart';
import '../../provide/current_index_provide.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config/index.dart';
import '../../provide/cart_provide.dart';

class DetailBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

   var goodsInfo = Provider.of<DetailsInfoProvide>(context, listen: false)
       .goodsInfo.data
       .goodInfo;

   var goodsID = goodsInfo.goodsId;
   var goodsName = goodsInfo.goodsName;
   var count = 1;
   var price = goodsInfo.presentPrice;
   var images = goodsInfo.image1;

    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(80),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          /// 层叠组件 图标可以放一起
          Stack(
            children: <Widget>[
              InkWell(
                onTap: () {
                  Provider.of<CurrentIndexProvide>(context, listen: false).changeIndex(2);
                  Navigator.pop(context);
                },
                child: Container(
                  width: ScreenUtil().setWidth(110),
                  alignment: Alignment.center,
                  child: Icon(Icons.shopping_cart, size: 35, color: Colors.red,),
                ),
              ),

              ///
              Consumer<CartProvide>(
                builder: (BuildContext context, CartProvide cartProvider, Widget child) {
                  /// 购物车商品总数
                  int goodsCount = cartProvider.allGoodsCount;
                  return Positioned(
                    top: 0,
                    right: 10,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(6, 3, 6, 3),
                      decoration: BoxDecoration(
                        color: ZCColor.primaryColor,
                        border: Border.all(width: 2, color: Colors.white),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Text(
                        "${goodsCount}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(22),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),

          /// 添加到购物车
          InkWell(
            onTap: () async {
              // 添加到购物车
              await Provider.of<CartProvide>(context, listen: false).save(goodsID, goodsName, count, price, images);
            },
            child: Container(
              alignment: Alignment.center,
              width: ScreenUtil().setWidth(320),
              height: ScreenUtil().setHeight(80),
              color: Colors.green,
              child: Text(
                ZCString.addToShoppingCar, //加入购物车
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ScreenUtil().setSp(28),
                ),
              ),
            ),
          ),

          /// 马上购买
          InkWell(
            child: Container(
              alignment: Alignment.center,
              width: ScreenUtil().setWidth(320),
              height: ScreenUtil().setHeight(80),
              color: ZCColor.primaryColor,
              child: Text(
                ZCString.buyGoodsText, // 马上购买
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ScreenUtil().setSp(28),
                ),
              ),
            ),
            onTap: () {

            },
          ),
        ],
      ),
    );

  }
}

