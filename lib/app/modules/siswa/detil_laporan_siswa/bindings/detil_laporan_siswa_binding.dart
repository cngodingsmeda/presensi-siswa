import 'package:get/get.dart';

import '../controllers/detil_laporan_siswa_controller.dart';

class DetilLaporanSiswaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetilLaporanSiswaController>(
      () => DetilLaporanSiswaController(),
    );
  }
}
