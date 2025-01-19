import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:presensi_siswa/all_material.dart';

import '../controllers/verifikasi_email_controller.dart';

class VerifikasiEmailView extends GetView<VerifikasiEmailController> {
  const VerifikasiEmailView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifikasiEmailController());
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      appBar: AppBar(
        backgroundColor: AllMaterial.colorWhite,
        surfaceTintColor: AllMaterial.colorWhite,
        title: Text(
          "Verifikasi Email",
          style: AllMaterial.workSans(
            fontSize: 17,
            fontWeight: AllMaterial.fontSemiBold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Icon(
                          MdiIcons.email,
                          color: AllMaterial.colorPrimary,
                          size: 70,
                        ),
                        const SizedBox(height: 40),
                        AllMaterial.editableWidget(
                          controller: controller.emailC,
                          focusNode: controller.emailF,
                          label: "Alamat Email",
                          hintText: "Masukkan Alamat Email...",
                        ),
                        AllMaterial.editableWidget(
                          addRowButton: true,
                          rowButtonLabel: "Generate",
                          onTap: () {
                            // GENERATE KODE OTP
                          },
                          controller: controller.otpC,
                          hintText: "X - X - X - X",
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
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: AllMaterial.cusButton(
          onTap: () {
            // Get.to(() => const BuatAbsenHarianSiswaView());
          },
          label: "Konfirmasi Email",
          addIcon: false,
        ),
      ),
    );
  }
}
