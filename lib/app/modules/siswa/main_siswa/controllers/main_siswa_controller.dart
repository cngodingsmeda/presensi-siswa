import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/controller/general_controller.dart';
import 'package:presensi_siswa/app/data/api_url.dart';
import 'package:presensi_siswa/app/model/model_siswa/profil_siswa_model.dart';
import 'package:presensi_siswa/app/model/model_siswa/rekap_absen_mingguan_siswa_model.dart';
import 'package:presensi_siswa/app/modules/siswa/home_siswa/controllers/home_siswa_controller.dart';

class MainSiswaController extends GetxController {
  PageController pageController = PageController();
  var currentIndexBar = 0.obs;
  var profilSiswa = Rx<ProfileSiswaModel?>(null);
  var rekapMingguan = Rx<RekapMingguanSiswaModel?>(null);
  var isLoading = true.obs;
  var statusCode = 0.obs;
  var userNameFilter = "S".obs;
  static var jumlahSiswa = 0.obs;
  String token = AllMaterial.box.read("token");
  final homeCont = Get.put(HomeSiswaController());

// Home
  Future<void> fetchRekapAbsenMingguan() async {
    try {
      final response = await http.get(
        Uri.parse(ApiUrl.urlGetRekapAbsenMingguanSiswa),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      print(response.statusCode);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        rekapMingguan.value = RekapMingguanSiswaModel.fromJson(data);
        homeCont.absenHadir.value = data["data"]["total_hadir"] ?? 0;
        homeCont.absenIzin.value =
            data["data"]["total_izin_sakit_dispensasi"] ?? 0;
        print(data);
      } else {
        print(data);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> getUserLocation() async {
    Location location = Location();

    // Mengecek apakah layanan lokasi aktif
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        print("Layanan lokasi tidak aktif.");
        return;
      }
    }

    // Mengecek izin lokasi
    PermissionStatus permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        print("Izin lokasi tidak diberikan.");
        return;
      }
    }

    // Mendapatkan lokasi pengguna
    try {
      LocationData userLocation = await location.getLocation();
      if (userLocation.latitude != null || userLocation.longitude != null) {
        await cekRadiusKoordinatAbsenSiswa(
            userLocation.latitude, userLocation.longitude);
      }
    } catch (e) {
      print("Error mendapatkan lokasi: $e");
    }
  }

  Future<void> cekRadiusKoordinatAbsenSiswa(
      double? latitude, double? longitude) async {
    try {
      final response = await http
          .post(
            Uri.parse(ApiUrl.urlPostKoordinatAbsenSiswa),
            headers: {
              "Content-Type": "application/json",
              "Authorization": "Bearer $token",
            },
            body: jsonEncode(
              {
                "latitude": latitude,
                "longitude": longitude,
              },
            ),
          )
          .timeout(const Duration(seconds: 30));

      print(response.statusCode);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(data);
        AllMaterial.messageScaffold(title: data["msg"]);
      } else {
        print(data);
      }
    } catch (e) {
      print(e.toString());
    }
  }

// Profil
  Future<void> fetchProfilSiswa() async {
    print("Fetching profil siswa...");

    final response = await http.get(
      Uri.parse(ApiUrl.urlGetProfileSiswa),
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

      profilSiswa.value = ProfileSiswaModel.fromJson(data);
      isLoading.value = false;
      userNameFilter.value =
          profilSiswa.value?.data?.nama?[0].toUpperCase() ?? "S";
      MainSiswaController.jumlahSiswa.value =  profilSiswa.value?.data?.kelas?.jumlahSiswa ?? 0;
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
    fetchProfilSiswa();
    fetchRekapAbsenMingguan();
    getUserLocation();
    super.onInit();
  }
}
