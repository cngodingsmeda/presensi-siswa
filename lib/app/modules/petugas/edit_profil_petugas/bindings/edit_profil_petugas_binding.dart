import 'package:get/get.dart';

import '../controllers/edit_profil_petugas_controller.dart';

class EditProfilPetugasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfilPetugasController>(
      () => EditProfilPetugasController(),
    );
  }
}
