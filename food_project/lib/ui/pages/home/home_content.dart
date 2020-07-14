import 'package:flutter/material.dart';
import '../../../core/service/json_parse.dart';
import '../../../core/model/category_model.dart';
//import '../../../core/extension/int_extension.dart';
import 'package:food_project/core/extension/int_extension.dart';
import 'home_category_item.dart';


class ZCHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ZCCategoryModel>>(
      future: JsonParse.getCategoryData(),
      builder: (ctx, snapshot) {
        // 没有数据 加载菊花
        if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
        // 请求错误
        if (snapshot.error != null) return Center(child: Text("请求失败"));

        final categories = snapshot.data; // 局部变量 不需要下划线 _
        return GridView.builder(
          padding: EdgeInsets.all(20.px),
          itemCount: categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20.px,
            mainAxisSpacing: 20.px,
            childAspectRatio: 1.5, // 宽高比
          ),
          itemBuilder: (ctx, index) {
            return ZCHomeCategoryItem(categories[index]);
          },
        );
      },
    );
  }
}
