import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/data/api_url.dart';
import 'package:presensi_siswa/app/modules/siswa/main_siswa/controllers/main_siswa_controller.dart';
import 'package:presensi_siswa/app/modules/siswa/main_siswa/views/main_siswa_view.dart';

class BuatAbsenHarianSiswaController extends GetxController {
  var selectedFile = Rx<File?>(null);
  var arg = Get.arguments;
  var jenisAbsenSiswa = "".obs;
  var status = "".obs;
  // TEXT EDITING CONTROLLER
  TextEditingController hariC = TextEditingController();
  TextEditingController jamC = TextEditingController();
  TextEditingController jenisAbsenC = TextEditingController();
  TextEditingController deskripsiC = TextEditingController();

  // FOCUS NODE
  FocusNode hariF = FocusNode();
  FocusNode jamF = FocusNode();
  FocusNode jenisAbsenF = FocusNode();
  final mainCont = Get.put(MainSiswaController());
  FocusNode jenisKelaminF = FocusNode();
  FocusNode deskripsiF = FocusNode();

  var dropdownItems = [
    "Absen Hadir",
    "Absen Izin",
    "Absen Dispensasi",
    "Absen Izin Telat",
    "Absen Telat",
    "Absen Sakit"
  ];

  var token = AllMaterial.box.read("token");

  // postAbsenSiswa
  Future<void> postAbsenSiswa(
      double? latitude, double? longitude, File file) async {
    var value = jenisAbsenSiswa.value;
    if (value == "Absen Hadir") {
      status.value = "hadir";
    } else if (value == "Absen Izin") {
      status.value = "izin";
    } else if (value == "Absen Dispensasi") {
      status.value = "dispen";
    } else if (value == "Absen Izin Telat") {
      status.value = "izin_telat";
    } else if (value == "Absen Sakit") {
      status.value = "sakit";
    } else if (value == "Absen Telat") {
      status.value = "telat";
    } else {
      status.value = "hadir";
    }
    update();
    try {
      Get.dialog(
        const Center(
          child: CircularProgressIndicator(
            backgroundColor: AllMaterial.colorPrimary,
            color: AllMaterial.colorSoftPrimary,
          ),
        ),
        barrierDismissible: false,
      );
      final uri = Uri.parse(ApiUrl.urlPostAbsenSiswa);
      final request = http.MultipartRequest('POST', uri);

      // header
      request.headers.addAll({
        "Authorization": "Bearer $token",
      });

      // field data
      request.fields['latitude'] = latitude?.toString() ?? '';
      request.fields['longitude'] = longitude?.toString() ?? '';
      request.fields['catatan'] = deskripsiC.text;
      print(status.value);
      request.fields['status'] = status.value;

      // Menambahkan file sebagai multipart
      final fileStream = http.MultipartFile.fromBytes(
        'dokumenFile',
        await file.readAsBytes(),
        filename: file.path.split('/').last,
      );
      request.files.add(fileStream);

      final streamedResponse = await request.send();

      final response = await http.Response.fromStream(streamedResponse);
      var data = jsonDecode(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(data);
        mainCont.fetchHistoriAbsen3Hari(DateTime.now().month);
        Get.to(() => const MainSiswaView());
      } else {
        print(data);
        if (Get.isDialogOpen == true) Get.back();
        AllMaterial.messageScaffold(
          title: "Terjadi kesalahan: ${data["msg"]}",
        );
      }
    } catch (e) {
      print(e.toString());
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
