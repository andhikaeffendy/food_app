class Meals {
  String? strMeal;
  String? strMealThumb;
  String? idMeal;

  Meals({this.strMeal, this.strMealThumb, this.idMeal});

  Meals.fromJson(Map<String, dynamic> json)
      : strMeal = json["strMeal"],
        strMealThumb = json["strMealThumb"],
        idMeal = json["idMeal"];

  Map<String, dynamic> toJson() =>
      {"strMeal": strMeal, "strMealThumb": strMealThumb, "idMeal": idMeal};
}
