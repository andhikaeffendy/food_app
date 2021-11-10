// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:food_app/features/data/model/categories.dart';
import 'package:food_app/features/presentation/widgets/beranda/beranda_controller.dart';
import 'package:get/get.dart';

class FavoriteDisplay extends StatelessWidget {
  Categories categories = Categories();
  FavoriteDisplay(this.categories, {Key? key}) : super(key: key);

  var getC = Get.find<BerandaController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Colors.yellow[800]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(1000)),
            child: Image.network(
              categories.strCategoryThumb!,
              fit: BoxFit.contain,
              height: 80,
              width: 80,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  categories.strCategory!,
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  categories.strCategoryDescription!,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                  ),
                  child: InkWell(
                    onTap: () => getC.removeFavorite(categories),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.remove_circle,
                          size: 15,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "Remove to favorite",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios_outlined,
            size: 30,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
