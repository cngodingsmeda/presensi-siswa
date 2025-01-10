import 'package:get/get.dart';

class LaporanSiswaController extends GetxController {
  var absen = [].obs;
  var selectedMonth = 6.obs;
  void updateHistoriAbsen(int month) {
    selectedMonth.value = month;
  }
}
