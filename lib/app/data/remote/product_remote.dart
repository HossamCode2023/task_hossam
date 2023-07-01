import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';


import '../../constant/api_links.dart';
import '../../constant/headers.dart';
import '../../services/failures.dart';
import '../../services/logger.dart';
import '../../services/network.dart';
import '../models/products_cart_model.dart';

class ProductRemoteDataSource {
  final NetworkManager _networkManager = NetworkManager(Dio());
  final _log = logger(ProductRemoteDataSource);






   Future<Either<Failures, ProductsCart>> getProduct(Map<String, dynamic> data) async {
    try {
      final response = await _networkManager.request(RequestMethod.get, ApiEndPoints.baseUrl + ApiEndPoints.endpoints.products, data: data, headers: AppHeaders.headers);
      _log.i(response.data);
      ProductsCart productModel = ProductsCart.fromJson(response.data['data']);
      return Right(productModel);
    } catch (e) {
      return Left(SomthingWrongFailures());
    }
  }

  // Future<Either<Failures, FoodModel>> addFood(Map<String, dynamic> data) async {
  //   try {
  //     final response = await _networkManager.request(RequestMethod.post, ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.login_admin, data: data, headers: AppHeaders.headers);
  //     _log.i(response.data);
  //     FoodModel foodModel = FoodModel.fromJson(response.data['data']);
  //     return Right(foodModel);
  //   } catch (e) {
  //     return Left(SomthingWrongFailures());
  //   }
  // }

  // Future<Either<Failures, List<FoodModel>>> allFood() async {
  //   try {
  //     final response = await _networkManager.request(RequestMethod.post, ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.login_admin, headers: AppHeaders.headers);
  //     _log.i(response.data);
  //     List<FoodModel> data = List.from(response.data.map((e) => FoodModel.fromJson(e)));
  //     return Right(data);
  //   } catch (e) {
  //     return Left(SomthingWrongFailures());
  //   }
  // }

  // Future<Either<Failures, List<FoodModel>>> updataFood(int id) async {
  //   try {
  //     final response = await _networkManager.request(RequestMethod.put, ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.login_admin, headers: AppHeaders.headers);
  //     _log.i(response.data);
  //     List<FoodModel> data = List.from(response.data.map((e) => FoodModel.fromJson(e)));
  //     return Right(data);
  //   } catch (e) {
  //     return Left(SomthingWrongFailures());
  //   }
  // }

  // Future<Either<Failures, Unit>> deleteFood(int id) async {
  //   try {
  //     final response = await _networkManager.request(RequestMethod.put, ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.login_admin, headers: AppHeaders.headers);
  //     _log.i(response.data);
  //     return const Right(unit);
  //   } catch (e) {
  //     return Left(SomthingWrongFailures());
  //   }
  // }

  // Future<Either<Failures, FoodModel>> employeeById(Map<String, dynamic> data) async {
  //   try {
  //     final response = await _networkManager.request(RequestMethod.post, ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.f, data: data, headers: AppHeaders.headers);
  //     _log.i(response.data);
  //     FoodModel foodModel = FoodModel.fromJson(response.data);
  //     return Right(foodModel);
  //   } catch (e) {
  //     return Left(SomthingWrongFailures());
  //   }
  // }
}
