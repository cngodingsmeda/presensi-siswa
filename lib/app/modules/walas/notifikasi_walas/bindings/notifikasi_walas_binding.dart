import 'package:get/get.dart';

import '../controllers/notifikasi_walas_controller.dart';

class NotifikasiWalasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotifikasiWalasController>(
      () => NotifikasiWalasController(),
    );
  }
}
