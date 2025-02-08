import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/controller/general_controller.dart';
import 'package:presensi_siswa/app/data/api_url.dart';
import 'package:presensi_siswa/app/model/model_mapel/all_histori_kelas_diajar_mapel_model.dart';
import 'package:presensi_siswa/app/model/model_mapel/kelas_diajar_saat_ini_mapel_model.dart';
import 'package:presensi_siswa/app/model/model_mapel/profile_mapel_model.dart';

class MainMapelController extends GetxController {
  var currentIndexBar = 0.obs;
  var unreadNotifications = 3.obs;
  PageController pageController = PageController();
  var isLoading = true.obs;
  var userNameFilter = "M".obs;
  var token = AllMaterial.box.read("token");
  var profilMapel = Rx<ProfileMapelModel?>(null);
  var statistikKelas = Rx<KelasDiajarSaatIniMapelModel?>(null);
  var historiKelas = Rx<AllHistoriKelasDiajarMapelModel?>(null);

  Future<void> fetchProfilMapel() async {
    print("Fetching profil mapel...");

    final response = await http.get(
      Uri.parse(ApiUrl.urlGetProfileMapel),
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
      profilMapel.value = ProfileMapelModel.fromJson(data);
      isLoading.value = false;
      userNameFilter.value =
          profilMapel.value?.data?.nama?[0].toUpperCase() ?? "W";
      // MainSiswaController.jumlahSiswa.value =
      //     profilMapel.value?.data?.kelas?.jumlahSiswa ?? 0;
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

  Future<void> fetchKelasDiajarSaatIniMapel() async {
    final response = await http.get(
      Uri.parse(ApiUrl.urlGetKelasDiajarSaatIniMapel),
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
      statistikKelas.value = KelasDiajarSaatIniMapelModel.fromJson(data);

      update();
    } else {
      // statusCode.value = response.statusCode;
      // update();
      AllMaterial.messageScaffold(title: data["msg"]);
      print(response.body);
      print("gagal menampilkan data");
    }
  }

  Future<void> fetchAllKelasDiajarMapel() async {
    final response = await http.get(
      Uri.parse(ApiUrl.urlGetHistoriKelasDiajarMapel),
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
      historiKelas.value = AllHistoriKelasDiajarMapelModel.fromJson(data);
      update();
    } else {
      // statusCode.value = response.statusCode;
      // update();
      AllMaterial.messageScaffold(title: data["msg"]);
      print(response.body);
      print("gagal menampilkan data");
    }
  }

  // AllHistoriKelasDiajarMapelModel

  @override
  void onInit() async {
    await fetchProfilMapel();
    fetchAllKelasDiajarMapel();
    fetchKelasDiajarSaatIniMapel();
    super.onInit();
  }
}
