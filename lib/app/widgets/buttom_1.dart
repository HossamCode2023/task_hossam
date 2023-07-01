// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../constant/colors.dart';

class Bottom_1Widget extends StatelessWidget {
  final text;
  final bool visible;
  Function() ontap;
  Bottom_1Widget({
   
    required this.text,
    required this.ontap, required this.visible,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: InkWell(
            onTap: ontap,
            child: Container(
              // margin: EdgeInsets.symmetric(horizontal: 20.0),
              height: 85,
              // width: 318,
              decoration: BoxDecoration(
                  color: AppColors().red,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                    text,
                    style: TextStyle(
                        color: AppColors().white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                       ),
                  ),
                  SizedBox(width: 20.0,),
                 visible == true ? Container(
              height: 35.0,
              width: 35.0,
              decoration: BoxDecoration(
                color: AppColors().white,
                
                borderRadius: BorderRadius.circular(45.0),
              ),
              child: Center(child:  Text('3',style: TextStyle(
                        color: AppColors().red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                       ),),),
              ):Text(''),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}