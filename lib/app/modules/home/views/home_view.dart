// ignore_for_file: must_be_immutable, unnecessary_null_comparison


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/buttom_1.dart';
import '../../../widgets/product_details.dart';
import '../../cart/controllers/cart_controller.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final  cartController = Get.put(CartController());
    // final HomeController controller = Get.put(HomeController());
    final heightScreen = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            GetBuilder<HomeController>(
              init: HomeController(),
              builder: (controller) {
                return controller.isLoading == true
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: controller.productsCartModel!.products.length,
                        itemBuilder: (context, index) => ProductDetails(
                          
                          index: index,
                     productModel: controller.productsCartModel!.products[index],
                            visible: true,
                            imageLink:
                                controller.productsCartModel!.products[index].thumbnail,
                            details:
                                controller.productsCartModel!.products[index].category,
                            product: controller.productsCartModel!.products[index].title),
                      );
              },
            ),
            Positioned(
              child: Container(
                margin: EdgeInsets.only(top: heightScreen * 0.82),
                height: 250,
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child:  Obx(() => Bottom_1Widget(
                    basketCount:cartController.productsMap.length.toString() ,
                    visible: true,
                    text: 'basket',
                    ontap: () {
                      // controller.addProduct( Product.pro);
                      Get.toNamed('/cart');
                    },
                  ),)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
