import 'package:get/get.dart';

import '../controllers/profil_mapel_controller.dart';

class ProfilMapelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfilMapelController>(
      () => ProfilMapelController(),
    );
  }
}
