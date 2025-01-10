import 'package:get/get.dart';

import '../controllers/home_siswa_controller.dart';

class HomeSiswaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeSiswaController>(
      () => HomeSiswaController(),
    );
  }
}
