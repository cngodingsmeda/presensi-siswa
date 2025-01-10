import 'package:get/get.dart';

import '../controllers/edit_profil_siswa_controller.dart';

class EditProfilSiswaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfilSiswaController>(
      () => EditProfilSiswaController(),
    );
  }
}
