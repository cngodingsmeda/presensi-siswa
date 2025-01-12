import 'package:get/get.dart';

import '../controllers/absen_harian_siswa_walas_controller.dart';

class AbsenHarianSiswaWalasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AbsenHarianSiswaWalasController>(
      () => AbsenHarianSiswaWalasController(),
    );
  }
}
