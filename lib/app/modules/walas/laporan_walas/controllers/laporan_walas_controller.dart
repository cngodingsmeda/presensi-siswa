import 'package:get/get.dart';

class LaporanWalasController extends GetxController {
  var absen = [].obs;
  var selectedMonth = 6.obs;
  void updateHistoriAbsen(int month) {
    selectedMonth.value = month;
  }
}
