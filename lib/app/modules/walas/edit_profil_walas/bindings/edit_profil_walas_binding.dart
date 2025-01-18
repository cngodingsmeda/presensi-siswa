import 'package:get/get.dart';

import '../controllers/edit_profil_walas_controller.dart';

class EditProfilWalasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfilWalasController>(
      () => EditProfilWalasController(),
    );
  }
}
