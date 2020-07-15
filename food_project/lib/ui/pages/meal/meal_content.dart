import 'package:flutter/material.dart';
import 'package:food_project/core/model/category_model.dart';
import 'package:food_project/core/model/meal_model.dart';
import 'package:food_project/core/viewmodel/meal_view_model.dart';
import 'package:food_project/ui/widgets/meal_item.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

class ZCMealContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final category = ModalRoute.of(context).settings.arguments as ZCCategoryModel;
    return Selector<ZCMealViewModel, List<ZCMealModel>>(
      selector: (ctx, mealViewModel) {
        return mealViewModel.meals.where((meal) {
          return meal.categories.contains(category.id);
        }).toList();
      },
      // 不相等时 才去刷新 这个地方有疑问
      shouldRebuild: (prev, next) => !ListEquality().equals(prev, next),
      builder: (ctx, meals, child) {
        return ListView.builder(
          itemCount: meals.length,
          itemBuilder: (ctx, index) {
            return ZCMealItem(meals[index]);
          },
        );
      },
    );
  }
}




//class ZCMealContent extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//
//    final category = ModalRoute.of(context).settings.arguments as ZCCategoryModel;
//    return Consumer<ZCMealViewModel>(
//      builder: (ctx, mealViewModel, child) {
//        print(mealViewModel.meals);
//        final meals = mealViewModel.meals.where((meal) => meal.categories.contains(category.id)).toList();
//        return ListView.builder(
//          itemCount: meals.length,
//          itemBuilder: (ctx, index) {
//            return ListTile(title:  Text(meals[index].title),);
//          },
//        );
//      },
//    );
//  }
//}
