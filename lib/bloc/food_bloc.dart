

import 'package:fluttermeal/model/food_response.dart';
import 'package:rxdart/rxdart.dart';
import 'base.dart';


class FoodBloc extends BaseBloc<FoodResponse> {
  Observable<FoodResponse> get food => fetcher.stream;

  getFood() async {

    var result = await repository.getFood();
    fetcher.sink.add(result);
  }
}