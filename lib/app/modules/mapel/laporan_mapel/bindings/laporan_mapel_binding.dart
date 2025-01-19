import 'package:get/get.dart';

import '../controllers/laporan_mapel_controller.dart';

class LaporanMapelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LaporanMapelController>(
      () => LaporanMapelController(),
    );
  }
}
