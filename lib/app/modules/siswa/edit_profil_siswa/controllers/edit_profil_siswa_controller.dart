import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfilSiswaController extends GetxController {
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
    namaC.text = "Habil Arlian Asrori";
    nisC.text = "21424521232";
    emailC.text = "aabiljr@gmail.com";
    jenisKelaminC.text = "Laki-Laki";
    kelasJurusanC.text = "XI RPL 1";
    noTeleponC.text = "08214142141";
    super.onInit();
  }
}
