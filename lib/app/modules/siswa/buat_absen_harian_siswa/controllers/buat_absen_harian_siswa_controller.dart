import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuatAbsenHarianSiswaController extends GetxController {
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
    namaC.text = "Senin, 25 Agustus 2024";
    nisC.text = "09:41";
    emailC.text = "Absen Hadir";
    jenisKelaminC.text = "Masukkan Deskripsi absen...";
    super.onInit();
  }

    var mapel = [
    "Matematika",
    "Pendidikan Agama Islam & Budi Pekerti",
    "Penjas Orkes",
  ];
  var jam = ["07:00 - 09:25", "09:25 - 11:30", "11:30 - 14:00"];
}
