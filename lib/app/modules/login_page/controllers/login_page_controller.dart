import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/modules/login_page/views/login_page_view.dart';
import 'package:presensi_siswa/app/modules/mapel/main_mapel/views/main_mapel_view.dart';
import 'package:presensi_siswa/app/modules/petugas/main_petugas/views/main_petugas_view.dart';
import 'package:presensi_siswa/app/modules/siswa/main_siswa/views/main_siswa_view.dart';
import 'package:presensi_siswa/app/modules/walas/main_walas/views/main_walas_view.dart';

class LoginPageController extends GetxController {
  var isAuth = false.obs;
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

  void loginSementara(String username, String password) {
    try {
      if (userC.text.isEmpty || passC.text.isEmpty) {
        AllMaterial.messageScaffold(
          title: "Username atau Password tidak boleh kosong!",
        );
        return;
      } else {
        if (userC.text == "petugas" && passC.text == "petugas") {
          userC.text = "";
          passC.text = "";
          Get.offAll(() => const MainPetugasView());
          AllMaterial.messageScaffold(
            title: "Verifikasi Berhasil, Selamat Datang!",
          );
          AllMaterial.box.write("role", "petugas");
        } else if (userC.text == "siswa" && passC.text == "siswa") {
          userC.text = "";
          passC.text = "";
          Get.offAll(() => const MainSiswaView());
          AllMaterial.messageScaffold(
            title: "Verifikasi Berhasil, Selamat Datang!",
          );
          AllMaterial.box.write("role", "siswa");
        } else if (userC.text == "mapel" && passC.text == "mapel") {
          userC.text = "";
          passC.text = "";
          Get.offAll(() => const MainMapelView());
          AllMaterial.messageScaffold(
            title: "Verifikasi Berhasil, Selamat Datang!",
          );
          AllMaterial.box.write("role", "mapel");
        } else if (userC.text == "walas" && passC.text == "walas") {
          userC.text = "";
          passC.text = "";
          Get.offAll(() => const MainWalasView());
          AllMaterial.messageScaffold(
            title: "Verifikasi Berhasil, Selamat Datang!",
          );
          AllMaterial.box.write("role", "walas");
        } else {
          AllMaterial.messageScaffold(
            title: "Username atau Password salah!",
          );
        }
      }
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
    } else if (role == "walas") {
      return const MainWalasView();
    } else if (role == "petugas") {
      return const MainPetugasView();
    } else if (role == "mapel") {
      return const MainMapelView();
    } else {
      return const LoginPageView();
    }
  }

  void checkAuthentication() {
    // Membaca nilai role dari GetStorage
    var role = AllMaterial.box.read("role");
    print("Role: $role");

    // Pastikan role tidak null dan tidak kosong
    if (role != null && role != "") {
      isAuth.value = true;
    } else {
      isAuth.value = false;
    }

    // Update tampilan jika perlu
    update();
  }
}
