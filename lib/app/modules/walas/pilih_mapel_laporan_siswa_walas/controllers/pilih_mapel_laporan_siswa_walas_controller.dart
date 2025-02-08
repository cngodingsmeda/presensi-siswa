import 'package:get/get.dart';

class PilihMapelLaporanSiswaWalasController extends GetxController {
  var detilAbsen = <dynamic>[].obs;
  @override
  void onInit() {
    var arg = Get.arguments;
    detilAbsen.add(arg["keyTanggal"]);
    super.onInit();
  }

  @override
  void onClose() {
    detilAbsen.clear();
    super.onClose();
  }
}
