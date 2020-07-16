import 'package:food_project/core/service/meal_request.dart';
import 'base_view_model.dart';

class ZCMealViewModel extends BaseMealViewModel {

  ZCMealViewModel() {
    ZCMealRequest.getMealData().then((res){
      meals = res;
    });
  }

}
