import 'package:flutter/material.dart';
import 'package:food_project/core/model/meal_model.dart';
import 'filter_view_model.dart';

class BaseMealViewModel extends ChangeNotifier {

  List<ZCMealModel> _meals = [];
  ZCFilterViewModel _filterVM;

  void updateFilters(ZCFilterViewModel filterVM) {
    _filterVM = filterVM;
  }

  List<ZCMealModel> get meals {
    return _meals.where((meal) {
      if (_filterVM.isGlutenFree && !meal.isGlutenFree) return false;
      if (_filterVM.isLactoseFree && !meal.isLactoseFree) return false;
      if (_filterVM.isVegetarian && !meal.isVegetarian) return false;
      if (_filterVM.isVegan && !meal.isVegan) return false;
      return true;
    }).toList();
  }

  List<ZCMealModel> get originMeals {
    return _meals;
  }

  set meals(List<ZCMealModel> value) {
    _meals = value;
    notifyListeners();
  }
}