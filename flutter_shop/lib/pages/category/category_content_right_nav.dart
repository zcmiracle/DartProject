import 'package:flutter/material.dart';
import '../../provide/current_index_provide.dart';
import '../../provide/category_provide.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config/index.dart';
import '../../service/http_service.dart';
import 'dart:convert';

class CategoryContentRightNav extends StatefulWidget {
  @override
  _CategoryContentRightNavState createState() => _CategoryContentRightNavState();
}

class _CategoryContentRightNavState extends State<CategoryContentRightNav> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (context, categoryProvider, child) {
        return Container(
          height: ScreenUtil().setHeight(80),
          width: ScreenUtil().setWidth(570),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(width: 1, color: ZCColor.defaultBorderColor)
            ),
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoryProvider.secondCategoryList.length,
            itemBuilder: (context, index) {
              return _buildRightInkWell(index, categoryProvider
                  .secondCategoryList[index]);
            },
          ),
        );
      },
    );
  }

  Widget _buildRightInkWell(index, item) {
    bool isClick = false;
    isClick = (index == Provider.of<CategoryProvider>(context, listen: false)
        .secondCategoryIndex) ? true : false;
    return InkWell(
      child: Container(
        height: ScreenUtil().setWidth(90),
        padding: EdgeInsets.only(left: 10, top: 10),
        child: Text(
          item.secondCategoryName,
          style: TextStyle(
            color: isClick ? ZCColor.primaryColor : Colors.black,
            fontSize: ScreenUtil( ).setSp(28),
          ),
        ),
      ),
      /// 点击商品列表
      onTap: () {
        Provider.of<CategoryProvider>(context, listen: false)
            .changeSecondIndex(index, item.secondCategoryId);
        /// 获取商品列表
        _getGoodsList(context, secondCategoryId: item.secondCategoryId);
      },
    );
  }

  ///
  _getGoodsList(context, {String secondCategoryId}) {
    var data = {
      'firstCategoryId': Provider.of<CategoryProvider>(context, listen:
      false).firstCategoryId,
      'secondCategoryId': Provider.of<CategoryProvider>(context, listen: 
      false).secondCategoryId,
      'page': 1
    };
    request('getCategoryGoods', formData: data).then((res) {
      var data = json.decode(res.toString());
      print("secondCategoryId:::${data.toString()}");
    });
  }

}
