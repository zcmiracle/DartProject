
// https://javiercbk.github.io/json_to_dart/
import 'package:flutter/cupertino.dart';

class ZCCategoryModel {
  String id;
  String title;
  String color;
  Color finalColor;

  ZCCategoryModel({this.id, this.title, this.color});

  ZCCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    color = json['color'];

    // 将字符串color转成16进制数字
    final colorInt = int.parse(color, radix: 16);

    // 将透明度加上去
    finalColor = Color(colorInt | 0xFF000000);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['color'] = this.color;
    return data;
  }
}