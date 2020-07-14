import 'package:flutter/material.dart';
import 'package:food_project/core/model/category_model.dart';
import 'meal_content.dart';

class ZCMealScreen extends StatelessWidget {

  // 路由
  static const String routeName = "/meal";

  @override
  Widget build(BuildContext context) {
    // 获取参数
    final category = ModalRoute.of(context).settings.arguments as ZCCategoryModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ZCMealContent(),
    );
  }
}
