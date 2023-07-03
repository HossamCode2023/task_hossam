// ignore_for_file: avoid_print, unused_import

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

checkInternet() async {
  try {
    var result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print('=============== Check Internet $result==========================');

      return true;
    }
  } on SocketException catch (e) {
    print('=============== Check Internet $e==========================');

    return AlertDialog(
      title: Text('Error'),
      content: Text('No connection with internet '),

    );
  }
}
