// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:food_app/features/data/model/meals.dart';

class ApiMeals {
  List<Meals>? meals;

  ApiMeals({this.meals});

  ApiMeals.fromJson(Map<String, dynamic> json)
      : meals = json.containsKey("meals")
            ? List<Meals>.from(json["meals"].map((x) => Meals.fromJson(x)))
            : null;

  ApiMeals.fromStringJson(String stringJson)
      : this.fromJson(json.decode(stringJson));

  Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(meals!.map((x) => x.toJson())),
      };

  String toStringJson() => json.encode(toJson());

  static Future<ApiMeals> futureApiMeals(String category) async {
    var dio = Dio();
    String url = "https://www.themealdb.com/api/json/v1/1/filter.php";
    try {
      Response response = await dio.get(url, queryParameters: {"c": category});
      print(response.data);
      return ApiMeals.fromStringJson(response.toString());
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.error);
        return ApiMeals();
      } else {
        print(e.error);
        return ApiMeals();
      }
    }
  }
}
