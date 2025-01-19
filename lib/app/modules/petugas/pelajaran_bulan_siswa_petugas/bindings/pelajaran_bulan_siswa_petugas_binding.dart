import 'package:get/get.dart';

import '../controllers/pelajaran_bulan_siswa_petugas_controller.dart';

class PelajaranBulanSiswaPetugasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PelajaranBulanSiswaPetugasController>(
      () => PelajaranBulanSiswaPetugasController(),
    );
  }
}
