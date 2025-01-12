import 'package:get/get.dart';

import '../controllers/pilih_mapel_laporan_siswa_walas_controller.dart';

class PilihMapelLaporanSiswaWalasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PilihMapelLaporanSiswaWalasController>(
      () => PilihMapelLaporanSiswaWalasController(),
    );
  }
}
