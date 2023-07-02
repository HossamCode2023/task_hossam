import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;


  static init()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://dummyjson.com/',
        receiveDataWhenStatusError: true,
      )
    );
  }



 static Future<Response> getData(String url) async
  {
  
print('test');
return await dio!.get(url);

  }
}