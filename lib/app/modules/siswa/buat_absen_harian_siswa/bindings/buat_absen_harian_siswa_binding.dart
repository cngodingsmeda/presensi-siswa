import 'package:get/get.dart';

import '../controllers/buat_absen_harian_siswa_controller.dart';

class BuatAbsenHarianSiswaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BuatAbsenHarianSiswaController>(
      () => BuatAbsenHarianSiswaController(),
    );
  }
}
