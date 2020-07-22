import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../provide/category_goods_list_provide.dart';
import '../../provide/category_provide.dart';
import '../../model/category/category_goods_list_model.dart';
import '../../config/index.dart';
import '../../service/http_service.dart';
import '../../routers/application.dart';

class CategoryContentRightPage extends StatefulWidget {
  @override
  _CategoryContentRightPageState createState() => _CategoryContentRightPageState();
}

class _CategoryContentRightPageState extends State<CategoryContentRightPage> {

  // 滚动控制
  var scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {

    return Consumer<CategoryGoodsListProvider>(
      builder: (BuildContext context, CategoryGoodsListProvider categoryGoodsListProvider, Widget child) {

        try {
          // 分页切换滚动到顶部处理
          if (Provider.of<CategoryProvider>(context, listen:false).page == 1) {
            scrollController.jumpTo(0.0);
          }
        } catch (error) {
          print('进入页面第一次初始化:${error}');
        }

        if (categoryGoodsListProvider.goodsList.length > 0) {
          return Expanded(
            child: Container(
              width: ScreenUtil().setWidth(570),
              child: EasyRefresh(
                enableControlFinishRefresh: false,
                enableControlFinishLoad: true,
                header: ClassicalHeader(),
                footer: ClassicalFooter(),

                child: ListView.builder(
                  controller: scrollController,
                  itemCount: categoryGoodsListProvider.goodsList.length,
                  itemBuilder: (context, index) {
                    return builGoodListItem(categoryGoodsListProvider.goodsList, index);
                  },
                ),
                onRefresh: () async {
                  print('123');
                },
                onLoad: () async {
                  if (Provider.of<CategoryProvider>(context, listen: false).noMoreText == "没有更多了") {
                    print("9999999999999");
                    Fluttertoast.showToast(
                      msg: "已经到底了",
                      fontSize: 16.0,
                      timeInSecForIosWeb: 1,
                      backgroundColor: ZCColor.refreshTextColor,
                      gravity: ToastGravity.CENTER,
                    );
                  } else {
                    // 获取更多数据
                    _getMoreGoodsList();
                    print('234');
                  }
                },
              ),
            ),
          );
        } else {
          return Text("暂时没有数据");
        }
      },
    );
  }

  // 上拉加载更多数据
  void _getMoreGoodsList() {
    Provider.of<CategoryProvider>(context, listen: false).addPage();
    var data = {
      'firstCategoryId': Provider.of<CategoryProvider>(context, listen:
      false).firstCategoryId,
      'secondCategoryId': Provider.of<CategoryProvider>(context, listen:
      false).secondCategoryId,
      'page': Provider.of<CategoryProvider>(context, listen: false).page
    };

    request('getCategoryGoods', formData: data).then((res) {
      var data = json.decode(res.toString());
//      print("secondCategoryId:::${data.toString()}");
      // json转model
      CategoryGoodsListModel goodsListM = CategoryGoodsListModel.fromJson(data);
      if (goodsListM.data == null) {
        Provider.of<CategoryProvider>(context, listen: false).chageNoMore("没有更多了");
      } else {
        // 监听provide刷新
        Provider.of<CategoryGoodsListProvider>(context, listen: false).addGoodsList(goodsListM.data);
      }
    });
  }

  /// 商品列表项目
  Widget builGoodListItem(List lists, int index) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 1.0, color: ZCColor.defaultBorderColor),
          ),
        ),
        child: Row(
          children: <Widget>[
            _goodsImage(lists, index),
            Column(
              children: <Widget>[
                _goodsName(lists, index),
                _goodsPrice(lists, index),
              ],
            )
          ],
        ),
      ),
      onTap: () {
        /// 跳转到商品详情页面
        Application.router.navigateTo(context, "detail?id=${lists[index].goodsId}");
      },
    );
  }

  /// 商品图片
  Widget _goodsImage(List lists, int index) {
    return Container(
      width: ScreenUtil().setWidth(200),
      child: Image.network(lists[index].image),
    );
  }

  /// 商品名称
  Widget _goodsName(List lists, int index) {
    return Container(
      width: ScreenUtil().setWidth(370),
      padding: EdgeInsets.all(5),
      child: Text(
        lists[index].name,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: ScreenUtil().setSp(28)),
      ),
    );
  }

  /// 商品价格
  Widget _goodsPrice(List lists, int index) {
    return Container(
      width: ScreenUtil().setWidth(370),
      margin: EdgeInsets.only(top: 20.0),
      padding: EdgeInsets.all(5),
      child: Row(
        children: <Widget>[
          Text(
            "价格:￥${lists[index].presentPrice}",
            style: TextStyle(color: ZCColor.presentPriceTextColor),
          ),
          Text(
            "￥:${lists[index].oriPrice}",
            style: TextStyle(color: Colors.black26, fontSize: 13.0),
          ),
        ],
      ),
    );
  }
}
