import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../constant/api_links.dart';
import '../../../constant/headers.dart';
import '../../../data/models/products_cart_model.dart';
import '../../../data/remote/product_remote.dart';
import '../../../services/failures.dart';
import '../../../services/logger.dart';
import '../../../services/network.dart';

class HomeController extends GetxController {

 final NetworkManager _networkManager = NetworkManager(Dio());
  final _log = logger(ProductRemoteDataSource);




ProductsCartModel? proCart;
 Map? productsCart = {};

   Future<Either<Failures, Map>> getProduct(
    Map<String, dynamic> data
    ) async {
    try {
      final response = await _networkManager.request(RequestMethod.get,ApiEndPoints.baseUrl + ApiEndPoints.endpoints,
       data: data,
        headers: AppHeaders.headers);
      _log.i(response.data);
      productsCart = response.data ;
     update();
    
      print('=====================$productsCart');
    
     proCart = ProductsCartModel.fromJson(response.data);
     update();
      print('======================${proCart!.products.length}');
      return Right(productsCart!);
    } catch (e) {
      return Left(SomthingWrongFailures());
    }
    
  }







  final count = 0.obs;
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

  void increment() => count.value++;
}
