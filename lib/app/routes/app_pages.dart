import 'package:get/get.dart';

import '../modules/siswa/main_siswa/bindings/main_siswa_binding.dart';
import '../modules/siswa/main_siswa/views/main_siswa_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();


  static final routes = [
    GetPage(
      name: _Paths.MAIN_SISWA,
      page: () => const MainSiswaView(),
      binding: MainSiswaBinding(),
    ),
  ];
}
