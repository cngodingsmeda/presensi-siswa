import 'package:get/get.dart';
import 'package:intl/intl.dart';

class LaporanPetugasController extends GetxController {
  var absen = [].obs;
  var selectedMonth = 6.obs;
  var bulanIni = "".obs;
  void updateHistoriAbsen(int month) {
    selectedMonth.value = month;
  }

  @override
  void onInit() {
    DateTime now = DateTime.now();

    int bulan = now.month;
    String namaBulan = DateFormat('MMMM', 'id_ID').format(now);

    print('Bulan ini adalah $namaBulan ($bulan)');
    selectedMonth.value = bulan;
    bulanIni.value = namaBulan;
    super.onInit();
  }
}
