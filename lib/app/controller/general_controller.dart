import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/data/api_url.dart';
import 'package:presensi_siswa/app/modules/login_page/controllers/login_page_controller.dart';
import 'package:presensi_siswa/app/modules/login_page/views/login_page_view.dart';

class GeneralController extends GetxController {
  var logController = Get.put(LoginPageController());

  Future<dynamic> logout({bool? isExpired}) async {
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
          // final homeSiswaController = Get.put(HomeSiswaController());
          // final homePageSiswaController = Get.put(HomepageSiswaController());
          // final profileController = Get.put(ProfileSiswaController());
          // final historiController = Get.put(HistoriAbsenSiswaControllr());
          // homeSiswaController.indexPage.value = 0;
          // historiController.absen.value = <Datum>[];
          // homePageSiswaController.ajuanPkl.value = null;
          // homePageSiswaController.readCount.value = 0;
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
