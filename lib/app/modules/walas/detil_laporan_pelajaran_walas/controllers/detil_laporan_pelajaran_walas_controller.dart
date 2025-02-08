import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/data/api_url.dart';
import 'package:presensi_siswa/app/model/model_walas/laporan_pelajaran_kelas_walas_model.dart';

class DetilLaporanPelajaranWalasController extends GetxController {
  var absen = Rx<LaporanPelajaranKelasWalasModel?>(null);
  var token = AllMaterial.box.read("token");
  var jumlahSiswa = 0.obs;
  var intPage = 1.obs;
  var listSiswa = <String>[].obs;
  var statusCode = 0.obs;
  var msg = "".obs;

  Future<void> fetchAbsenBulananSiswaWalas(String tanggal) async {
    try {
      final response = await http.get(
        Uri.parse(ApiUrl.getAbsenKelasWalas(tanggal, intPage.value.toString())),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      statusCode.value = response.statusCode;
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var responseData = LaporanPelajaranKelasWalasModel.fromJson(data);
        absen.value = responseData;
        jumlahSiswa.value = responseData.data?.countData ?? 0;
        var absenSiswa = data["data"]["absen"] as Map<String, dynamic>;
        listSiswa.value = absenSiswa.keys.toList();
      } else {
        msg.value = data["msg"] ?? "Terjadi kesalahan.";
      }
    } catch (e) {
      msg.value = "Gagal memuat data: $e";
    } finally {
      update();
    }
  }

  void loadNextPage(String tanggal) {
    if (listSiswa.length < jumlahSiswa.value) {
      intPage.value++;
      fetchAbsenBulananSiswaWalas(tanggal);
    }
  }

  void loadPreviousPage(String tanggal) {
    if (intPage.value > 1) {
      intPage.value--;
      fetchAbsenBulananSiswaWalas(tanggal);
    }
  }

  @override
  void onInit() {
    fetchAbsenBulananSiswaWalas(
      AllMaterial.tahunBulanTanggal(Get.arguments["tanggal"]),
    );
    super.onInit();
  }
}
