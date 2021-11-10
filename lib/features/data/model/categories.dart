class Categories {
  String? idCategory;
  String? strCategory;
  String? strCategoryThumb;
  String? strCategoryDescription;

  Categories(
      {this.idCategory,
      this.strCategory,
      this.strCategoryDescription,
      this.strCategoryThumb});

  Categories.fromJson(Map<String, dynamic> json)
      : idCategory = json["idCategory"],
        strCategory = json["strCategory"],
        strCategoryDescription = json["strCategoryDescription"],
        strCategoryThumb = json["strCategoryThumb"];

  Map<String, dynamic> toJson() => {
        "idCategory": idCategory,
        "strCategory": strCategory,
        "strCategoryDescription": strCategoryDescription,
        "strCategoryThumb": strCategoryThumb
      };
}
