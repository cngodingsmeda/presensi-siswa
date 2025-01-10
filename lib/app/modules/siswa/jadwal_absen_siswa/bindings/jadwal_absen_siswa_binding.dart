import 'package:get/get.dart';

import '../controllers/jadwal_absen_siswa_controller.dart';

class JadwalAbsenSiswaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JadwalAbsenSiswaController>(
      () => JadwalAbsenSiswaController(),
    );
  }
}
