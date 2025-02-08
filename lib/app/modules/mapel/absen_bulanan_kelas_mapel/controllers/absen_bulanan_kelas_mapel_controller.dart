import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/data/api_url.dart';
import 'package:presensi_siswa/app/model/model_mapel/detil_absen_siswa_mapel_model.dart';
import 'package:presensi_siswa/app/model/model_mapel/detil_kelas_diajar_mapel_model.dart';

class AbsenBulananKelasMapelController extends GetxController {
  var intPage = 0.obs;
  var token = AllMaterial.box.read("token");
  var statusCode = 0.obs;
  var countPage = 0.obs;
  var absen = Rx<DetilKelasDiajarMapelModel?>(null);
  var arg = Get.arguments;
  var listSiswa = <String>[].obs;
  var detil = Rx<DetilAbsenSiswaMapelModel?>(null);
  Future<void> fetchAbsenHarianByKelasTinjauan(
      String tanggal, String idKelas) async {
    try {
      final response = await http.get(
        Uri.parse(ApiUrl.getAbsenKelasDiajarMapel(
            tanggal, idKelas, intPage.value.toString())),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      statusCode.value = response.statusCode;
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        var responseData = DetilKelasDiajarMapelModel.fromJson(data);
        absen.value = responseData;
        countPage.value = responseData.data?.countPage ?? 0;

        var absenSiswa = data["data"]["absen"] as List<dynamic>;
        listSiswa.value =
            absenSiswa.map((e) => e["siswa"]["nama"].toString()).toList();
        print(data);
      } else if (response.statusCode == 404) {
        AllMaterial.messageScaffold(
          title: "Tidak ada absen pada tanggal yang diberikan.",
        );
        intPage.value = intPage.value - 1;
      } else {
        AllMaterial.messageScaffold(
          title: "Terjadi kesalahan: ${data['msg']}",
        );
      }
    } catch (e) {
      print("Error fetching absen harian: $e");
    }
  }

  Future<void> fetchDetilAbsenSiswaByIdMapel(String idSiswa) async {
    try {
      final response = await http.get(
        Uri.parse("${ApiUrl.urlGetDetilHistoriAbsenMapel}/$idSiswa"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      print(response.statusCode);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        detil.value = DetilAbsenSiswaMapelModel.fromJson(data);
        print(data);
      } else {
        print(data);
      }
    } catch (e) {
      print("${e}dawdwdw");
    }
  }

  int getJumlahMapelSiswa(String namaSiswa) {
    return absen.value?.data?.absen
            ?.where((data) => data.siswa?.nama == namaSiswa)
            .length ??
        0;
  }

  String getIdSiswa(
      List<AbsenElement>? siswaData, String namaSiswa, int totalKeys) {
    return siswaData
            ?.firstWhere(
              (siswa) => siswa.siswa?.nama == namaSiswa,
              orElse: () => AbsenElement(),
            )
            .absen
            ?.id
            .toString() ??
        "";
  }

  bool isAlpa(List<AbsenElement>? siswaData, String namaSiswa, int totalKeys) {
    return siswaData?.any((siswa) =>
            siswa.siswa?.nama == namaSiswa && siswa.absen?.status == "alpa" ||
            siswa.absen?.status == "") ??
        false;
  }

  @override
  void onInit() {
    fetchAbsenHarianByKelasTinjauan(
        DateFormat('yyyy-MM-dd').format(DateTime.now()),
        Get.arguments["idKelas"].toString());
    super.onInit();
  }
}
