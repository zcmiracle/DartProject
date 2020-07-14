import 'package:flutter/services.dart';
import 'dart:convert';
import '../model/category_model.dart';

// json解析
class JsonParse {

  // 获取分类数据
  static Future<List<ZCCategoryModel>> getCategoryData() async {
    // 1、加载json文件
    final jsonString = await rootBundle.loadString("assets/json/category.json");

    // 2、将jsonString转成Map/List
    final result = json.decode(jsonString);

    // 3、将Map中的内容转成一个个对象
    final resultList = result["category"];
    List<ZCCategoryModel> categories = [];
    for (var json in resultList) {
      categories.add(ZCCategoryModel.fromJson(json));
    }

    return categories;
  }
}