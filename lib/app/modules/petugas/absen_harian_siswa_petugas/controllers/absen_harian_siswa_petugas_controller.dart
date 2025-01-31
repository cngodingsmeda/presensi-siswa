import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/data/api_url.dart';
import 'package:presensi_siswa/app/model/model_petugas/kelas_tinjauan_petugas.dart';
import 'package:presensi_siswa/app/modules/petugas/absen_harian_siswa_petugas/views/absen_harian_siswa_petugas_view.dart';

class AbsenHarianSiswaPetugasController extends GetxController {
  var kelas = Rx<KelasTinjauanPetugasModel?>(null);
  var token = AllMaterial.box.read("token");
  var totalKelas = [].obs;

  Future<void> fetchKelasTinjauan({bool getTo = true}) async {
    try {
      final response = await http.get(
        Uri.parse(ApiUrl.urlGetKelasTinjauanPetugas),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      print(response.statusCode);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        kelas.value = KelasTinjauanPetugasModel.fromJson(data);
        totalKelas.value = kelas.value?.data?.kelas ?? [];
        getTo ?
        Get.to(() => const AbsenHarianSiswaPetugasView()) : null;
        print(data);
      } else {
        print(data);
      }
    } catch (e) {
      print("${e.toString()} awadwadw");
    }
  }
}
