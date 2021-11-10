// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:food_app/features/data/model/categories.dart';

class ApiCategories {
  List<Categories>? categories;

  ApiCategories({this.categories});

  ApiCategories.fromJson(Map<String, dynamic> json)
      : categories = json.containsKey("categories")
            ? List<Categories>.from(
                json["categories"].map((x) => Categories.fromJson(x)))
            : null;

  ApiCategories.fromStringJson(String stringJson)
      : this.fromJson(json.decode(stringJson));

  Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories!.map((x) => x.toJson())),
      };

  String toStringJson() => json.encode(toJson());

  static Future<ApiCategories> futureApiCategories() async {
    var dio = Dio();
    String url = "https://www.themealdb.com/api/json/v1/1/categories.php";
    try {
      Response response = await dio.get(url);
      print(response.data);
      return ApiCategories.fromStringJson(response.toString());
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.error);
        return ApiCategories();
      } else {
        print(e.error);
        return ApiCategories();
      }
    }
  }
}
