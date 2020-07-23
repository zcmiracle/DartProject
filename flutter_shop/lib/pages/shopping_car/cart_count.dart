import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../provide/cart_provide.dart';
import '../../model/cart/cart_info_model.dart';
import '../../config/index.dart';
import 'cart_count.dart';

class CartCount extends StatelessWidget {

  // 构造方法
  final CartInfoModel itemM;
  CartCount(this.itemM);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(165),
      margin: EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: ZCColor.defaultBorderColor),
      ),
      child: Row(
        children: <Widget>[
          /// 减号 -
          _buildDecreaseButton(context),
          /// 数量 1
          _buildCountArea(),
          /// 加号 +
          _buildIncreaseButton(context),
        ],
      ),
    );
  }

  /// - 号按钮
  Widget _buildDecreaseButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<CartProvide>(context, listen: false).addOrDecreaseAction
          (itemM, 'reduce');
      },
      child: Container(
        width: ScreenUtil().setWidth(45),
        height: ScreenUtil().setHeight(45),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          /// 当前数量少于等于1，按钮变为灰色
          color: itemM.count > 1 ? Colors.white : ZCColor.defaultBorderColor,
          border: Border(
            left: BorderSide(
              width: 1, color: ZCColor.defaultBorderColor,
            ),
          ),
        ),
        child: itemM.count > 1 ? Text("-") : Text(" "),
      ),
    );
  }

  /// + 号按钮
  Widget _buildIncreaseButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<CartProvide>(context, listen: false).addOrDecreaseAction(itemM, 'add');
      },
      child: Container(
        width: ScreenUtil().setWidth(45),
        height: ScreenUtil().setHeight(45),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            right: BorderSide(
              width: 1, color: ZCColor.defaultBorderColor,
            ),
          ),
        ),
        child: Text("+"),
      ),
    );
  }

  /// 数量
  Widget _buildCountArea() {
    return Container(
      width: ScreenUtil().setWidth(70),
      height: ScreenUtil().setHeight(45),
      alignment: Alignment.center,
      color: Colors.white,
      child: Text("${itemM.count}"),
    );
  }

}
