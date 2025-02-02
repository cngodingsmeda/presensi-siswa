import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/controller/general_controller.dart';
import 'package:presensi_siswa/app/data/api_url.dart';
import 'package:presensi_siswa/app/model/model_walas/profil_walas_model.dart';
import 'package:presensi_siswa/app/modules/walas/profil_walas/controllers/profil_walas_controller.dart';

class MainWalasController extends GetxController {
  var currentIndexBar = 0.obs;
  PageController pageController = PageController();
  var token = AllMaterial.box.read("token");
  var profilWalas = Rx<ProfileWalasModel?>(null);
  var isLoading = true.obs;
  var userNameFilter = "W".obs;
  var jumlahSiswa = 0.obs;
  var siswaHadir = 0.obs;
  var siswaAlpa = 0.obs;
  var profWalas = Get.put(ProfilWalasController());

  Future<void> fetchProfilWalas() async {
    print("Fetching profil walas...");

    final response = await http.get(
      Uri.parse(ApiUrl.urlGetProfileWalas),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );
    // statusCode.value = response.statusCode;
    print(response.statusCode);
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(data);

      profilWalas.value = ProfileWalasModel.fromJson(data);
      isLoading.value = false;
      userNameFilter.value =
          profilWalas.value?.data?.nama?[0].toUpperCase() ?? "P";

      update();
    } else if (response.statusCode == 401) {
      var genController = Get.put(GeneralController());
      genController.logout(isExpired: true);
    } else {
      // statusCode.value = response.statusCode;
      update();
      print("gagal menampilkan data");
      throw Exception('Failed to load profile');
    }
  }

  Future<void> fetchStatistikAbsenWalas() async {
    print("Fetching profil walas...");

    final response = await http.get(
      Uri.parse(ApiUrl.urlStatistikAbsenWalas),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );
    // statusCode.value = response.statusCode;
    print(response.statusCode);
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(data);
      jumlahSiswa.value = data['data']['jumlah_siswa'] ?? 0;
      siswaHadir.value = data['data']['jumlah_absen_hadir'] ?? 0;
      siswaAlpa.value = data['data']['jumlah_absen_tanpa_keterangan'] ?? 0;

      update();
    } else if (response.statusCode == 401) {
      var genController = Get.put(GeneralController());
      genController.logout(isExpired: true);
    } else {
      // statusCode.value = response.statusCode;
      update();
      print("gagal menampilkan data");
      throw Exception('Failed to load profile');
    }
  }

  @override
  void onInit() {
    fetchProfilWalas();
    fetchStatistikAbsenWalas();
    super.onInit();
  }
}
