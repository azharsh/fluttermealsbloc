import 'dart:convert';

FoodResponse foodResponseFromJson(String str) =>
    FoodResponse.fromJson(json.decode(str));

String foodResponseToJson(FoodResponse data) => json.encode(data.toJson());

class FoodResponse {
  FoodResponse({required this.meals});

  List<Meals> meals;

  factory FoodResponse.fromJson(Map<String, dynamic> json) => FoodResponse(
        meals: List<Meals>.from(json["meals"].map((x) => Meals.fromJson(x))),
      );

  Map<String, dynamic> toJson() =>
      {"meals": List<dynamic>.from(meals.map((x) => x.toJson()))};
}

class Meals {
  Meals(
      {required this.idMeal,
      required this.strMeal,
      required this.strDrinkAlternate,
      required this.strCategory,
      required this.strArea,
      required this.strInstructions,
      required this.strMealThumb,
      required this.strTags,
      required this.strYoutube,
      required this.strSource,
      required this.strImageSource,
      required this.strCreativeCommonsConfirmed,
      required this.dateModified});

  String idMeal;
  String strMeal;
  String strDrinkAlternate;
  String strCategory;
  String strArea;
  String strInstructions;
  String strMealThumb;
  String strTags;
  String strYoutube;
  String strSource;
  String strImageSource;
  String strCreativeCommonsConfirmed;
  String dateModified;

  factory Meals.fromJson(Map<String, dynamic> json) => Meals(
      idMeal: json['idMeal'],
      strMeal: json['strMeal'],
      strDrinkAlternate: json['strDrinkAlternate'],
      strCategory: json['strCategory'],
      strArea: json['strArea'],
      strInstructions: json['strInstructions'],
      strMealThumb: json['strMealThumb'],
      strTags: json['strTags'],
      strYoutube: json['strYoutube'],
      strSource: json['strSource'],
      strImageSource: json['strImageSource'],
      strCreativeCommonsConfirmed: json['strCreativeCommonsConfirmed'],
      dateModified: json['dateModified']
  );

  Map<String, dynamic> toJson() => {
    "idMeal" : idMeal,
    "strMeal" : strMeal,
    "strDrinkAlternate": strDrinkAlternate,
    "strCategory": strCategory,
    "strArea": strArea,
    "strInstructions": strInstructions,
    "strMealThumb": strMealThumb,
    "strTags": strTags,
    "strYoutube": strYoutube,
    "strSource": strSource,
    "strImageSource": strImageSource,
    "strCreativeCommonsConfirmed": strCreativeCommonsConfirmed,
    "dateModified": dateModified
  };
}
