import 'package:flutter/material.dart';
import '../model/meal_model.dart';

class ZCFavorViewModel extends ChangeNotifier {
  List<ZCMealModel> _favorMeals = [];

  List<ZCMealModel> get favorMeals {
    return _favorMeals;
  }

  void addMeal(ZCMealModel meal) {
    _favorMeals.add(meal);
    notifyListeners();
  }

  void removeMeal(ZCMealModel meal) {
    _favorMeals.remove(meal);
    notifyListeners();
  }

  bool isFavor(ZCMealModel meal) {
    return _favorMeals.contains(meal);
  }

  void handleMeal(ZCMealModel meal) {
    if (isFavor(meal)) {
      removeMeal(meal);
    } else {
      addMeal(meal);
    }
  }

}