import 'package:get/get.dart';

import '../controllers/detil_laporan_pelajaran_walas_controller.dart';

class DetilLaporanPelajaranWalasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetilLaporanPelajaranWalasController>(
      () => DetilLaporanPelajaranWalasController(),
    );
  }
}
