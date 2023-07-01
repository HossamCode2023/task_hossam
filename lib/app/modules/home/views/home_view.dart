// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_hossam/app/constant/colors.dart';
import '../../../widgets/buttom_1.dart';
import '../../../widgets/product_details.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
     final heightScreen = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            ProductDetails(
              visible: true,
            imageLink: 'https://i.dummyjson.com/data/products/1/3.jpg',
            details: 'test',
            product: 'Product'
            ),
            Positioned(
                child: Container(
                  margin: EdgeInsets.only(
                      top: heightScreen * 0.82),
                  height: 250,
                 
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Bottom_1Widget(
                      visible: true,
                      text: 'basket',
                      ontap: () {
                       Get.toNamed('/cart');
                      },
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}





