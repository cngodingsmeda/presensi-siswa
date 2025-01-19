import 'package:get/get.dart';

import '../controllers/absen_bulanan_siswa_petugas_controller.dart';

class AbsenBulananSiswaPetugasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AbsenBulananSiswaPetugasController>(
      () => AbsenBulananSiswaPetugasController(),
    );
  }
}
