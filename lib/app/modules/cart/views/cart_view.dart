import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:task_hossam/app/constant/colors.dart';
import 'package:task_hossam/app/constant/size.dart';

import '../../../widgets/buttom_1.dart';
import '../../../widgets/product_details.dart';
import '../controllers/cart_controller.dart';

class CartView extends StatelessWidget {
  CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    final heightScreen = MediaQuery.of(context).size.height;
// final HomeController controller = Get.put(HomeController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors().white,
        appBar: AppBar(
            elevation: 0.0,
            backgroundColor: AppColors().white,
            centerTitle: true,
            toolbarHeight: 100.0,
            title: _TitleAppBat(),
            leading: _LeadingAppBar()),
        body: Stack(
          children: [
            GetBuilder<CartController>(
              init: CartController(),
              builder: (controller) {
                return ListView.separated(
                  itemCount: controller.productsMap.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 1.0,
                  ),
                  itemBuilder: (context, index) {
                    return ProductDetailsTwo(
                      qty:controller.productsMap.values.toList()[index].toString() ,
                      productModel: controller.productsMap.keys.toList()[index],
                      visible: false,
                    );
                  },
                );
              },
            ),
            Positioned(
              child: Container(
                margin: EdgeInsets.only(top: heightScreen * 0.70),
                height: 250,
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Bottom_1Widget(
                    visible: false,
                    text: 'Confirm Order',
                    ontap: () {
                      Get.toNamed('/home');
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

class _LeadingAppBar extends StatelessWidget {
  const _LeadingAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.back();
      },
      child: Container(
        margin:
            EdgeInsets.only(left: primyDefMargin / 1.5, top: 30, bottom: 30.0),
        height: 70.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45.0),
          color: AppColors().white,
          boxShadow: [
            BoxShadow(
              color: AppColors().grey,
              spreadRadius: 3.0,
              blurRadius: 2.0,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Center(
            child: Icon(Icons.arrow_back_ios, color: AppColors().black),
          ),
        ),
      ),
    );
  }
}

class _TitleAppBat extends StatelessWidget {
  const _TitleAppBat({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartController cartCountroller = Get.put(CartController());
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Cart',
            style: TextStyle(
                color: AppColors().black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
          Container(
            height: 25.0,
            width: 25.0,
            margin: EdgeInsets.only(top: 20.0),
            decoration: BoxDecoration(
              color: AppColors().red,
              borderRadius: BorderRadius.circular(45.0),
            ),
            child: Center(
                child: Obx(
              () => Text(
                cartCountroller.productsMap.length.toString(),
                style: TextStyle(
                  color: AppColors().white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
          )
        ],
      ),
    );
  }
}
