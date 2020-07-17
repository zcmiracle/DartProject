import 'package:flutter/material.dart';
import 'package:flutter_shop/config/color.dart';
import '../../service/http_service.dart';
import '../../model/category/category_model.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import '../../provide/category_provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryContentLeftNav extends StatefulWidget {
  @override
  _CategoryContentLeftNavState createState() => _CategoryContentLeftNavState();
}

class _CategoryContentLeftNavState extends State<CategoryContentLeftNav> {

  List list = [];
  /// 索引
  var listIndex = 0;

  @override
  void initState() {
    super.initState();
    // 获取左侧（一级分类）数据
    _getCategoryData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (BuildContext context, CategoryProvider categoryProvider, Widget child) {
        listIndex = categoryProvider.firstCategoryIndex;
        return Container(
          width: ScreenUtil().setWidth(180),
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(width: 1, color: ZCColor.defaultBorderColor),
            ),
          ),
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              print('======${index}');
              return _buildLeftInkWell(index);
            },
          ),
        );
      },
    );
  }


  Widget _buildLeftInkWell(int index) {
    bool isClick = false;
    isClick = (index == listIndex) ? true : false;
    return InkWell(
      onTap: () {

      },
      child: Container(
        height: ScreenUtil().setWidth(90),
        padding: EdgeInsets.only(left: 10, top: 10),
        decoration: BoxDecoration(
          color: isClick ? Color.fromRGBO(236, 238, 239, 1.0) : Colors.white,
          border: Border(
            bottom: BorderSide(width: 1, color: ZCColor.defaultBorderColor),
            left: BorderSide(width: 2, color: isClick ? ZCColor.primaryColor : Colors.white),
          ),
        ),
        child: Text(
          list[index].firstCategoryName,
          style: TextStyle(
            color: isClick ? ZCColor.primaryColor : Colors.black,
            fontSize: ScreenUtil().setSp(28)
          ),
        ),
      ),
    );
  }

  /// 获取分类数据
  _getCategoryData() async {
    await request('getCategory', formData: null).then((res) {
      var data = json.decode(res.toString());
      CategoryModel categoryModel = CategoryModel.fromJson(data);
      print(categoryModel);
      setState(() {
        list = categoryModel.data;
      });

      /**
       * 通过 Provider<T>.value能够管理一个恒定的数据，并提供给子孙节点使用。
       * 我们只需要将数据在其 value 属性中声明即可。
       * 如果你提供了多个状态，可以使用MultiProvider。
       */
//      Provider.of<CategoryProvider>(context).getSecondCategory(list[0].secondCategoryVO, '4');
      Provider.of<CategoryProvider>(context, listen: false);

    });
  }
}
