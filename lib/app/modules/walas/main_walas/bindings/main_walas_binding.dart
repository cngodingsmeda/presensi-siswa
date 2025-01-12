import 'package:get/get.dart';

import '../controllers/main_walas_controller.dart';

class MainWalasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainWalasController>(
      () => MainWalasController(),
    );
  }
}
