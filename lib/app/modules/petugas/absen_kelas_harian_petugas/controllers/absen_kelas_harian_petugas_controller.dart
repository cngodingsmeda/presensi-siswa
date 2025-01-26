import 'dart:convert';

import 'package:get/get.dart';
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/data/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:presensi_siswa/app/model/model_petugas/absen_kelas_harian_petugas_model.dart';

class AbsenKelasHarianPetugasController extends GetxController {
  var absen = Rx<AbsenKelasHarianPetugasModel?>(null);
  var token = AllMaterial.box.read("token");
  var jumlahSiswa = 0.obs;
  var intPage = 1.obs;
  var listSiswa = <String>[].obs;

  Future<void> fetchAbsenHarianByKelasTinjauan(
      String tanggal, String idKelas) async {
    try {
      final response = await http.get(
        Uri.parse(ApiUrl.getAbsenByKelasTinjauanPetugas(
            tanggal, idKelas, intPage.value.toString())),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      print(response.statusCode);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var responseData = AbsenKelasHarianPetugasModel.fromJson(data);
        absen.value = responseData;
        jumlahSiswa.value = responseData.data?.jumlahSiswa ?? 0;
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
    var idKelas = Get.arguments["idKelas"];
    fetchAbsenHarianByKelasTinjauan(
        // DateFormat('yyyy-MM-dd').format(DateTime.now()),
        "2025-01-25",
        idKelas.toString());
    super.onInit();
  }
}
