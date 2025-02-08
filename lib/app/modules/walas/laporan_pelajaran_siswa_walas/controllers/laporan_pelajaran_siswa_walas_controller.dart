import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/data/api_url.dart';
import 'package:presensi_siswa/app/model/model_walas/detil_absen_siswa_walas_model.dart';
import 'package:presensi_siswa/app/model/model_walas/laporan_absen_siswa_walas_model.dart';

class LaporanPelajaranSiswaWalasController extends GetxController {
  var token = AllMaterial.box.read("token");
  var jadwal = Rx<LaporanAbsenSiswaWalasModel?>(null);
  var detil = Rx<DetilAbsenSiswaWalasModel?>(null);

  Future<void> fetchAbsenSiswaByIdWalas(String tanggal, String idSiswa) async {
    try {
      final response = await http.get(
        Uri.parse(ApiUrl.getAbsenSiswaByIdWalas(tanggal, idSiswa)),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      print(response.statusCode);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        jadwal.value = LaporanAbsenSiswaWalasModel.fromJson(data);
        print(data);
      } else {
        print(data);
      }
    } catch (e) {
      print("${e}dawdwdw");
    }
  }

  Future<void> fetchDetilAbsenSiswaByIdWalas(String idAbsen) async {
    try {
      final response = await http.get(
        Uri.parse("${ApiUrl.urlGetDetilHistoriAbsenWalas}/$idAbsen"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      print(response.statusCode);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        detil.value = DetilAbsenSiswaWalasModel.fromJson(data);
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
    fetchAbsenSiswaByIdWalas(
      AllMaterial.tahunBulanTanggal(Get.arguments["tanggal"]),
      idSiswa.toString(),
    );
    super.onInit();
  }
}
