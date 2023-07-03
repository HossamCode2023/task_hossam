
//============= Services =================
import 'package:get/get.dart';

import 'settingServices.dart';

Future initialServices() async {
  //===================== Init check internet ===============
  await Get.putAsync(() => SettingServices().init());
  //==================== open Hive Box ======================
  await Get.putAsync(
    () => SettingServices().openHiveBox('task'));
  myBox = await SettingServices().openHiveBox('task');
  //===================== Init check internet ===============

}

