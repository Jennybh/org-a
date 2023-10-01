// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:organo/controllers/popular_product_controller.dart';
import 'package:organo/controllers/recommended_product_controller.dart';
import 'package:organo/data/api/api_client.dart';
import 'package:organo/data/api/repository/popular_product_repo.dart';
import 'package:organo/data/api/repository/recommended_product_repo.dart';
import 'package:organo/utlis/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/cart_controller.dart';
import '../data/api/repository/cart_repo.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);
  //api client
  Get.lazyPut(() => ApiClient(appBasedUrl: AppConstants.BASE_URL));
  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));
  //controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
