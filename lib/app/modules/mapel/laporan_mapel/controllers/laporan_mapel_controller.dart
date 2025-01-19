import 'package:get/get.dart';

class LaporanMapelController extends GetxController {
  var absen = [].obs;
  var selectedMonth = 6.obs;
  var bulan = "".obs;
  void updateHistoriAbsen(int month) {
    selectedMonth.value = month;
  }

  var kelas = [
    "X TKJ 1",
    "X TKJ 2",
    "X TKJ 3",
    "X RPL 1",
    "X RPL 2",
  ];
}
