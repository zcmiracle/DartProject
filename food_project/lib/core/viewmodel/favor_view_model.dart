import '../model/meal_model.dart';
import 'base_view_model.dart';

class ZCFavorViewModel extends BaseMealViewModel {

  void addMeal(ZCMealModel meal) {
    originMeals.add(meal);
    notifyListeners();
  }

  void removeMeal(ZCMealModel meal) {
    originMeals.remove(meal);
    notifyListeners();
  }

  void handleMeal(ZCMealModel meal) {
    if (isFavor(meal)) {
      removeMeal(meal);
    } else {
      addMeal(meal);
    }
  }

  bool isFavor(ZCMealModel meal) {
    return originMeals.contains(meal);
  }
}