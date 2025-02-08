import 'dart:convert';

import 'package:get/get.dart';
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/data/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:presensi_siswa/app/model/model_walas/all_absen_siswa_walas_model.dart';

class LaporanWalasController extends GetxController {
 var selectedMonth = 6.obs;
  var isLoading = false.obs;
  var token = AllMaterial.box.read("token");
  DateTime now = DateTime.now();
  var historiAbsen = Rx<AllLaporanSiswaWalasModel?>(null);
  var absensiList = <dynamic>[].obs;

  void updateHistoriAbsen(int month) {
    selectedMonth.value = month;
    fetchAllHistoriAbsen(month);
  }

  Future<void> fetchAllHistoriAbsen(int bulan) async {
    isLoading.value = true;
    try {
      final response = await http.get(
        Uri.parse("${ApiUrl.urlGetAllAbsenSiswaWalas}$bulan"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        absensiList.clear();
        data['data']?.forEach((key, value) {
          absensiList.addAll(value);
        });
        print("Data berhasil diambil: ${absensiList.length} entri");
      } else {
        print("Gagal mengambil data: ${response.body}");
      }
    } catch (e) {
      print("Error: ${e.toString()}");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    selectedMonth.value = now.month;
    fetchAllHistoriAbsen(now.month);
    super.onInit();
  }
}
