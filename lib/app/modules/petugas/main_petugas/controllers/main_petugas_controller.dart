import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/controller/general_controller.dart';
import 'package:presensi_siswa/app/data/api_url.dart';
import 'package:presensi_siswa/app/model/model_petugas/profil_petugas_model.dart';
import 'package:presensi_siswa/app/modules/petugas/histori_tinjauan_petugas/controllers/histori_tinjauan_petugas_controller.dart';
import 'package:presensi_siswa/app/modules/petugas/home_petugas/controllers/home_petugas_controller.dart';

class MainPetugasController extends GetxController {
  PageController pageController = PageController();
  var currentIndexBar = 0.obs;
  var profilPetugas = Rx<ProfilePetugasModel?>(null);
  var isLoading = true.obs;
  var statusCode = 0.obs;
  var userNameFilter = "P".obs;
  String token = AllMaterial.box.read("token");
  var unreadNotifications = 0.obs;
  final homeCont = Get.put(HomePetugasController());
  final historiC = Get.put(HistoriTinjauanPetugasController());

  // Home
  Future<void> fetchStatistikTinjauan() async {
    try {
      final response = await http.get(
        Uri.parse(ApiUrl.urlGetStatistikTinjauanPetugas),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      print(response.statusCode);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        homeCont.absenBelumDitinjau.value = data["data"]["belum_ditinjau"] ?? 0;
        homeCont.absenDiterima.value = data["data"]["diterima"] ?? 0;
        homeCont.absenDitolak.value = data["data"]["ditolak"] ?? 0;
        print(data);
      } else {
        print(data);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> patchTinjauanAbsenPetugas(bool isDiterima, String id) async {
    print(id);
    try {
      print("${ApiUrl.urlPatchTinjauAbsenPetugas}/$id");
      final response = await http.patch(
        Uri.parse("${ApiUrl.urlPatchTinjauAbsenPetugas}/$id"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode(
          {
            "status_tinjauan": isDiterima == true ? "diterima" : "ditolak",
          },
        ),
      );
      print(response.statusCode);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(data);
        historiC.absen.refresh();
        historiC.absenDiterima.refresh();
        historiC.absenDitolak.refresh();
        historiC.absenPending.refresh();
        historiC.detilAbsen.refresh();
        historiC.fetchHistoriTinjauanPetugas();
        final mainCont = Get.put(MainPetugasController());

        mainCont.fetchStatistikTinjauan();
      } else {
        print(data);
      }
    } catch (e) {
      print(e.toString());
    }
  }

// Profil
  Future<void> fetchProfilPetugas() async {
    print("Fetching profil petugas...");

    final response = await http.get(
      Uri.parse(ApiUrl.urlGetProfilePetugas),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );
    statusCode.value = response.statusCode;
    print(response.statusCode);
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(data);

      profilPetugas.value = ProfilePetugasModel.fromJson(data);
      isLoading.value = false;
      userNameFilter.value =
          profilPetugas.value?.data?.nama?[0].toUpperCase() ?? "P";

      update();
    } else if (response.statusCode == 401) {
      var genController = Get.put(GeneralController());
      genController.logout(isExpired: true);
    } else {
      statusCode.value = response.statusCode;
      update();
      print("gagal menampilkan data");
      throw Exception('Failed to load profile');
    }
  }

  @override
  void onInit() {
    fetchProfilPetugas();
    historiC.fetchHistoriTinjauanPetugas();
    fetchStatistikTinjauan();
    super.onInit();
  }
}
