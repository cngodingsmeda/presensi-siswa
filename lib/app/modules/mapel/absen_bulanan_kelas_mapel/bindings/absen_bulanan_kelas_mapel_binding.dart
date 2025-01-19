import 'package:get/get.dart';

import '../controllers/absen_bulanan_kelas_mapel_controller.dart';

class AbsenBulananKelasMapelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AbsenBulananKelasMapelController>(
      () => AbsenBulananKelasMapelController(),
    );
  }
}
