import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config/index.dart';

class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("会员中心"),),
      body: ListView(
        children: <Widget>[
          _buildListViewHeaderWidget(),
          _buildMyOrderWidget(),
          _buildMyOrderTypeWidget(),
          _buildActionList(),
        ],
      ),
    );
  }

  /// headerView
  Widget _buildListViewHeaderWidget() {
    return Container(
      width: ScreenUtil().setWidth(750),
      padding: EdgeInsets.all(20),
      color: ZCColor.primaryColor,
      child: Column(
        children: <Widget>[
          /// 头像
          Container(
            margin: EdgeInsets.only(top: 30),
            child: ClipOval(
              child: SizedBox(
                width: 200,
                height: 200,
                child: Image.asset('assets/images/girl.jpeg', fit: BoxFit.cover,),
              ),
            ),
          ),
          /// 昵称
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              'Fearless',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(36),
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 我的订单
  Widget _buildMyOrderWidget() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: ZCColor.defaultBorderColor,
          ),
        ),
      ),
      child: ListTile(
        leading: Icon(Icons.list),
        title: Text("我的订单"),
        trailing: Icon(Icons.arrow_right),
      ),
    );
  }

  /// 我的订单类型
  Widget _buildMyOrderTypeWidget() {
    return Container(
      margin: EdgeInsets.only(top: 5),
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(150),
      padding: EdgeInsets.only(top: 20),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          /// 待付款
          _buildSubButtonWidget(Icons.payment, "待付款"),
          /// 待发货
          _buildSubButtonWidget(Icons.directions_car, "待发货"),
          /// 待收货
          _buildSubButtonWidget(Icons.directions_car, "待收货"),
          /// 待评价
          _buildSubButtonWidget(Icons.message, "待评价"),
        ],
      ),
    );
  }
  
  Widget _buildSubButtonWidget(IconData imageData, String title) {
    return Container(
      width: ScreenUtil().setWidth(187),
      child: Column(
        children: <Widget>[
          Icon(imageData, size: 30,),
          Text(title),
        ],
      ),
    );
  }

  Widget _buildActionList() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          _buildMyListTile("领取优惠券"),
          _buildMyListTile("已领取优惠券"),
          _buildMyListTile("地址管理"),
          _buildMyListTile("客服电话"),
          _buildMyListTile("关于我们"),
        ],
      ),
    );
  }

  /// cell
  Widget _buildMyListTile(String title) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 1, color: ZCColor.defaultBorderColor),
        ),
      ),
      child: ListTile(
        leading: Icon(Icons.blur_circular),
        title: Text(title),
        trailing: Icon(Icons.arrow_right),
      ),
    );
  }

}
