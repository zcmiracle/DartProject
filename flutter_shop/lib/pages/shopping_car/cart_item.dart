import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../provide/cart_provide.dart';
import '../../model/cart/cart_info_model.dart';
import '../../config/index.dart';
import 'cart_count.dart';

/// 单个item listView中
class CartItem extends StatelessWidget {

  final CartInfoModel itemModel;
  CartItem(this.itemModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 2.0),
      padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 1, color: ZCColor.defaultBorderColor),
        ),
      ),
      child: Row(
        children: <Widget>[
          /// 复选框
          _buildCartCheckButton(context, itemModel),
          /// 商品图片
          _buildCartGoodsImage(itemModel),
          /// 商品名称
          _buildCartGoodsName(itemModel),
          /// 商品价格
          _buildCartPriceName(context, itemModel),
        ],
      ),
    );
  }

  /// 复选框
  Widget _buildCartCheckButton(BuildContext context, CartInfoModel itemM) {
    return Container(
      child: Checkbox(
        value: itemM.isCheck,
        activeColor: ZCColor.checkBoxColor,
        onChanged: (bool value) {
          itemM.isCheck = value;
          /// 改变选中状态
          Provider.of<CartProvide>(context, listen: false).changeCheckState
            (itemM);
        },
      ),
    );
  }

  /// 商品图片
  Widget _buildCartGoodsImage(CartInfoModel itemM) {
    return Container(
      width: ScreenUtil().setWidth(150),
      padding: EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: ZCColor.defaultBorderColor),
      ),
      child: Image.network(itemM.images),
    );
  }

  /// 商品名称
  Widget _buildCartGoodsName(CartInfoModel itemM) {
    return Container(
      width: ScreenUtil().setWidth(300),
      padding: EdgeInsets.all(10.0),
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Text(itemM.goodsName),
          /// 加减组件
          CartCount(itemM),
        ],
      ),
    );
  }

  /// 商品价格
  Widget _buildCartPriceName(BuildContext context, CartInfoModel itemM) {
    return Container(
      width: ScreenUtil().setWidth(150),
      alignment: Alignment.centerRight,
      child: Column(
        children: <Widget>[
          Text(
            '￥${itemM.price}',
            style: TextStyle(color: ZCColor.presentPriceTextColor),
          ),
          Container(
            child: InkWell(
              onTap: () {
                Provider.of<CartProvide>(context, listen: false).deleteOneGoods(itemM.goodsId);
              },
              child: Icon(Icons.delete_forever, color: ZCColor.deleteIconColor, size: 30,),
            ),
          ),
        ],
      ),
    );
  }

}
