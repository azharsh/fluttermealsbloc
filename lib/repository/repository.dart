

import 'package:fluttermeal/model/food_response.dart';
import 'package:fluttermeal/network/api_provider.dart';

class Repository {

  final apiProvider = ApiProvider();

  Future<FoodResponse?> getFood() => apiProvider.getFood();


}