import 'package:flutter/material.dart';
import '../../service/http_service.dart';
import '../../model/category/category_model.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import '../../provide/category_provide.dart';

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

    _getCategoryData();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
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
      Provider.of<CategoryProvider>(context).getSecondCategory(list[0]
          .secondCategoryVO, '4');

      
    });
  }
}
