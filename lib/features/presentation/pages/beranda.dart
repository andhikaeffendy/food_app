import 'package:flutter/material.dart';
import 'package:food_app/features/data/model/categories.dart';
import 'package:food_app/features/presentation/routes/routes.dart';
import 'package:food_app/features/presentation/widgets/beranda/beranda_controller.dart';
import 'package:food_app/features/presentation/widgets/widget.dart';
import 'package:get/get.dart';

class BerandaPage extends StatefulWidget {
  const BerandaPage({Key? key}) : super(key: key);

  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "FoodApps",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 16, color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () => Get.toNamed(Routes.favoritePage),
            child: Container(
              padding: const EdgeInsets.only(right: 16),
              child: const Icon(
                Icons.favorite_border_outlined,
                color: Colors.red,
                size: 25,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: GetBuilder<BerandaController>(
                init: BerandaController(),
                builder: (controller) => controller.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: controller.listCategories.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () =>
                                Get.toNamed(Routes.detailPage, arguments: [
                              controller
                                  .listCategories[index].strCategoryDescription,
                              controller.listCategories[index].strCategory,
                              controller.listCategories[index].strCategoryThumb
                            ]),
                            child: BerandaDisplay(
                                controller.listCategories[index]),
                          );
                        }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
