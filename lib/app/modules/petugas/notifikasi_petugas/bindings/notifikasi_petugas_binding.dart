import 'package:get/get.dart';

import '../controllers/notifikasi_petugas_controller.dart';

class NotifikasiPetugasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotifikasiPetugasController>(
      () => NotifikasiPetugasController(),
    );
  }
}
