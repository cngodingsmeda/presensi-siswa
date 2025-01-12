import 'package:get/get.dart';

import '../controllers/detil_mapel_laporan_siswa_walas_controller.dart';

class DetilMapelLaporanSiswaWalasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetilMapelLaporanSiswaWalasController>(
      () => DetilMapelLaporanSiswaWalasController(),
    );
  }
}
