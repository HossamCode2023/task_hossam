// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore, unused_element

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'check_internet.dart';



  Box? myBox;

class SettingServices extends GetxService {
Future<Box> openHiveBox(String boxName) async {
  
if (!Hive.isBoxOpen(boxName)) {
  Hive.init((await getApplicationDocumentsDirectory()).path);
  }
return await Hive.openBox(boxName);
}

//========================== Check Internet =========================================
  Future<SettingServices> init() async {
    checkInternet();

    return this;
  }
  
}
