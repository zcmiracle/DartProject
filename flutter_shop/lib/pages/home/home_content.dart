import 'package:flutter/material.dart';
import '../../service/http_service.dart';
import '../../config/index.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:convert';

import 'home_content_swiper.dart';
import 'home_content_navigator.dart';
import 'home_content_recommend.dart';
import 'home_content_floor_pic.dart';
import 'home_content_recommend_floor.dart';
import 'home_content_hot_good.dart';

class ZCHomeContent extends StatefulWidget {
  @override
  _ZCHomeContentState createState() => _ZCHomeContentState();
}

class _ZCHomeContentState extends State<ZCHomeContent> with AutomaticKeepAliveClientMixin  {
  /// 火爆专区分页
  int page = 1;
  /// 火爆专区数据
  List<Map> hotGoodsList = [];

  /// 防止刷新处理，保持当前状态
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    print("首页刷新");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
        body: FutureBuilder(

          future: request('homePageContent', formData: null),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = json.decode(snapshot.data.toString());
              /// 轮播图
              List<Map> swiperDataLists = (data['data']['slides'] as List).cast();
              /// 分类
              List<Map> navigatorLists = (data['data']['category'] as List).cast();
              /// 商品推荐
              List<Map> recommendList = (data['data']['recommend'] as List).cast();
              /// 底部商品推荐
              List<Map> floor1 = (data['data']['floor1'] as List).cast();
              /// 广告
              Map floorPic1 = data['data']['floor1Pic'];
              return EasyRefresh(
                child: ListView(
                  children: <Widget>[
                    /// 首页轮播
                    HomeContentSwiper(swiperDataLists,),
                    /// 首页分类
                    HomeContentNavigator(navigatorLists,),
                    /// 商品推荐
                    HomeContentRecommend(recommendList),
                    /// 商品广告位
                    HomeContentFloorPic(floorPic1),
                    /// 底部推荐广告位
                    HomeContentRecommendFloor(floor: floor1,),
                    /// 火爆专区数据
                    HomeContentHotGood(hotGoodsLists: hotGoodsList,),
                  ],
                ),
                onRefresh: () async {
                  print("开始刷新");
                },
                onLoad: () async {
                  _getHotGoods(); /// 开始加载更多
                },
              );
            } else {
              return Center();
            }
          },
        ),
      ),
    );
  }

  void _getHotGoods() {
    var formPage = {'page': page};
    request('getHotGoods', formData: formPage).then((res) {
      var data = json.decode(res.toString());
      print(data);
      List<Map> newsGoodsList = (data['data'] as List).cast();
      /// 设置火爆专区数据列表
      setState(() {
        hotGoodsList.addAll(newsGoodsList);
        page ++;
      });
    });
  }

}
