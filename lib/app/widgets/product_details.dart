import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constant/colors.dart';
import '../constant/size.dart';

class ProductDetails extends StatelessWidget {
  final String imageLink;
  final String product;
  final String details;
  final bool visible;
  const ProductDetails({
    Key? key,
    required this.imageLink,
    required this.product,
    required this.details, required this.visible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            margin: EdgeInsets.symmetric(vertical: primyDefMargin / 2),
            padding: EdgeInsets.only(right: primyDefMargin / 2),
            width: (widthScreen / 3) - primyDefMargin - 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                visible == true? Icon(
                  Icons.favorite,
                  color: AppColors().red,
                  size: 40.0,
                ):Text(''),
                countCart(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class countCart extends StatelessWidget {
  const countCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                onPressed: () {},
                icon: FaIcon(
                  FontAwesomeIcons.plus,
                  color: AppColors().black,
                  size: 15,
                ),
              )),
          //================ Counter ===============================
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              '1',
              style: TextStyle(
                color: AppColors().black,
                fontWeight: FontWeight.w500,
                fontSize: 25.0,
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
                onPressed: () {},
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
