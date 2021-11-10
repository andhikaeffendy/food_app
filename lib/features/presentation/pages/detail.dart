import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:food_app/features/data/model/meals.dart';
import 'package:food_app/features/presentation/widgets/detail_food/detail_display.dart';
import 'package:food_app/features/presentation/widgets/detail_food/detail_food_controller.dart';
import 'package:get/get.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'detail',
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Detail Category",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.network(
                        Get.arguments[2],
                        fit: BoxFit.contain,
                        height: 150,
                      ),
                    ),
                    Text(
                      Get.arguments[1],
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      Get.arguments[0],
                      textAlign: TextAlign.center,
                      style:
                          const TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Expanded(
                child: GetBuilder<DetailFoodController>(
                    init: DetailFoodController(),
                    builder: (controller) => controller.isLoading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : StaggeredGridView.countBuilder(
                            crossAxisCount: 4,
                            itemCount: controller.listMeals.length,
                            itemBuilder: (BuildContext context, int index) =>
                                DetailDisplay(Meals(
                                    idMeal: controller.listMeals[index].idMeal,
                                    strMeal:
                                        controller.listMeals[index].strMeal,
                                    strMealThumb: controller
                                        .listMeals[index].strMealThumb)),
                            staggeredTileBuilder: (int index) =>
                                StaggeredTile.count(2, index.isEven ? 2 : 2),
                            mainAxisSpacing: 4.0,
                            crossAxisSpacing: 4.0,
                          )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
