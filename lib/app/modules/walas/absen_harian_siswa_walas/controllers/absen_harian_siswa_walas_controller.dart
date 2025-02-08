import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/data/api_url.dart';
import 'package:presensi_siswa/app/model/model_walas/absen_kelas_harian_petugas_model.dart';

class AbsenHarianSiswaWalasController extends GetxController {
  var token = AllMaterial.box.read("token");

  var jumlahSiswa = 0.obs;
  var statusCode = 0.obs;
  var absen = Rx<AbsenKelasHarianWalasModel?>(null);
  var listSiswa = <String>[].obs;
  var page = 1.obs;

  Future<void> fetchAbsenHarianWalas(
      String tanggal) async {
    try {
      final response = await http.get(
        Uri.parse(
            "${ApiUrl.urlGetAbsenKelasWalasByTanggal}$tanggal&page=${page.value}"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      print(response.statusCode);
      statusCode.value = response.statusCode;
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var responseData = AbsenKelasHarianWalasModel.fromJson(data);
        absen.value = responseData;
        jumlahSiswa.value = responseData.data?.countData ?? 0;
        var absenSiswa = data["data"]["absen"] as Map<String, dynamic>;
        listSiswa.value = absenSiswa.keys.toList();
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
    fetchAbsenHarianWalas(
        DateFormat('yyyy-MM-dd').format(DateTime.now()));
    // print(DateFormat('yyyy-MM-dd').format(DateTime.now()));
    super.onInit();
  }
}
