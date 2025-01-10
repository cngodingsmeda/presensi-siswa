import 'package:get/get.dart';

import '../modules/login_page/bindings/login_page_binding.dart';
import '../modules/login_page/views/login_page_view.dart';
import '../modules/siswa/absen_harian_siswa/bindings/absen_harian_siswa_binding.dart';
import '../modules/siswa/absen_harian_siswa/views/absen_harian_siswa_view.dart';
import '../modules/siswa/buat_absen_harian_siswa/bindings/buat_absen_harian_siswa_binding.dart';
import '../modules/siswa/buat_absen_harian_siswa/views/buat_absen_harian_siswa_view.dart';
import '../modules/siswa/detil_laporan_siswa/bindings/detil_laporan_siswa_binding.dart';
import '../modules/siswa/detil_laporan_siswa/views/detil_laporan_siswa_view.dart';
import '../modules/siswa/edit_profil_siswa/bindings/edit_profil_siswa_binding.dart';
import '../modules/siswa/edit_profil_siswa/views/edit_profil_siswa_view.dart';
import '../modules/siswa/home_siswa/bindings/home_siswa_binding.dart';
import '../modules/siswa/home_siswa/views/home_siswa_view.dart';
import '../modules/siswa/jadwal_absen_siswa/bindings/jadwal_absen_siswa_binding.dart';
import '../modules/siswa/jadwal_absen_siswa/views/jadwal_absen_siswa_view.dart';
import '../modules/siswa/laporan_siswa/bindings/laporan_siswa_binding.dart';
import '../modules/siswa/laporan_siswa/views/laporan_siswa_view.dart';
import '../modules/siswa/main_siswa/bindings/main_siswa_binding.dart';
import '../modules/siswa/main_siswa/views/main_siswa_view.dart';
import '../modules/siswa/notifikasi_siswa/bindings/notifikasi_siswa_binding.dart';
import '../modules/siswa/notifikasi_siswa/views/notifikasi_siswa_view.dart';
import '../modules/siswa/profil_siswa/bindings/profil_siswa_binding.dart';
import '../modules/siswa/profil_siswa/views/profil_siswa_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.MAIN_SISWA,
      page: () => const MainSiswaView(),
      binding: MainSiswaBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_PAGE,
      page: () => const LoginPageView(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: _Paths.HOME_SISWA,
      page: () => const HomeSiswaView(),
      binding: HomeSiswaBinding(),
    ),
    GetPage(
      name: _Paths.LAPORAN_SISWA,
      page: () => const LaporanSiswaView(),
      binding: LaporanSiswaBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFIKASI_SISWA,
      page: () => const NotifikasiSiswaView(),
      binding: NotifikasiSiswaBinding(),
    ),
    GetPage(
      name: _Paths.PROFIL_SISWA,
      page: () => const ProfilSiswaView(),
      binding: ProfilSiswaBinding(),
    ),
    GetPage(
      name: _Paths.ABSEN_HARIAN_SISWA,
      page: () => const AbsenHarianSiswaView(),
      binding: AbsenHarianSiswaBinding(),
    ),
    GetPage(
      name: _Paths.JADWAL_ABSEN_SISWA,
      page: () => const JadwalAbsenSiswaView(),
      binding: JadwalAbsenSiswaBinding(),
    ),
    GetPage(
      name: _Paths.DETIL_LAPORAN_SISWA,
      page: () => const DetilLaporanSiswaView(),
      binding: DetilLaporanSiswaBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFIL_SISWA,
      page: () => const EditProfilSiswaView(),
      binding: EditProfilSiswaBinding(),
    ),
    GetPage(
      name: _Paths.BUAT_ABSEN_HARIAN_SISWA,
      page: () => const BuatAbsenHarianSiswaView(),
      binding: BuatAbsenHarianSiswaBinding(),
    ),
  ];
}
