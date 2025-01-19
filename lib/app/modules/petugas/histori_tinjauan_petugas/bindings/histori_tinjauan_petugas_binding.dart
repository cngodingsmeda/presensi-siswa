import 'package:get/get.dart';

import '../controllers/histori_tinjauan_petugas_controller.dart';

class HistoriTinjauanPetugasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoriTinjauanPetugasController>(
      () => HistoriTinjauanPetugasController(),
    );
  }
}
