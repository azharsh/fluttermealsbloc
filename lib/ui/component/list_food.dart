import 'package:flutter/material.dart';
import 'package:fluttermeal/bloc/food_bloc.dart';
import 'package:fluttermeal/model/food_response.dart';
import 'package:provider/provider.dart';

import '../detail_activity.dart';

class ListFood extends StatefulWidget {
  const ListFood({Key? key}) : super(key: key);

  @override
  _ListFoodState createState() => _ListFoodState();
}

class _ListFoodState extends State<ListFood> {
  final foodBloc = FoodBloc();

  var listFood = <Meals>[];

  @override
  void initState() {
    super.initState();
    foodBloc.getFood();

    _foodStream();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(listFood.length, (index) {
          var item = listFood[index];
          return Container(
              height: double.infinity,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailActivity(
                        title: item.strMeal,
                        desc: item.strInstructions,
                        img: item.strMealThumb,
                        id: item.idMeal
                      ),
                    ),
                  );
                },
                child: Column(
                  children: [
                    Image.network(
                      item.strMealThumb,
                      height: 145,
                    ),
                    Text(item.strMeal)
                  ],
                ),
              ));
        }),
      ),
    );
  }

  void _foodStream() {
    foodBloc.food.listen((value) {
      setState(() {
        print(value);
        listFood = value.meals;
      });
    });
  }
}
