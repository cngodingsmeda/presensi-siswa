import 'package:get/get.dart';

import '../controllers/absen_harian_siswa_controller.dart';

class AbsenHarianSiswaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AbsenHarianSiswaController>(
      () => AbsenHarianSiswaController(),
    );
  }
}
