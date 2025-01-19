import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfilMapelController extends GetxController {
 // TEXT EDITING CONTROLLER
  TextEditingController namaC = TextEditingController();
  TextEditingController nipC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController jenisKelaminC = TextEditingController();
  TextEditingController mapelC = TextEditingController();
  TextEditingController noTeleponC = TextEditingController();

  // FOCUS NODE
  FocusNode namaF = FocusNode();
  FocusNode nipF = FocusNode();
  FocusNode emailF = FocusNode();
  FocusNode jenisKelaminF = FocusNode();
  FocusNode mapelF = FocusNode();
  FocusNode noTeleponF = FocusNode();

  @override
  void onInit() {
    namaC.text = "Ratna S.Pd";
    nipC.text = "21424521232";
    emailC.text = "aabiljr@gmail.com";
    jenisKelaminC.text = "Laki-Laki";
    mapelC.text = "Matematika";
    noTeleponC.text = "08214142141";
    super.onInit();
  }
}
