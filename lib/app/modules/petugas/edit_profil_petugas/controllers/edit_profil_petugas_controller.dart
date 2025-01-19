import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfilPetugasController extends GetxController {
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
    namaC.text = "Sustri Ardika";
    nipC.text = "21424521232";
    emailC.text = "aabiljr@gmail.com";
    jenisKelaminC.text = "Laki-Laki";
    agamaC.text = "Islam";
    noTeleponC.text = "08214142141";
    super.onInit();
  }
}
