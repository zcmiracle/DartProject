import 'package:flutter/material.dart';
import 'package:food_project/core/model/meal_model.dart';
import '../../core/extension/int_extension.dart';
import 'operation_item.dart';
import '../../ui/pages/detail/detail.dart';
import 'package:provider/provider.dart';
import 'package:food_project/core/viewmodel/favor_view_model.dart';

final cardRadius = 12.px;

class ZCMealItem extends StatelessWidget {

  final ZCMealModel _meal;
  ZCMealItem(this._meal);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.all(10.px),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.px)),
        child: Column(
          children: <Widget>[
            buildBasicInfo(context),
            buildOperationInfo(),
          ],
        ),
      ),
      /// 点击卡片
      onTap: () {
        Navigator.of(context).pushNamed(ZCDetailScreen.routeName, arguments: _meal);
      },
    );
  }

  // 基本信息 将context传过来
  Widget buildBasicInfo(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(cardRadius),
            topRight: Radius.circular(cardRadius)
          ),
          child: Image.network(_meal.imageUrl, width: double.infinity, height: 250.px, fit: BoxFit.cover,),
        ),
        /// 给Container包裹一个Positioned 绝对定位
        Positioned(
          right: 10.px,
          bottom: 10.px,
          child: Container(
            width: 300.px,
            padding: EdgeInsets.symmetric(horizontal: 10.px, vertical: 5.px),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(6.px),
            ),
            child: Text(
              _meal.title,
              style: Theme.of(context).textTheme.display3.copyWith(color: Colors.white),),
          ),
        ),
      ],
    );
  }

  // 操作
  Widget buildOperationInfo() {
    return Padding(
      padding: EdgeInsets.all(16.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ZCOperationItem(Icon(Icons.schedule), "${_meal.duration}"),
          ZCOperationItem(Icon(Icons.restaurant), "${_meal.complexStr}"),
          buildFavorItem(),
        ],
      ),
    );
  }


  // 方法抽取
  Widget buildFavorItem() {
    return Consumer<ZCFavorViewModel>(
      builder: (ctx, favorVM, child) {
        // 1、判断收藏状态
        final iconData = favorVM.isFavor(_meal) ? Icons.favorite : Icons
            .favorite_border;
        final iconColor = favorVM.isFavor(_meal) ? Colors.red : Colors.black;
        final title = favorVM.isFavor(_meal) ? "收藏" : "未收藏";

        /// 添加点击
        return GestureDetector(
          child: ZCOperationItem(
            Icon(iconData, color: iconColor,),
            title,
            textColor: iconColor,
          ),
          onTap: () {
            favorVM.handleMeal(_meal);
          },
        );
      }
    );
  }


}
