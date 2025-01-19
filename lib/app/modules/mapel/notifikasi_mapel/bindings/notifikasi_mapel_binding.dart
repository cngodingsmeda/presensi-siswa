import 'package:get/get.dart';

import '../controllers/notifikasi_mapel_controller.dart';

class NotifikasiMapelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotifikasiMapelController>(
      () => NotifikasiMapelController(),
    );
  }
}
