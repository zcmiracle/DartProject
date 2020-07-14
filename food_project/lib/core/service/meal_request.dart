import 'http_request.dart';
import '../model/meal_model.dart';

class ZCMealRequest {
  static Future<List<ZCMealModel>> getMealData() async {
    // 1、发送网络请求
    final url = "/meal";
    final result = await HttpRequest.request(url);

    // 2、json转model
    final mealArray = result["meal"];
    List<ZCMealModel> meals = [];
    for (var json in mealArray) {
      meals.add(ZCMealModel.fromJson(json));
    }
    print(result);

    return meals;
  }
}