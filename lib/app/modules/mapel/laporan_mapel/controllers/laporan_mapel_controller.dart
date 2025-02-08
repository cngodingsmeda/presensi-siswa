import 'dart:convert';

import 'package:get/get.dart';
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/data/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:presensi_siswa/app/model/model_mapel/kelas_diajar_mapel_model.dart';

class LaporanMapelController extends GetxController {
  var token = AllMaterial.box.read("token");
  var kelasDiajar = Rx<KelasDiajarMapelModel?>(null);

  Future<void> fetchKelasDiajarMapel() async {
    try {
      final response = await http.get(
        Uri.parse(ApiUrl.urlGetAllKelasDiajarMapel),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      // statusCode.value = response.statusCode;
      print(response.statusCode);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(data);
        kelasDiajar.value = KelasDiajarMapelModel.fromJson(data);

        update();
      } else {
        // statusCode.value = response.statusCode;
        // update();
        print(response.body);
        print("gagal menampilkan data");
        throw Exception('Failed to load profile');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void onInit() {
    fetchKelasDiajarMapel();
    super.onInit();
  }
}
