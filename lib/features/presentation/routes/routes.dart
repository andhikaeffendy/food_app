import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/features/data/model/categories.dart';
import 'package:food_app/features/presentation/pages/beranda.dart';
import 'package:food_app/features/presentation/pages/detail.dart';
import 'package:food_app/features/presentation/pages/favorite.dart';
import 'package:get/route_manager.dart';

class Routes {
  static const String berandaPage = "/";
  static const String detailPage = "/detailPage";
  static const String favoritePage = "/favoritePage";

  static final routes = [
    GetPage(name: berandaPage, page: () => BerandaPage()),
    GetPage(name: detailPage, page: () => DetailPage()),
    GetPage(name: favoritePage, page: () => FavoritePage()),
  ];
}
