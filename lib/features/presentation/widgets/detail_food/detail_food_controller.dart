import 'package:food_app/features/data/api/api_meals.dart';
import 'package:food_app/features/data/model/categories.dart';
import 'package:food_app/features/data/model/meals.dart';
import 'package:food_app/features/presentation/widgets/beranda/beranda_controller.dart';
import 'package:get/get.dart';

class DetailFoodController extends GetxController {
  List<Meals> listMeals = [];
  var getC = Get.put(BerandaController());
  var isLoading = true;
  Categories category = Categories();

  Future loadDataDetail() async {
    await ApiMeals.futureApiMeals(Get.arguments[1]).then((value) {
      isLoading = false;
      listMeals = value.meals!;
    });
    update();
  }

  @override
  void onInit() {
    super.onInit();
    loadDataDetail();
  }
}
