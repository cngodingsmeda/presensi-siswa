import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/data/api_url.dart';
import 'package:presensi_siswa/app/model/model_petugas/absen_siswa_by_id_petugas_model.dart';
import 'package:presensi_siswa/app/model/model_petugas/detil_absen_siswa_by_id_petugas_model.dart';

class AbsenPelajaranSiswaPetugasController extends GetxController {
  var token = AllMaterial.box.read("token");
  var jadwal = Rx<AbsenSiswaByIdPetugasModel?>(null);
  var detil = Rx<DetilAbsenSiswaByIdPetugasModel?>(null);

  Future<void> fetchAbsenSiswaByIdPetugas(
      String tanggal, String idSiswa) async {
    try {
      final response = await http.get(
        Uri.parse(ApiUrl.getAbsenSiswaByIdPetugas(tanggal, idSiswa)),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      print(response.statusCode);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        jadwal.value = AbsenSiswaByIdPetugasModel.fromJson(data);
        print(data);
      } else {
        print(data);
      }
    } catch (e) {
      print("${e}dawdwdw");
    }
  }

  Future<void> fetchDetilAbsenSiswaByIdPetugas(String idAbsen) async {
    try {
      final response = await http.get(
        Uri.parse("${ApiUrl.urlGetDetilHistoriTinjauanPetugas}/$idAbsen"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      print(response.statusCode);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        detil.value = DetilAbsenSiswaByIdPetugasModel.fromJson(data);
        print(data);
      } else {
        print(data);
      }
    } catch (e) {
      print("${e}dawdwdw");
    }
  }

  @override
  void onInit() {
    var idSiswa = Get.arguments["idSiswa"];
    fetchAbsenSiswaByIdPetugas(
      DateFormat('yyyy-MM-dd').format(DateTime.now()),
      idSiswa.toString(),
    );
    super.onInit();
  }
}
