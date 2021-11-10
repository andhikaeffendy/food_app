// ignore_for_file: avoid_print

import 'package:food_app/features/data/api/api_categories.dart';
import 'package:food_app/features/data/model/categories.dart';
import 'package:get/get.dart';

class BerandaController extends GetxController {
  List<Categories> listCategories = [];
  List<Categories> listFavorite = [];
  var isLoading = true;

  @override
  void onInit() {
    super.onInit();
    loadApiCategories();
  }

  void removeFavorite(Categories categories) {
    listFavorite.removeWhere(
        (element) => element.strCategory == categories.strCategory);
    Get.defaultDialog(
        title: "Berhasil Dihapus",
        middleText: "Data ${categories.strCategory} sudah dihapus");
    update();
  }

  void addFavorite(Categories categories) {
    if (listFavorite.isNotEmpty) {
      if (!listFavorite.contains(categories)) {
        listFavorite.add(categories);
        Get.defaultDialog(
            title: "Berhasil Menambah",
            middleText: "${categories.strCategory}");
      } else {
        Get.defaultDialog(
            title: "Gagal Menambah",
            middleText: "Data ${categories.strCategory} sudah ada");
      }
    } else {
      listFavorite.add(categories);
      Get.defaultDialog(
          title: "Berhasil Menambah", middleText: "${categories.strCategory}");
    }
    update();
  }

  Future loadApiCategories() async {
    await ApiCategories.futureApiCategories().then((value) {
      isLoading = false;
      listCategories = value.categories ?? [];
    });
    update();
  }
}
