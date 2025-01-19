import 'package:get/get.dart';

import '../controllers/laporan_petugas_controller.dart';

class LaporanPetugasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LaporanPetugasController>(
      () => LaporanPetugasController(),
    );
  }
}
