import 'package:get/get.dart';

import '../controllers/laporan_siswa_controller.dart';

class LaporanSiswaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LaporanSiswaController>(
      () => LaporanSiswaController(),
    );
  }
}
