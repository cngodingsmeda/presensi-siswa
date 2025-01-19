import 'package:get/get.dart';

import '../controllers/home_mapel_controller.dart';

class HomeMapelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeMapelController>(
      () => HomeMapelController(),
    );
  }
}
