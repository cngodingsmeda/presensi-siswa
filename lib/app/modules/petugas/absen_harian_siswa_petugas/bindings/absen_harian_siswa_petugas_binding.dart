import 'package:get/get.dart';

import '../controllers/absen_harian_siswa_petugas_controller.dart';

class AbsenHarianSiswaPetugasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AbsenHarianSiswaPetugasController>(
      () => AbsenHarianSiswaPetugasController(),
    );
  }
}
