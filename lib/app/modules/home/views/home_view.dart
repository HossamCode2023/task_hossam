// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/products_cart_model.dart';
import '../../../services/settingServices.dart';
import '../../../widgets/buttom_1.dart';
import '../../../widgets/product_details.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    final heightScreen = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            GetBuilder<HomeController>(
              init: HomeController(),
              builder: (controller) {
                // ignore: unnecessary_null_comparison
                return controller.isLoading == true
                    ? CircularProgressIndicator()
                    : ListView.builder(
                        itemCount: controller.proCart!.products.length,
                        itemBuilder: (context, index) => ProductDetails(
                          productsCartModel: controller.proCart!,
                            visible: true,
                            imageLink:
                                controller.proCart!.products[index].thumbnail,
                            details:
                                controller.proCart!.products[index].category,
                            product: controller.proCart!.products[index].title),
                      );
              },
            ),
            Positioned(
              child: Container(
                margin: EdgeInsets.only(top: heightScreen * 0.82),
                height: 250,
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child:  Bottom_1Widget(
                    basketCount:myBox!.get('counter') ,
                    visible: true,
                    text: 'basket',
                    ontap: () {
                      // controller.addProduct( Product.pro);
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
