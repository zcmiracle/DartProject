import 'package:flutter/material.dart';
import 'package:food_project/core/model/meal_model.dart';
import 'package:food_project/core/service/meal_request.dart';

class ZCMealViewModel extends ChangeNotifier {

  List<ZCMealModel> _meals = [];

  List<ZCMealModel> get meals {
    return _meals;
  }

  ZCMealViewModel() {
    ZCMealRequest.getMealData().then((res){
      _meals = res;
      notifyListeners();
    });
  }


}
