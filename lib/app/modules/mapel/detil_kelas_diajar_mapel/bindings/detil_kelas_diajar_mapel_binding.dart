import 'package:get/get.dart';

import '../controllers/detil_kelas_diajar_mapel_controller.dart';

class DetilKelasDiajarMapelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetilKelasDiajarMapelController>(
      () => DetilKelasDiajarMapelController(),
    );
  }
}
