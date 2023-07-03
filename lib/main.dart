import 'package:flutter/material.dart';

import 'package:get/get.dart' hide Response;


import 'app/routes/app_pages.dart';
import 'app/services/initServieces.dart';


void main() async {
     WidgetsFlutterBinding.ensureInitialized();
    await initialServices();
 
  
 
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      
    ),
  );
}




