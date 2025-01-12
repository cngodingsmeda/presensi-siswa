import 'package:get/get.dart';

import '../controllers/profil_walas_controller.dart';

class ProfilWalasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfilWalasController>(
      () => ProfilWalasController(),
    );
  }
}
