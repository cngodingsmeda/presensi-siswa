import 'package:get/get.dart';

import '../controllers/profil_petugas_controller.dart';

class ProfilPetugasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfilPetugasController>(
      () => ProfilPetugasController(),
    );
  }
}
