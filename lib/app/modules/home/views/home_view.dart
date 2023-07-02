// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            GetBuilder<HomeController>(
              init: HomeController(),
              builder: (controller) {
                // ignore: unnecessary_null_comparison
                return controller.productsCart!['products'] == null? CircularProgressIndicator() :
                ListView.builder(
                  itemCount: controller.proCart!.products.length,
                  itemBuilder: (context, index) => 
                   ProductDetails(
                  visible: true,
                              imageLink: controller.proCart!.products[index].thumbnail,
                              details: controller.proCart!.products[index].category,
                              product: controller.proCart!.products[index].title
                              ),
                );
              },
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





