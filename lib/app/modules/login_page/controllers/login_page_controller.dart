import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/data/api_url.dart';
import 'package:presensi_siswa/app/modules/login_page/views/login_page_view.dart';
import 'package:presensi_siswa/app/modules/mapel/main_mapel/views/main_mapel_view.dart';
import 'package:presensi_siswa/app/modules/petugas/main_petugas/views/main_petugas_view.dart';
import 'package:presensi_siswa/app/modules/siswa/main_siswa/views/main_siswa_view.dart';
import 'package:presensi_siswa/app/modules/walas/main_walas/views/main_walas_view.dart';

class LoginPageController extends GetxController {
  var isAuth = false.obs;
  var isMapel = false.obs;
  var isSiswa = false.obs;
  var isPetugas = false.obs;
  var isWalas = false.obs;
  var role = ''.obs;
  var isPasswordHidden = true.obs;
  TextEditingController userC = TextEditingController();
  TextEditingController passC = TextEditingController();
  FocusNode userF = FocusNode();
  FocusNode passF = FocusNode();
  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  @override
  void onInit() {
    checkAuthentication();
    super.onInit();
  }

  Future<dynamic> login(String username, String password) async {
    try {
      if (userC.text.isEmpty || passC.text.isEmpty) {
        AllMaterial.messageScaffold(
          title: "Username atau Password tidak boleh kosong!",
        );
        return;
      }

      Get.dialog(
        const Center(
          child: CircularProgressIndicator(
            backgroundColor: AllMaterial.colorPrimary,
            color: AllMaterial.colorSoftPrimary,
          ),
        ),
        barrierDismissible: false,
      );

      final response = await http.post(
        Uri.parse(ApiUrl.urlPostLogin),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(
          {
            "password": password,
            "textBody": username,
          },
        ),
      );

      Get.back();
      var data = jsonDecode(response.body);
      print(response.body);
      if (response.statusCode == 200) {
        var token = data["data"]["access_token"];
        AllMaterial.box.write("username", userC.text);
        AllMaterial.box.write("password", passC.text);
        AllMaterial.box.write("token", token);
        String roleData = data["data"]["role"];
        AllMaterial.box.write("role", roleData);
        isAuth.value = true;
        if (roleData.contains("guru_walas")) {
          isWalas.value = true;
          isAuth.value = true;
          Get.off(() => const MainWalasView());
          AllMaterial.messageScaffold(
            title: "Verifikasi Berhasil, Selamat Datang!",
          );
          userC.text = "";
          passC.text = "";
        } else if (roleData.contains("siswa")) {
          isAuth.value = true;
          isSiswa.value = true;
          Get.off(() => const MainSiswaView());
          AllMaterial.messageScaffold(
            title: "Verifikasi Berhasil, Selamat Datang!",
          );
          userC.text = "";
          passC.text = "";
        } else if (roleData.contains("guru_mapel")) {
          isMapel.value = true;
          isAuth.value = true;
          Get.off(() => const MainMapelView());
          AllMaterial.messageScaffold(
            title: "Verifikasi Berhasil, Selamat Datang!",
          );
          userC.text = "";
          passC.text = "";
        } else if (roleData.contains("petugas_bk")) {
          isPetugas.value = true;
          isAuth.value = true;
          Get.off(() => const MainPetugasView());
          AllMaterial.messageScaffold(
            title: "Verifikasi Berhasil, Selamat Datang!",
          );
          userC.text = "";
          passC.text = "";
        }
      } else {
        String jsonResponse = response.body;
        String message = "";

        Map<String, dynamic> parsedJson = json.decode(jsonResponse);

        if (parsedJson.containsKey('detail')) {
          List<dynamic> details = parsedJson['detail'];
          if (details.isNotEmpty) {
            message = details[0]['msg'];
            print('Error Message: $message');
          }
        }
        response.statusCode == 422
            ? AllMaterial.messageScaffold(
                title: message,
              )
            : AllMaterial.messageScaffold(
                title: data["msg"],
              );
      }
      update();
    } catch (e) {
      if (Get.isDialogOpen == true) Get.back();
      AllMaterial.messageScaffold(
        title: "Terjadi kesalahan: ${e.toString()}",
      );
      throw Exception(e.toString());
    }
  }

  Widget periksaRole() {
    String role = AllMaterial.box.read("role") ?? "";
    print("Role yang dibaca: $role");

    if (role == "siswa") {
      return const MainSiswaView();
    } else if (role == "guru_walas") {
      return const MainWalasView();
    } else if (role == "petugas_bk") {
      return const MainPetugasView();
    } else if (role == "guru_mapel") {
      return const MainMapelView();
    } else {
      return const LoginPageView();
    }
  }

  void checkAuthentication() {
    var token = AllMaterial.box.read("token");
    print("token: $token");

    if (token != null && token != "") {
      isAuth.value = true;
    } else {
      isAuth.value = false;
    }
    update();
  }
}
