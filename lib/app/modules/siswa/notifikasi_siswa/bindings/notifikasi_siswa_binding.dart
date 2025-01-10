import 'package:get/get.dart';

import '../controllers/notifikasi_siswa_controller.dart';

class NotifikasiSiswaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotifikasiSiswaController>(
      () => NotifikasiSiswaController(),
    );
  }
}
