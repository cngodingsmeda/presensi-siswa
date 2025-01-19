import 'package:get/get.dart';

import '../controllers/edit_profil_mapel_controller.dart';

class EditProfilMapelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfilMapelController>(
      () => EditProfilMapelController(),
    );
  }
}
