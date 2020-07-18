import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../service/http_service.dart';
import '../../model/category/category_model.dart';
import 'package:provider/provider.dart';
import '../../provide/category_provide.dart';
import '../../provide/current_index_provide.dart';
import 'dart:convert';

// 首页分类导航组件
class HomeContentNavigator extends StatelessWidget {

  final List navigatorList;
  /// 构造方法
  HomeContentNavigator(this.navigatorList);

  @override
  Widget build(BuildContext context) {
    if (navigatorList.length > 10) {
      navigatorList.removeRange(10, navigatorList.length);
    }

    var tempIndex = -1;
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 5.0),
      height: ScreenUtil().setHeight(256),
      padding: EdgeInsets.all(3.0),
      child: GridView.count(
        // 禁止滚动
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 5,
        padding: EdgeInsets.all(5.0),
        children: navigatorList.map((item){
          tempIndex ++;
          return _gridViewItemUI(context, item, tempIndex);
        }).toList(),
      ),
    );
  }

  Widget _gridViewItemUI(BuildContext context, item, index) {
    return InkWell(
      child: Column(
        children: <Widget>[
          Image.network(item['image'], width: ScreenUtil().setWidth(95),),
          Text(item['firstCategoryName'],),
        ],
      ),
      onTap: () {
        print("123");
        // 跳转到分类页面
        _goCategory(context, index, item['firstCategoryId']);
      },
    );
  }

  /// 跳转到分类页面
  void _goCategory(context, index, categoryId) async {
    await request("getCategory", formData: null).then((res) {
      var data = json.decode(res.toString());
      CategoryModel category = CategoryModel.fromJson(data);
      List list = category.data;

      Provider.of<CategoryProvider>(context, listen: false).changeFirstCategory
        (categoryId, index);
      Provider.of<CategoryProvider>(context, listen: false).getSecondCategory
        (list[index].secondCategoryVO, categoryId);
      Provider.of<CurrentIndexProvide>(context, listen: false).changeIndex(1);

      /// 获取商品列表

    });
  }



}
