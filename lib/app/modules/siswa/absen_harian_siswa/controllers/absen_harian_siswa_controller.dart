import 'dart:convert';

import 'package:get/get.dart';
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/data/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:presensi_siswa/app/model/model_siswa/jadwal_absen_hari_ini_siswa_model.dart';

class AbsenHarianSiswaController extends GetxController {
  var mapel = [
    "Matematika",
    "Pendidikan Agama Islam & Budi Pekerti",
    "Penjas Orkes",
  ];
  var jam = ["07:00 - 09:25", "09:25 - 11:30", "11:30 - 14:00"];
  var token = AllMaterial.box.read("token");
  var jadwal = Rx<JadwalAbsenTodaySiswaModel?>(null);
  var jumlahMapel = 0.obs;
  var bisaAbsen = false.obs; 

  Future<void> fetchJadwalAbsenTodaySiswa() async {
    try {
      final response = await http.get(
        Uri.parse(ApiUrl.urlGetJadwalAbsenTodaySiswa),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      print(response.statusCode);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        jadwal.value = JadwalAbsenTodaySiswaModel.fromJson(data);
        jumlahMapel.value = data["data"]["countMapel"] ?? 0;
        print(data);
      } else {
        print(data);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> fetchAvailableAbsenTodaysiswa() async {
    try {
      final response = await http.get(
        Uri.parse(ApiUrl.urlGetAvailableAbsenTodaySiswa),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      print(response.statusCode);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        bisaAbsen.value = data["data"]["avaliableAbsen"];
        print(data);
      } else {
        print(data);
      }
      update();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void onInit() {
    fetchJadwalAbsenTodaySiswa();
    fetchAvailableAbsenTodaysiswa();
    super.onInit();
  }
}
