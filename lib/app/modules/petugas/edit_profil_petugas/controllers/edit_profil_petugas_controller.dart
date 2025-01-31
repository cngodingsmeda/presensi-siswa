import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_siswa/app/modules/petugas/main_petugas/controllers/main_petugas_controller.dart';

class EditProfilPetugasController extends GetxController {
  final mainCont = Get.put(MainPetugasController());

  // TEXT EDITING CONTROLLER
  TextEditingController namaC = TextEditingController();
  TextEditingController nipC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController jenisKelaminC = TextEditingController();
  TextEditingController agamaC = TextEditingController();
  TextEditingController noTeleponC = TextEditingController();

  // FOCUS NODE
  FocusNode namaF = FocusNode();
  FocusNode nipF = FocusNode();
  FocusNode emailF = FocusNode();
  FocusNode jenisKelaminF = FocusNode();
  FocusNode agamaF = FocusNode();
  FocusNode noTeleponF = FocusNode();

  @override
  void onInit() {
    namaC.text = mainCont.profilPetugas.value?.data?.nama ?? "";
    nipC.text = mainCont.profilPetugas.value?.data?.nip ?? "";
    emailC.text = mainCont.profilPetugas.value?.data?.email ?? "";
    jenisKelaminC.text = mainCont.profilPetugas.value?.data?.jenisKelamin ?? "";
    agamaC.text = mainCont.profilPetugas.value?.data?.agama ?? "";
    noTeleponC.text = mainCont.profilPetugas.value?.data?.noTelepon ?? "";
    super.onInit();
  }
}
