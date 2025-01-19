import 'package:get/get.dart';

import '../controllers/absen_kelas_harian_petugas_controller.dart';

class AbsenKelasHarianPetugasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AbsenKelasHarianPetugasController>(
      () => AbsenKelasHarianPetugasController(),
    );
  }
}
