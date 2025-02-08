import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/data/api_url.dart';
import 'package:presensi_siswa/app/model/model_mapel/detil_absen_siswa_mapel_model.dart';
import 'package:presensi_siswa/app/model/model_mapel/detil_kelas_diajar_mapel_model.dart';

class DetilKelasDiajarMapelController extends GetxController {
  var absen = Rx<DetilKelasDiajarMapelModel?>(null);
  var intPage = 0.obs;
  var token = AllMaterial.box.read("token");
  var statusCode = 0.obs;
  var jumlahSiswa = 0.obs;
  var arg = Get.arguments;
  var listSiswa = <String>[].obs;
  var jumlahMenit = 0.obs;
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
        jumlahSiswa.value = responseData.data?.jumlahSiswa ?? 0;

        var absenSiswa = data["data"]["absen"] as List<dynamic>;
        jumlahMenit.value = data["data"]["waktu_belajar"] ?? 0;
        listSiswa.value =
            absenSiswa.map((e) => e["siswa"]["nama"].toString()).toList();
        print(data);
        update();
      } else if (response.statusCode == 404) {
        AllMaterial.messageScaffold(
          title: "Tidak ada absen pada tanggal yang diberikan.",
        );
      } else {
        AllMaterial.messageScaffold(
          title: "Terjadi kesalahan: ${data['msg']}",
        );
      }
    } catch (e) {
      print("Error fetching absen harian: $e");
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

  Future<void> fetchDetilAbsenSiswaByIdMapel(String idAbsen) async {
    try {
      final response = await http.get(
        Uri.parse("${ApiUrl.urlGetDetilHistoriAbsenMapel}/$idAbsen"),
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

  @override
  void onInit() {
    fetchAbsenHarianByKelasTinjauan(
        DateFormat('yyyy-MM-dd').format(arg["tanggal"]),
        arg["idKelas"].toString());
    super.onInit();
  }

  @override
  void onClose() {
    jumlahMenit.value = 0;
    update();
    super.onClose();
  }
}
