import 'package:get/get.dart';

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

  var absenPending = [].obs;
  var absenDiterima = [].obs;
  var absenDitolak = [].obs;
}
