import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/data/api_url.dart';
import 'package:presensi_siswa/app/modules/login_page/controllers/login_page_controller.dart';
import 'package:presensi_siswa/app/modules/login_page/views/login_page_view.dart';
import 'package:presensi_siswa/app/modules/petugas/home_petugas/controllers/home_petugas_controller.dart';
import 'package:presensi_siswa/app/modules/petugas/laporan_petugas/controllers/laporan_petugas_controller.dart';
import 'package:presensi_siswa/app/modules/petugas/main_petugas/controllers/main_petugas_controller.dart';
import 'package:presensi_siswa/app/modules/siswa/home_siswa/controllers/home_siswa_controller.dart';
import 'package:presensi_siswa/app/modules/siswa/main_siswa/controllers/main_siswa_controller.dart';

class GeneralController extends GetxController {
  var logController = Get.put(LoginPageController());

  Future<dynamic> logout({bool isExpired = false}) async {
    try {
      final response = await http.post(
        Uri.parse(ApiUrl.urlPostLogout),
        headers: {
          "Content-Type": "application/json",
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        Get.reloadAll();
        Get.back();

        // ALL
        Get.offAll(() => const LoginPageView());
        AllMaterial.box.erase();
        AllMaterial.box.remove("token");
        if (isExpired == true) {
          AllMaterial.messageScaffold(
            title: "Sesi berakhir, silahkan login kembali",
          );
        } else {
          AllMaterial.messageScaffold(
            title: "Logout Berhasil, Sampai Jumpa!",
          );
        }

        if (logController.isWalas.value) {
          // Walas
          // final homeGuruController = Get.put(HomeGuruController());
          // final profileGuruController = Get.put(ProfileGuruController());
          // final homePageGuruController = Get.put(HomepageGuruController());
          // homeGuruController.indexPage.value = 0;
          // profileGuruController.profil.value = null;
          // homePageGuruController.dudiTerkait.value = null;
          // homePageGuruController.jumlahDudi.value = 0;
          // homePageGuruController.jumlahKendalaSiswa.value = 0;
          // homePageGuruController.jumlahSiswa.value = 0;
          // homePageGuruController.siswaBimbingan.value = null;
          // logController.isGuru.value = false;
        } else if (logController.isSiswa.value) {
          // Siswa
          final mainSiswaController = Get.put(MainSiswaController());
          final homePageSiswaController = Get.put(HomeSiswaController());
          mainSiswaController.currentIndexBar.value = 0;
          mainSiswaController.profilSiswa.value = null;
          mainSiswaController.rekapMingguan.value = null;
          mainSiswaController.userNameFilter.value = "";
          homePageSiswaController.absenHadir.value = 0;
          homePageSiswaController.absenIzin.value = 0;
          // historiController.absen.value = <Datum>[];
          // profileController.profil.value = null;
          // profileController.isLoading.value = true;
        } else if (logController.isMapel.value) {
          // Mapel
          // final homeDudiController = Get.put(HomeDudiController());
          // final homePageDudiController = Get.put(HomepageDudiController());
          // final profileDudiController = Get.put(ProfileDudiController());
          // homeDudiController.indexPage.value = 0;
          // homePageDudiController.jumlahPengajuanProses.value = 0;
          // homePageDudiController.jumlahSiswa.value = 0;
          // homePageDudiController.kuotaSiswaLakiLaki.value = 0;
          // homePageDudiController.kuotaSiswaPerempuan.value = 0;
          // homePageDudiController.refresh();
          // homePageDudiController.pengajuanPKL.value = null;
          // DataSiswaDudiController.allSiswa.value = null;
          // profileDudiController.profil.value = null;
          // profileDudiController.isLoading.value = true;
        } else if (logController.isPetugas.value) {
          // Petugas
          final mainPetugasController = Get.put(MainPetugasController());
          final homePagePetugasController = Get.put(HomePetugasController());
          final historiController = Get.put(LaporanPetugasController());
          mainPetugasController.currentIndexBar.value = 0;
          mainPetugasController.profilPetugas.value = null;
          mainPetugasController.userNameFilter.value = "";
          homePagePetugasController.absenBelumDitinjau.value = 0;
          homePagePetugasController.absenDiterima.value = 0;
          homePagePetugasController.absenDitolak.value = 0;
          historiController.absen.value = [];
          historiController.selectedMonth.value = 1;
        }
        update();
      } else {
        AllMaterial.messageScaffold(
          title: "Kesalahan, tidak dapat melakukan aksi sebelumnya!",
        );
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
