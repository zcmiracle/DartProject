import 'package:flutter/material.dart';
import 'package:food_project/core/model/meal_model.dart';
import '../../core/extension/int_extension.dart';

class ZCMealItem extends StatelessWidget {

  final ZCMealModel _meal;
  ZCMealItem(this._meal);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.px),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.px)),
      child: Column(
        children: <Widget>[
          buildBasicInfo(),
          buildOperationInfo(),
        ],
      ),
    );
  }

  // 基本信息
  Widget buildBasicInfo() {
    return Stack(
      children: <Widget>[
        Image.network(_meal.imageUrl, width: double.infinity, height: 250.px, fit: BoxFit.cover,),
      ],
    );
  }

  // 操作
  Widget buildOperationInfo() {

  }
}
