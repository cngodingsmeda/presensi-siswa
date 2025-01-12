import 'package:get/get.dart';

import '../controllers/laporan_walas_controller.dart';

class LaporanWalasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LaporanWalasController>(
      () => LaporanWalasController(),
    );
  }
}
