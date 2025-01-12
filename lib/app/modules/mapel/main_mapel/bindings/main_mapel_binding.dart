import 'package:get/get.dart';

import '../controllers/main_mapel_controller.dart';

class MainMapelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainMapelController>(
      () => MainMapelController(),
    );
  }
}
