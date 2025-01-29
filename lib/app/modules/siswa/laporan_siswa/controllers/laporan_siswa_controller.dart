import 'dart:convert';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/data/api_url.dart';

class LaporanSiswaController extends GetxController {
var absen = [].obs;
  var selectedMonth = 6.obs;
  var bulanIni = "".obs;
  var token = AllMaterial.box.read("token");
  void updateHistoriAbsen(int month) {
    selectedMonth.value = month;
  }

  Future<void> fetchHistoriAbsen() async {
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
        // rekapMingguan.value = RekapMingguanSiswaModel.fromJson(data);
        // homeCont.absenHadir.value = data["data"]["total_hadir"] ?? 0;
        // homeCont.absenIzin.value = data["data"]["total_izin_sakit_dispensasi"] ?? 0;
        print(data);
      } else {
        print(data);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void onInit() {
    DateTime now = DateTime.now();

    int bulan = now.month;
    String namaBulan = DateFormat('MMMM', 'id_ID').format(now);

    print('Bulan ini adalah $namaBulan ($bulan)');
    selectedMonth.value = bulan;
    bulanIni.value = namaBulan;
    super.onInit();
  }
}
