import 'dart:convert';

import 'package:get/get.dart';
import 'package:presensi_siswa/all_material.dart';
import 'package:http/http.dart' as http;
import 'package:presensi_siswa/app/data/api_url.dart';
import 'package:presensi_siswa/app/model/model_petugas/detil_histori_tinjauan_absen_petugas_model.dart';
import 'package:presensi_siswa/app/model/model_petugas/histori_tinjauan_absen_siswa_petugas.dart';

class HistoriTinjauanPetugasController extends GetxController {
  var mapel = [
    "Pendidikan Agama",
    "Penjas Orkes",
    "Matematika",
  ];
  var jam = [
    "07:40",
    "07:50",
    "07:59",
  ];

  var nama = [
    "Kathryn Murphy",
    "John Doe",
    "Alice Johnson",
    "Michael Smith",
    "Sophia Davis",
    "William Brown",
    "Olivia Wilson",
    "James Garcia",
    "Isabella Martinez",
    "Liam Anderson",
  ];

  var stringTitle = ["Absen Belum Ditinjau", "Absen Diterima", "Absen Ditolak"];

  var absen = Rx<HistoriTinjauanAbsenPetugasModel?>(null);
  var absenPending = RxList<BelumDitinjau?>([null]);
  var absenDiterima = RxList<BelumDitinjau?>([null]);
  var absenDitolak = RxList<BelumDitinjau?>([null]);

  var token = AllMaterial.box.read("token");
  // var detilAbsen = Rx<DetilHistoriTinjauanAbsenPetugasModel?>(null);

  Future<void> fetchHistoriTinjauanPetugas() async {
    try {
      final response = await http.get(
        Uri.parse(ApiUrl.urlGetHistoriTinjauanPetugas),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      print(response.statusCode);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(data);
        var absen = HistoriTinjauanAbsenPetugasModel.fromJson(data);
        absenPending.value = absen.data?.belumDitinjau ?? [];
        absenDiterima.value = absen.data?.diterima ?? [];
        absenDitolak.value = absen.data?.ditolak ?? [];
      } else {
        print(data);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  var detilAbsen = Rx<DetilHistoriTinjauanAbsenPetugasModel?>(null);

  Future<void> fetchDetilHistoriTinjauanPetugas(String id) async {
    try {
      if (id.isEmpty) {
        print("Error: ID tidak boleh kosong");
        return;
      }

      final response = await http.get(
        Uri.parse("${ApiUrl.urlGetHistoriTinjauanPetugas}/$id"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      print("Status Code: ${response.statusCode}");

      // Decode respons JSON
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        // Validasi data
        if (data != null && data['data'] != null) {
          detilAbsen.value =
              DetilHistoriTinjauanAbsenPetugasModel.fromJson(data);
          print("Data berhasil dimuat");
        } else {
          print("Error: Data tidak valid atau kosong");
        }
      } else {
        print("Error: ${data['message'] ?? 'Gagal memuat data'}");
      }
    } catch (e) {
      print("Error: ${e.toString()}awawa");
    }
  }

  @override
  void onInit() async {
    await fetchHistoriTinjauanPetugas();
    super.onInit();
  }
}
