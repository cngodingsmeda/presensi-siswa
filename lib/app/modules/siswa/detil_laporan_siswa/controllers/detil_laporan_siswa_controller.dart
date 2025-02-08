import 'dart:convert';

import 'package:get/get.dart';
import 'package:presensi_siswa/all_material.dart';
import 'package:http/http.dart' as http;
import 'package:presensi_siswa/app/data/api_url.dart';
import 'package:presensi_siswa/app/model/model_siswa/detil_laporan_absen_siswa_model.dart';

class DetilLaporanSiswaController extends GetxController {
  var token = AllMaterial.box.read("token");
  var detil = Rx<DetilLaporanAbsenSiswaModel?>(null);

  Future<void> fetchDetilAbsenSiswa(int id) async {
    try {
      final response = await http.get(
        Uri.parse("${ApiUrl.urlGetDetilLaporanAbsenSiswa}$id"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      print(response.statusCode);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        detil.value = DetilLaporanAbsenSiswaModel.fromJson(data);
        print("data fetchDetilAbsenSiswa: $data");
      } else {
        print(data);
      }
      update();
    } catch (e) {
      print("${e}hahahah");
    }
  }

  var detilAbsen = <dynamic>[].obs;
  @override
  void onInit() {
    var arg = Get.arguments;
    detilAbsen.add(arg["keyTanggal"]);
    super.onInit();
  }

  @override
  void onClose() {
    detilAbsen.clear();
    super.onClose();
  }
}
