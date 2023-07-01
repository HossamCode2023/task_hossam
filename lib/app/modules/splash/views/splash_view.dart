import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_hossam/app/constant/colors.dart';


class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Get.offNamed('/home');
    });

    return Scaffold(
      backgroundColor: AppColor().secondYellowColor ,
      body: Center(
        child: Text('Company Name',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.w500),),
      ),
    );
  }
}