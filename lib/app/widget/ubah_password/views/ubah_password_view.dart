import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:presensi_siswa/all_material.dart';

import '../controllers/ubah_password_controller.dart';

class UbahPasswordView extends GetView<UbahPasswordController> {
  const UbahPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UbahPasswordController());
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      appBar: AppBar(
        backgroundColor: AllMaterial.colorWhite,
        surfaceTintColor: AllMaterial.colorWhite,
        title: Text(
          "Ubah Password",
          style: AllMaterial.workSans(
            fontSize: 17,
            fontWeight: AllMaterial.fontSemiBold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(
            () => controller.isOtpComplete.isTrue
                ? Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Icon(
                                  MdiIcons.lock,
                                  color: AllMaterial.colorPrimary,
                                  size: 70,
                                ),
                                const SizedBox(height: 40),
                                AllMaterial.editableWidget(
                                  controller: controller.passBefC,
                                  focusNode: controller.passBefF,
                                  label: "Password Sebelumnya",
                                  hintText: "Masukkan Password sebelumnya...",
                                ),
                                AllMaterial.editableWidget(
                                  controller: controller.passNewC,
                                  focusNode: controller.passNewF,
                                  label: "Password Baru",
                                  hintText: "Masukkan Password baru...",
                                ),
                                AllMaterial.editableWidget(
                                  controller: controller.confirmPassNewC,
                                  focusNode: controller.confirmPassNewF,
                                  hintText: "Harap konfirmasi Password...",
                                  label: "Konfirmasi Password Baru",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Icon(
                                  MdiIcons.key,
                                  color: AllMaterial.colorPrimary,
                                  size: 70,
                                ),
                                const SizedBox(height: 40),
                                AllMaterial.editableWidget(
                                  hintText: "X - X - X - X",
                                  addRowButton: true,
                                  rowButtonLabel: "Generate",
                                  onTap: () {
                                    // GENERATE KODE OTP
                                  },
                                  controller: controller.otpC,
                                  focusNode: controller.otpF,
                                  label: "Konfirmasi Kode-OTP",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Material(
                        color: Colors.transparent,
                        child: RichText(
                          text: TextSpan(
                            text: "Tidak menerima kode? ",
                            style: AllMaterial.workSans(
                              color: AllMaterial.colorGreySec,
                            ),
                            children: [
                              WidgetSpan(
                                child: InkWell(
                                  onTap: () {},
                                  splashColor:
                                      AllMaterial.colorPrimary.withOpacity(0.3),
                                  highlightColor:
                                      AllMaterial.colorPrimary.withOpacity(0.1),
                                  child: Text(
                                    "Kirim Ulang",
                                    style: AllMaterial.workSans(
                                      color: AllMaterial.colorPrimary,
                                      fontWeight: AllMaterial.fontSemiBold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Obx(
          () => controller.isOtpComplete.isFalse
              ? AllMaterial.cusButton(
                  onTap: () {
                    // KONFIRMASI OTP
                    controller.isOtpComplete.toggle();
                  },
                  label: "Konfirmasi Kode-OTP",
                  addIcon: false,
                )
              : AllMaterial.cusButton(
                  onTap: () {
                    // GANTI PASSWORD
                  },
                  label: "Ubah Password",
                  addIcon: false,
                ),
        ),
      ),
    );
  }
}
