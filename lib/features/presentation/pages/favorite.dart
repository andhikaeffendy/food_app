import 'package:flutter/material.dart';
import 'package:food_app/features/presentation/routes/routes.dart';
import 'package:food_app/features/presentation/widgets/beranda/beranda_controller.dart';
import 'package:food_app/features/presentation/widgets/favorite/favorite_display.dart';
import 'package:get/get.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Favorite",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 16, color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: GetBuilder<BerandaController>(
                init: BerandaController(),
                builder: (controller) => ListView.builder(
                    itemCount: controller.listFavorite.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () =>
                              Get.toNamed(Routes.detailPage, arguments: [
                                controller
                                    .listFavorite[index].strCategoryDescription,
                                controller.listFavorite[index].strCategory,
                                controller.listFavorite[index].strCategoryThumb
                              ]),
                          child:
                              FavoriteDisplay(controller.listFavorite[index]));
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
