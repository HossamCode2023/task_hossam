import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart' hide Response;


import 'app/routes/app_pages.dart';
import 'app/services/check_internet.dart';


void main() async {
     WidgetsFlutterBinding.ensureInitialized();
  checkInternet(); 
  
 
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      
    ),
  );
}




final dio = Dio();

void getHttp() async {
  print('object=====1');
  dio.options.headers = {'x-access-token':'goldapi-jfrliiesaao-io'};
  final response = await dio.get('https://www.goldapi.io/api/XAU/EGP');
  print('object=====2');

  print(response);
}