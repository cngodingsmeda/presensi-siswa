import 'package:get/get.dart';

import '../modules/login_page/bindings/login_page_binding.dart';
import '../modules/login_page/views/login_page_view.dart';
import '../modules/mapel/absen_bulanan_kelas_mapel/bindings/absen_bulanan_kelas_mapel_binding.dart';
import '../modules/mapel/absen_bulanan_kelas_mapel/views/absen_bulanan_kelas_mapel_view.dart';
import '../modules/mapel/detil_kelas_diajar_mapel/bindings/detil_kelas_diajar_mapel_binding.dart';
import '../modules/mapel/detil_kelas_diajar_mapel/views/detil_kelas_diajar_mapel_view.dart';
import '../modules/mapel/edit_profil_mapel/bindings/edit_profil_mapel_binding.dart';
import '../modules/mapel/edit_profil_mapel/views/edit_profil_mapel_view.dart';
import '../modules/mapel/home_mapel/bindings/home_mapel_binding.dart';
import '../modules/mapel/home_mapel/views/home_mapel_view.dart';
import '../modules/mapel/laporan_mapel/bindings/laporan_mapel_binding.dart';
import '../modules/mapel/laporan_mapel/views/laporan_mapel_view.dart';
import '../modules/mapel/main_mapel/bindings/main_mapel_binding.dart';
import '../modules/mapel/main_mapel/views/main_mapel_view.dart';
import '../modules/mapel/notifikasi_mapel/bindings/notifikasi_mapel_binding.dart';
import '../modules/mapel/notifikasi_mapel/views/notifikasi_mapel_view.dart';
import '../modules/mapel/profil_mapel/bindings/profil_mapel_binding.dart';
import '../modules/mapel/profil_mapel/views/profil_mapel_view.dart';
import '../modules/petugas/absen_bulanan_siswa_petugas/bindings/absen_bulanan_siswa_petugas_binding.dart';
import '../modules/petugas/absen_bulanan_siswa_petugas/views/absen_bulanan_siswa_petugas_view.dart';
import '../modules/petugas/absen_harian_siswa_petugas/bindings/absen_harian_siswa_petugas_binding.dart';
import '../modules/petugas/absen_harian_siswa_petugas/views/absen_harian_siswa_petugas_view.dart';
import '../modules/petugas/absen_kelas_harian_petugas/bindings/absen_kelas_harian_petugas_binding.dart';
import '../modules/petugas/absen_kelas_harian_petugas/views/absen_kelas_harian_petugas_view.dart';
import '../modules/petugas/absen_pelajaran_siswa_petugas/bindings/absen_pelajaran_siswa_petugas_binding.dart';
import '../modules/petugas/absen_pelajaran_siswa_petugas/views/absen_pelajaran_siswa_petugas_view.dart';
import '../modules/petugas/edit_profil_petugas/bindings/edit_profil_petugas_binding.dart';
import '../modules/petugas/edit_profil_petugas/views/edit_profil_petugas_view.dart';
import '../modules/petugas/histori_tinjauan_petugas/bindings/histori_tinjauan_petugas_binding.dart';
import '../modules/petugas/histori_tinjauan_petugas/views/histori_tinjauan_petugas_view.dart';
import '../modules/petugas/home_petugas/bindings/home_petugas_binding.dart';
import '../modules/petugas/home_petugas/views/home_petugas_view.dart';
import '../modules/petugas/laporan_petugas/bindings/laporan_petugas_binding.dart';
import '../modules/petugas/laporan_petugas/views/laporan_petugas_view.dart';
import '../modules/petugas/main_petugas/bindings/main_petugas_binding.dart';
import '../modules/petugas/main_petugas/views/main_petugas_view.dart';
import '../modules/petugas/notifikasi_petugas/bindings/notifikasi_petugas_binding.dart';
import '../modules/petugas/notifikasi_petugas/views/notifikasi_petugas_view.dart';
import '../modules/petugas/profil_petugas/bindings/profil_petugas_binding.dart';
import '../modules/petugas/profil_petugas/views/profil_petugas_view.dart';
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
import '../modules/walas/absen_harian_siswa_walas/bindings/absen_harian_siswa_walas_binding.dart';
import '../modules/walas/absen_harian_siswa_walas/views/absen_harian_siswa_walas_view.dart';
import '../modules/walas/detil_laporan_pelajaran_walas/bindings/detil_laporan_pelajaran_walas_binding.dart';
import '../modules/walas/detil_laporan_pelajaran_walas/views/detil_laporan_pelajaran_walas_view.dart';
import '../modules/walas/edit_profil_walas/bindings/edit_profil_walas_binding.dart';
import '../modules/walas/edit_profil_walas/views/edit_profil_walas_view.dart';
import '../modules/walas/home_walas/bindings/home_walas_binding.dart';
import '../modules/walas/home_walas/views/home_walas_view.dart';
import '../modules/walas/laporan_pelajaran_siswa_walas/bindings/laporan_pelajaran_siswa_walas_binding.dart';
import '../modules/walas/laporan_pelajaran_siswa_walas/views/laporan_pelajaran_siswa_walas_view.dart';
import '../modules/walas/laporan_walas/bindings/laporan_walas_binding.dart';
import '../modules/walas/laporan_walas/views/laporan_walas_view.dart';
import '../modules/walas/main_walas/bindings/main_walas_binding.dart';
import '../modules/walas/main_walas/views/main_walas_view.dart';
import '../modules/walas/notifikasi_walas/bindings/notifikasi_walas_binding.dart';
import '../modules/walas/notifikasi_walas/views/notifikasi_walas_view.dart';
import '../modules/walas/pilih_mapel_laporan_siswa_walas/bindings/pilih_mapel_laporan_siswa_walas_binding.dart';
import '../modules/walas/pilih_mapel_laporan_siswa_walas/views/pilih_mapel_laporan_siswa_walas_view.dart';
import '../modules/walas/profil_walas/bindings/profil_walas_binding.dart';
import '../modules/walas/profil_walas/views/profil_walas_view.dart';
import '../widget/ubah_password/bindings/ubah_password_binding.dart';
import '../widget/ubah_password/views/ubah_password_view.dart';
import '../widget/verifikasi_email/bindings/verifikasi_email_binding.dart';
import '../widget/verifikasi_email/views/verifikasi_email_view.dart';

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
    GetPage(
      name: _Paths.VERIFIKASI_EMAIL,
      page: () => const VerifikasiEmailView(),
      binding: VerifikasiEmailBinding(),
    ),
    GetPage(
      name: _Paths.UBAH_PASSWORD,
      page: () => const UbahPasswordView(),
      binding: UbahPasswordBinding(),
    ),
    GetPage(
      name: _Paths.MAIN_WALAS,
      page: () => const MainWalasView(),
      binding: MainWalasBinding(),
    ),
    GetPage(
      name: _Paths.MAIN_MAPEL,
      page: () => const MainMapelView(),
      binding: MainMapelBinding(),
    ),
    GetPage(
      name: _Paths.MAIN_PETUGAS,
      page: () => const MainPetugasView(),
      binding: MainPetugasBinding(),
    ),
    GetPage(
      name: _Paths.PROFIL_WALAS,
      page: () => const ProfilWalasView(),
      binding: ProfilWalasBinding(),
    ),
    GetPage(
      name: _Paths.HOME_WALAS,
      page: () => const HomeWalasView(),
      binding: HomeWalasBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFIKASI_WALAS,
      page: () => const NotifikasiWalasView(),
      binding: NotifikasiWalasBinding(),
    ),
    GetPage(
      name: _Paths.LAPORAN_WALAS,
      page: () => const LaporanWalasView(),
      binding: LaporanWalasBinding(),
    ),
    GetPage(
      name: _Paths.PILIH_MAPEL_LAPORAN_SISWA_WALAS,
      page: () => const PilihMapelLaporanSiswaWalasView(),
      binding: PilihMapelLaporanSiswaWalasBinding(),
    ),
    GetPage(
      name: _Paths.ABSEN_HARIAN_SISWA_WALAS,
      page: () => const AbsenHarianSiswaWalasView(),
      binding: AbsenHarianSiswaWalasBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFIL_WALAS,
      page: () => const EditProfilWalasView(),
      binding: EditProfilWalasBinding(),
    ),
    GetPage(
      name: _Paths.DETIL_LAPORAN_PELAJARAN_WALAS,
      page: () => const DetilLaporanPelajaranWalasView(),
      binding: DetilLaporanPelajaranWalasBinding(),
    ),
    GetPage(
      name: _Paths.LAPORAN_PELAJARAN_SISWA_WALAS,
      page: () => const LaporanPelajaranSiswaWalasView(),
      binding: LaporanPelajaranSiswaWalasBinding(),
    ),
    GetPage(
      name: _Paths.HOME_MAPEL,
      page: () => const HomeMapelView(),
      binding: HomeMapelBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFIKASI_MAPEL,
      page: () => const NotifikasiMapelView(),
      binding: NotifikasiMapelBinding(),
    ),
    GetPage(
      name: _Paths.PROFIL_MAPEL,
      page: () => const ProfilMapelView(),
      binding: ProfilMapelBinding(),
    ),
    GetPage(
      name: _Paths.LAPORAN_MAPEL,
      page: () => const LaporanMapelView(),
      binding: LaporanMapelBinding(),
    ),
    GetPage(
      name: _Paths.ABSEN_BULANAN_KELAS_MAPEL,
      page: () => const AbsenBulananKelasMapelView(),
      binding: AbsenBulananKelasMapelBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFIL_MAPEL,
      page: () => const EditProfilMapelView(),
      binding: EditProfilMapelBinding(),
    ),
    GetPage(
      name: _Paths.DETIL_KELAS_DIAJAR_MAPEL,
      page: () => const DetilKelasDiajarMapelView(),
      binding: DetilKelasDiajarMapelBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFIKASI_PETUGAS,
      page: () => const NotifikasiPetugasView(),
      binding: NotifikasiPetugasBinding(),
    ),
    GetPage(
      name: _Paths.PROFIL_PETUGAS,
      page: () => const ProfilPetugasView(),
      binding: ProfilPetugasBinding(),
    ),
    GetPage(
      name: _Paths.HOME_PETUGAS,
      page: () => const HomePetugasView(),
      binding: HomePetugasBinding(),
    ),
    GetPage(
      name: _Paths.LAPORAN_PETUGAS,
      page: () => const LaporanPetugasView(),
      binding: LaporanPetugasBinding(),
    ),
    GetPage(
      name: _Paths.HISTORI_TINJAUAN_PETUGAS,
      page: () => const HistoriTinjauanPetugasView(),
      binding: HistoriTinjauanPetugasBinding(),
    ),
    GetPage(
      name: _Paths.ABSEN_HARIAN_SISWA_PETUGAS,
      page: () => const AbsenHarianSiswaPetugasView(),
      binding: AbsenHarianSiswaPetugasBinding(),
    ),
    GetPage(
      name: _Paths.ABSEN_KELAS_HARIAN_PETUGAS,
      page: () => const AbsenKelasHarianPetugasView(),
      binding: AbsenKelasHarianPetugasBinding(),
    ),
    GetPage(
      name: _Paths.ABSEN_PELAJARAN_SISWA_PETUGAS,
      page: () => const AbsenPelajaranSiswaPetugasView(),
      binding: AbsenPelajaranSiswaPetugasBinding(),
    ),
    GetPage(
      name: _Paths.ABSEN_BULANAN_SISWA_PETUGAS,
      page: () => const AbsenBulananSiswaPetugasView(),
      binding: AbsenBulananSiswaPetugasBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFIL_PETUGAS,
      page: () => const EditProfilPetugasView(),
      binding: EditProfilPetugasBinding(),
    ),
  ];
}
