import 'package:flutter/material.dart';
import 'package:food_project/core/model/category_model.dart';
import 'package:food_project/ui/pages/meal/meal.dart';

class ZCHomeCategoryItem extends StatelessWidget {

  final ZCCategoryModel _category;
  ZCHomeCategoryItem(this._category);

  @override
  Widget build(BuildContext context) {

    // 背景颜色
    final bgColor = _category.finalColor;
    /// 包裹手势
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient( // 颜色渐变
            colors: [
              bgColor.withOpacity(.7),
              bgColor,
            ],
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          _category.title,
          style: Theme.of(context).textTheme.display2.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(ZCMealScreen.routeName, arguments: _category);
      },
    );
  }
}
