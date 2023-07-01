import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_hossam/app/constant/size.dart';


class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Get.offNamed('/home');
    });

    return SafeArea(
      child: Scaffold(
        
        body: Center(
          child: Text('Company Name',style: TextStyle(fontSize: splashText,fontWeight: FontWeight.w500),),
        ),
      ),
    );
  }
}