import 'package:get/get.dart';

import '../controllers/profil_siswa_controller.dart';

class ProfilSiswaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfilSiswaController>(
      () => ProfilSiswaController(),
    );
  }
}
