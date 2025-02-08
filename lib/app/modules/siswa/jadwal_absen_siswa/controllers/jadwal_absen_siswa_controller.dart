import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/data/api_url.dart';
import 'package:presensi_siswa/app/model/model_siswa/detil_jadwal_absen_siswa.dart';
import 'package:presensi_siswa/app/model/model_siswa/jadwal_hari_absen_siswa_model.dart';

class JadwalAbsenSiswaController extends GetxController {
  var mapel = [
    "Matematika",
    "Pendidikan Agama Islam & Budi Pekerti",
    "Penjas Orkes",
  ];
  var jam = ["07:00 - 09:25", "09:25 - 11:30", "11:30 - 14:00"];
  var hari = Rx<JadwalHariAbsenSiswaModel?>(null);
  var token = AllMaterial.box.read("token");
  var detil = Rx<DetilJadwalAbsenSiswaModel?>(null);

  Future<void> fetchJadwalHariAbsenSiswa() async {
    try {
      final response = await http.get(
        Uri.parse(ApiUrl.urlGetJadwalHariAbsenSiswa),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      print(response.statusCode);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print("data dari fetchJadwalHariAbsenSiswa: $data");
        hari.value = JadwalHariAbsenSiswaModel.fromJson(data);
        print(data);
      } else {
        print(data);
      }
      update();
    } catch (e) {
      print("${e}hahahah");
    }
  }

  Future<void> fetchDetilJadwalHariAbsenSiswa(String hari) async {
    try {
      final response = await http.get(
        Uri.parse("${ApiUrl.urlGetDetilJadwalHariAbsenSiswa}$hari"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      print(response.statusCode);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        detil.value = DetilJadwalAbsenSiswaModel.fromJson(data);
        print("data di if: $data");
      } else {
        print("data di else: $data");
      }
      update();
    } catch (e) {
      print("hahahah: $e");
    }
  }

  @override
  void onInit() {
    fetchJadwalHariAbsenSiswa();
    super.onInit();
  }
}
