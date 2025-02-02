import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'package:presensi_siswa/all_material.dart';

class BuatAbsenHarianSiswaController extends GetxController {
  var selectedFile = Rx<File?>(null);
  var arg = Get.arguments;
  // TEXT EDITING CONTROLLER
  TextEditingController hariC = TextEditingController();
  TextEditingController jamC = TextEditingController();
  TextEditingController jenisAbsenC = TextEditingController();
  TextEditingController deskripsiC = TextEditingController();

  // FOCUS NODE
  FocusNode hariF = FocusNode();
  FocusNode jamF = FocusNode();
  FocusNode jenisAbsenF = FocusNode();
  FocusNode jenisKelaminF = FocusNode();
  FocusNode deskripsiF = FocusNode();

  String jenisAbsen(String value) {
    if (value == "Absen Hadir") {
      return "hadir";
    } else if (value == "Absen Izin") {
      return "izin";
    } else if (value == "Absen Dispensasi") {
      return "dispen";
    } else if (value == "Absen Izin Telat") {
      return "izin_telat";
    } else if (value == "Absen Sakit") {
      return "sakit";
    } else if (value == "Absen Telat") {
      return "telat";
    } else {
      return "hadir";
    }
  }

  Future<void> pickDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['docx', 'pdf', 'jpg', 'jpeg', 'png'],
    );

    if (result != null) {
      selectedFile.value = File(result.files.single.path!);
    } else {
      selectedFile.value = null;
      AllMaterial.messageScaffold(
        title: "File tidak ditemukan!",
      );
    }
  }

  void removeFile() {
    selectedFile.value = null;
  }

  Future<void> pickImageFromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      selectedFile.value = File(pickedFile.path);
    } else {
      AllMaterial.messageScaffold(
        title: "Gambar tidak ditemukan!",
      );
    }
  }

  void showImageSourceDialog() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(16),
        height: 150,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: Text(
                'Ambil dari Kamera',
                style: AllMaterial.workSans(),
              ),
              onTap: () {
                pickImageFromCamera();
                Get.back();
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo),
              title: Text(
                'Ambil dari Penyimpanan',
                style: AllMaterial.workSans(),
              ),
              onTap: () {
                pickDocument();
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onInit() {
    hariC.text =
        AllMaterial.hariTanggalBulanTahun(DateTime.now().toIso8601String());
    jamC.text = DateFormat('HH:mm').format(DateTime.now());
    jenisAbsenC.text = "Absen Hadir";
    super.onInit();
  }
}
