import 'package:get/get.dart';

import '../controllers/main_petugas_controller.dart';

class MainPetugasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainPetugasController>(
      () => MainPetugasController(),
    );
  }
}
