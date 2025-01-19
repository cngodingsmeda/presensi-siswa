import 'package:get/get.dart';

import '../controllers/absen_pelajaran_siswa_petugas_controller.dart';

class AbsenPelajaranSiswaPetugasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AbsenPelajaranSiswaPetugasController>(
      () => AbsenPelajaranSiswaPetugasController(),
    );
  }
}
