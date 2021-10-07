import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:fluttermeal/model/food_response.dart';

import 'endpoint.dart';
import 'environment.dart';
import "package:http/http.dart" show Client, StreamedResponse;
import "package:http/http.dart" as http;
import 'package:dio/dio.dart';



class ApiProvider {

  var dio = Dio();

  Future<FoodResponse?> getFood() async {

    final response = await dio.get(BASE_URL + CHICKEN);

    try {
      if (response.statusCode == 200) {
        print(response);
        return FoodResponse.fromJson(json.decode(response.toString()));

      } else {
        return throw Exception('Failed ');
      }
    } catch (e) {
      print(e);
      return null;
    }
  }



}