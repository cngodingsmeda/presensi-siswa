import 'package:get/get.dart';

import '../controllers/home_walas_controller.dart';

class HomeWalasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeWalasController>(
      () => HomeWalasController(),
    );
  }
}
