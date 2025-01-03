import 'package:get/get.dart';

import '../controllers/main_siswa_controller.dart';

class MainSiswaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainSiswaController>(
      () => MainSiswaController(),
    );
  }
}
