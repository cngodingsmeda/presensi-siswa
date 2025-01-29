import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_siswa/app/modules/siswa/main_siswa/controllers/main_siswa_controller.dart';

class EditProfilSiswaController extends GetxController {
  var mainCont = Get.put(MainSiswaController());
  // TEXT EDITING CONTROLLER
  TextEditingController namaC = TextEditingController();
  TextEditingController nisC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController jenisKelaminC = TextEditingController();
  TextEditingController kelasJurusanC = TextEditingController();
  TextEditingController noTeleponC = TextEditingController();

  // FOCUS NODE
  FocusNode namaF = FocusNode();
  FocusNode nisF = FocusNode();
  FocusNode emailF = FocusNode();
  FocusNode jenisKelaminF = FocusNode();
  FocusNode kelasJurusanF = FocusNode();
  FocusNode noTeleponF = FocusNode();

  @override
  void onInit() {
    namaC.text = mainCont.profilSiswa.value?.data?.nama ?? "";
    nisC.text = mainCont.profilSiswa.value?.data?.nis ?? "";
    emailC.text = mainCont.profilSiswa.value?.data?.email ?? "";
    jenisKelaminC.text =
        mainCont.profilSiswa.value?.data?.jenisKelamin == "laki"
            ? "Laki-Laki"
            : "Perempuan";
    kelasJurusanC.text = mainCont.profilSiswa.value?.data?.kelas?.nama ?? "";
    noTeleponC.text = mainCont.profilSiswa.value?.data?.noTelepon ?? "";
    super.onInit();
  }
}
