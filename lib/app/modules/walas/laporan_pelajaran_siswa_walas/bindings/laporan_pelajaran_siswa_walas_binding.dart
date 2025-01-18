import 'package:get/get.dart';

import '../controllers/laporan_pelajaran_siswa_walas_controller.dart';

class LaporanPelajaranSiswaWalasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LaporanPelajaranSiswaWalasController>(
      () => LaporanPelajaranSiswaWalasController(),
    );
  }
}
