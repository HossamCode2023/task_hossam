import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:task_hossam/app/modules/cart/controllers/cart_controller.dart';
import 'package:task_hossam/app/modules/home/controllers/home_controller.dart';

import '../constant/colors.dart';
import '../constant/size.dart';
import '../data/models/products_cart_model.dart';

class ProductDetails extends StatelessWidget {
  final String imageLink;
  final String product;
  final String details;
  final bool visible;
   final Product productModel;
  final int index;
   ProductDetails({
    Key? key,
    required this.imageLink,
    required this.product,
    required this.details,
    required this.visible,
     required this.productModel, required this.index, 
    
 
  }) : super(key: key);
  var isPressed = false.obs;

  @override
  Widget build(BuildContext context) {
    final  controller = Get.find<HomeController>();
    final widthScreen = MediaQuery.of(context).size.width;
    return Obx(() => Container(
      margin: EdgeInsets.all(primyDefMargin),
      height: 180.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: AppColors().white,
        boxShadow: [
          BoxShadow(
            color: AppColors().grey,
            spreadRadius: 3.0,
            blurRadius: 2.0,
            offset: Offset.zero,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: primyDefMargin),
            width: (widthScreen / 3) - primyDefMargin,
            height: 170.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imageLink), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: primyDefMargin / 2),
            width: (widthScreen / 3) - primyDefMargin - 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  product,
                  style: TextStyle(
                      fontSize: productTitleText, fontWeight: FontWeight.bold),
                ),
                Text(
                  details,
                  style: TextStyle(fontSize: productDetailText),
                ),
              ],
            ),
          ),
          Container(
            height: 180.0,
            margin: EdgeInsets.symmetric(vertical: primyDefMargin / 2),
            padding: EdgeInsets.only(right: primyDefMargin / 2),
            width: (widthScreen / 3) - primyDefMargin,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                visible == true
                    ? InkWell(
                        onTap: () {
                          isPressed.value = !isPressed.value;
                        },
                        child: Icon(
                              Icons.favorite,
                              color: isPressed.value
                                  ? Colors.red
                                  : Colors.grey,
                              size: 45.0,
                            ),
                      )
                    : Text(''),
                countCart(
          productModel: productModel,
          index: index,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    );
  }
}

class countCart extends StatelessWidget {
  final Product productModel;
  final int index;
  // finl int 
  
  countCart({
    Key? key,
 required this.productModel, required this.index, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final  controller = Get.put(HomeController());
    final  cartController = Get.put(CartController());

    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(45.0),
        color: AppColors().white,
        boxShadow: [
          BoxShadow(
            color: AppColors().grey,
            spreadRadius: 1.0,
            blurRadius: 1.0,
            offset: Offset.zero,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //========================[+]=======================
          Container(
              height: 35.0,
              width: 35.0,
              decoration: BoxDecoration(
                color: AppColors().red,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[300]!,
                    spreadRadius: 1.0,
                    blurRadius: 1.0,
                    offset: Offset(0, 1),
                  ),
                ],
                borderRadius: BorderRadius.circular(45.0),
              ),
              child: IconButton(
                onPressed: () {
                  controller.increment();
                  cartController.addProductToCart(productModel );
                 cartController.update();
                  controller.update();

                // controller.addQty(index);
                },
                icon: FaIcon(
                  FontAwesomeIcons.plus,
                  color: AppColors().black,
                  size: 15,
                ),
              ),
              ),
          //================ Counter ===============================
          Padding(
            padding: const EdgeInsets.all(5.0),
            child:Obx(() => Text(
                controller.counter.string,
                style: TextStyle(
                  color: AppColors().black,
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                ),
              ),)
          ),
          //========================== [-]=========================

          Container(
              height: 35.0,
              width: 35.0,
              decoration: BoxDecoration(
                color: AppColors().red,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[300]!,
                    spreadRadius: 1.0,
                    blurRadius: 1.0,
                    offset: Offset(0, 1),
                  ),
                ],
                borderRadius: BorderRadius.circular(45.0),
              ),
              child: IconButton(
                onPressed: () {
                  controller.descrement();
                  cartController.removeProductsFromCart(productModel);
                  cartController.update();
                  controller.update();
                },
                icon: FaIcon(
                  FontAwesomeIcons.minus,
                  color: AppColors().black,
                  size: 15,
                ),
              )),
        ],
      ),
    );
  }
}

class ProductDetailsTwo extends StatelessWidget {
 
  final bool visible;
   final Product productModel;
  
   ProductDetailsTwo({
    Key? key,
   
    required this.visible,
     required this.productModel, 
    
 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final  controller = Get.find<HomeController>();
    final widthScreen = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(primyDefMargin),
      height: 180.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: AppColors().white,
        boxShadow: [
          BoxShadow(
            color: AppColors().grey,
            spreadRadius: 3.0,
            blurRadius: 2.0,
            offset: Offset.zero,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: primyDefMargin),
            width: (widthScreen / 3) - primyDefMargin,
            height: 170.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(productModel.thumbnail), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: primyDefMargin / 2),
            width: (widthScreen / 3) - primyDefMargin - 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  productModel.title,
                  style: TextStyle(
                      fontSize: productTitleText, fontWeight: FontWeight.bold),
                ),
                Text(
                  productModel.category,
                  style: TextStyle(fontSize: productDetailText),
                ),
              ],
            ),
          ),
          Container(
            height: 180.0,
            margin: EdgeInsets.symmetric(vertical: primyDefMargin / 2),
            padding: EdgeInsets.only(right: primyDefMargin / 2),
            width: (widthScreen / 3) - primyDefMargin,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                visible == true
                    ? InkWell(
                        onTap: () {
                          controller.isPressed1.value =
                              !controller.isPressed1.value;
                        },
                        child: Icon(
                              Icons.favorite,
                              color: controller.isPressed1.value
                                  ? Colors.red
                                  : Colors.grey,
                              size: 45.0,
                            ),
                      )
                    : Text(''),
                countCartTwo(
          productModel: productModel,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class countCartTwo extends StatelessWidget {
  final Product productModel;
  // finl int 
  
  countCartTwo({
    Key? key,
 required this.productModel, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final  controller = Get.find<HomeController>();
    final  cartController = Get.put(CartController());

    return Obx(() => Container(
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(45.0),
        color: AppColors().white,
        boxShadow: [
          BoxShadow(
            color: AppColors().grey,
            spreadRadius: 1.0,
            blurRadius: 1.0,
            offset: Offset.zero,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //========================[+]=======================
          Container(
              height: 35.0,
              width: 35.0,
              decoration: BoxDecoration(
                color: AppColors().red,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[300]!,
                    spreadRadius: 1.0,
                    blurRadius: 1.0,
                    offset: Offset(0, 1),
                  ),
                ],
                borderRadius: BorderRadius.circular(45.0),
              ),
              child: IconButton(
                onPressed: () {
                  controller.increment();
                  cartController.addProductToCart(productModel );
                cartController.update();
                  controller.update();
                },
                icon: FaIcon(
                  FontAwesomeIcons.plus,
                  color: AppColors().black,
                  size: 15,
                ),
              ),
              ),
          //================ Counter ===============================
          Padding(
            padding: const EdgeInsets.all(5.0),
            child:Text(
                controller.counter.string,
                style: TextStyle(
                  color: AppColors().black,
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                ),
              ),
          ),
          //========================== [-]=========================

          Container(
              height: 35.0,
              width: 35.0,
              decoration: BoxDecoration(
                color: AppColors().red,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[300]!,
                    spreadRadius: 1.0,
                    blurRadius: 1.0,
                    offset: Offset(0, 1),
                  ),
                ],
                borderRadius: BorderRadius.circular(45.0),
              ),
              child: IconButton(
                onPressed: () {
                  controller.descrement();
                  cartController.removeProductsFromCart(productModel);
                  cartController.update();
                  controller.update();
                },
                icon: FaIcon(
                  FontAwesomeIcons.minus,
                  color: AppColors().black,
                  size: 15,
                ),
              )),
        ],
      ),
    ),
    );
  }
}
