import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:task_hossam/app/services/settingServices.dart';

import '../../../constant/api_links.dart';
import '../../../constant/colors.dart';
import '../../../constant/headers.dart';
import '../../../data/models/products_cart_model.dart';
import '../../../data/remote/product_remote.dart';
import '../../../services/failures.dart';
import '../../../services/logger.dart';
import '../../../services/network.dart';

class HomeController extends GetxController {
  final NetworkManager _networkManager = NetworkManager(Dio());
  final _log = logger(ProductRemoteDataSource);

  bool isLoading = true;
  var isPressed1 = false.obs;

  ProductsCartModel? proCart;
// Product? product;
  // ProductItemCartList? productList = [].obs as ProductItemCartList?;

  // void addListCart(int index) async {
  //   productList!.title = proCart!.products[index].title;
  //     // product!.add(myData);
  //     update();
  //   }
  

  Future<Object> getProduct(Map<String, dynamic> data) async {
    try {
      final response = await _networkManager.request(
          RequestMethod.get, ApiEndPoints.baseUrl + ApiEndPoints.endpoints,
          data: data, headers: AppHeaders.headers);
      _log.i(response.data);
      isLoading = false;
      update();
      proCart = ProductsCartModel.fromJson(response.data);

      update();

      print('======================${proCart!.products.length}');
      return Right(response.data!);
    } catch (e) {
      return Left(SomthingWrongFailures());
    }
  }

  var counter = 0.obs;
  @override
  void onInit() {
    getProduct({});
    update();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() {
    counter.value++;
    if (counter >= 1) {
      Get.snackbar('Product Added', 'You have added $counter Products',
       duration: Duration(seconds: 3),
       snackPosition: SnackPosition.TOP,
      icon: FaIcon(
                  FontAwesomeIcons.cartArrowDown,
                  color: AppColors().black,
                  size: 15,
                ),
      );
    }
    update();
    myBox!.put('counter' , counter.toString());
    print('=================counter =========$counter');
    print('=================myBox =========${myBox!.get('counter')}');

  }

  void descrement() {
    if (counter.value > 0) {
      counter.value--;
      myBox!.put('counter' , counter.toString());
    print('=================counter =========$counter');
    print('=================myBox =========${myBox!.get('counter')}');
      update();
    }else if(counter == 0){
       Get.snackbar('Alert', 'You have not Products',
       duration: Duration(seconds: 3),
       snackPosition: SnackPosition.TOP,
      icon: FaIcon(
                  FontAwesomeIcons.box,
                  color: AppColors().black,
                  size: 15,
                ),
      );
    }
  }

// ====== dictionary for add product
  List _cartItems = [].obs;

  get shopeItems => shopeItems;
  get cartItems => cartItems;

  void addItemsToCart(int index) {
    cartItems.add(shopeItems[index]);
update();
}

 void removeItemsToCart(int index) {
    cartItems.removeAt(index);
update();
}

}
