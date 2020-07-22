import 'package:flutter/material.dart';
import '../../config/index.dart';
import '../../service/http_service.dart';
import 'dart:convert';
import '../../provide/detail_info_provide.dart';
import 'package:provider/provider.dart';
import '../../model/details/details_model.dart';

import 'details_top_area.dart';
import 'details_top_explain.dart';
import 'details_tabbar.dart';
import 'details_web.dart';
import 'details_bottom.dart';

class DetailsPage extends StatefulWidget {
  final String goodsId;
  DetailsPage(this.goodsId);
  DetailsPageState createState() => DetailsPageState(this.goodsId);
}

class DetailsPageState extends State<DetailsPage> {
  //商品ID
  final String goodsId;
  DetailsPageState(this.goodsId);
  DetailModel goodsInfo = null;

  @override
  void initState() {
    super.initState();
    _getGoodsInfo();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () { /// 返回上一页
                Navigator.pop(context);
              },
            ),
            title: Text(ZCString.detailPagesTitle), //'商品详情'
          ),
          body: (goodsInfo!=null) ? Stack(
            children: <Widget>[
              ListView(
                children: <Widget>[
                  /// 商品图片 名称 编号 价格
                  DetailsTopArea(),
                  /// 说明：> 急速送达 > 正品保证
                  DetailsExplain(),
                  /// tabBar
                  DetailsTabBar(),
                  /// 商品详情
                  DetailWeb(),
                ],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                /// 加入购物车 马上购买
                child: DetailBottom(),
              ),
            ],
          ) : Text(ZCString.loading)//'加载中...'
      ),
    );
  }

  /// 获取商品信息
  Future _getGoodsInfo() async {

    var formData = {'goodId': goodsId};
    await request('getGoodDetail', formData: formData).then((val) {
      var responseData = json.decode(val.toString());
      print("responseData${responseData}");
      setState(() {
        goodsInfo = DetailModel.fromJson(responseData);
      });
      Provider.of<DetailsInfoProvide>(context, listen: false).goodsInfo = goodsInfo;
    });
  }
}
