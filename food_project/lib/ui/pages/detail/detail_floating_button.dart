import 'package:flutter/material.dart';
import '../../../core/model/meal_model.dart';
import '../../../core/viewmodel/favor_view_model.dart';
import 'package:provider/provider.dart';

class ZCDetailFloatingButton extends StatelessWidget {

  final ZCMealModel _meal;
  ZCDetailFloatingButton(this._meal);

  @override
  Widget build(BuildContext context) {
    return Consumer<ZCFavorViewModel>(
      builder: (context, favorVM, child) {
        // 1、判断是否是收藏状态
        final iconData = favorVM.isFavor(_meal) ? Icons.favorite : Icons
            .favorite_border;
        final iconColor = favorVM.isFavor(_meal) ? Colors.red : Colors.black;

        return FloatingActionButton(
          child: Icon(iconData, color: iconColor),
          backgroundColor: Colors.amber,
          onPressed: () {
            // 判断在内部
            favorVM.handleMeal(_meal);
          },
        );
      },
    );
  }
}

