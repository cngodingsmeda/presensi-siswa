import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/modules/login_page/views/login_page_view.dart';
import 'package:presensi_siswa/app/modules/siswa/absen_harian_siswa/views/absen_harian_siswa_view.dart';
import 'package:presensi_siswa/app/modules/siswa/edit_profil_siswa/views/edit_profil_siswa_view.dart';
import 'package:presensi_siswa/app/widget/ubah_password/views/ubah_password_view.dart';
import 'package:presensi_siswa/app/widget/verifikasi_email/views/verifikasi_email_view.dart';

import '../controllers/profil_siswa_controller.dart';

class ProfilSiswaView extends GetView<ProfilSiswaController> {
  const ProfilSiswaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      body: AllMaterial.containerLinear(
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Profil Saya",
                    style: AllMaterial.workSans(
                      fontSize: 17,
                      fontWeight: AllMaterial.fontSemiBold,
                    ),
                  ),
                  const SizedBox(height: 17),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.bottomRight,
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          boxShadow: [AllMaterial.topShadow],
                          borderRadius: BorderRadius.circular(1000),
                          color: AllMaterial.colorMint,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Habil Arlian Asrori",
                              style: AllMaterial.workSans(
                                fontWeight: AllMaterial.fontBold,
                                fontSize: 20,
                                color: AllMaterial.colorBlack,
                              ),
                            ),
                            Text(
                              "NIS : 21424521232",
                              style: AllMaterial.workSans(
                                fontWeight: AllMaterial.fontMedium,
                                fontSize: 14,
                                color: AllMaterial.colorGreySec,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Column(
                    children: [
                      AllMaterial.profilWidget(
                        onTap: () {
                          Get.to(() => const EditProfilSiswaView());
                        },
                        title: "Edit Profil",
                        icon: MdiIcons.pencilBoxMultiple,
                      ),
                      AllMaterial.profilWidget(
                        onTap: () {
                          Get.to(() => const UbahPasswordView());
                        },
                        title: "Ubah Password",
                        icon: MdiIcons.lock,
                      ),
                      AllMaterial.profilWidget(
                        onTap: () {
                          Get.to(() => const AbsenHarianSiswaView());
                        },
                        title: "Absen Harian",
                        icon: MdiIcons.calendarBlank,
                      ),
                      AllMaterial.profilWidget(
                        onTap: () {
                          Get.to(() => const VerifikasiEmailView());
                        },
                        title: "Verifikasi Email",
                        icon: MdiIcons.email,
                      ),
                      AllMaterial.profilWidget(
                        onTap: () {},
                        title: "Laporkan Error",
                        icon: MdiIcons.bug,
                      ),
                      AllMaterial.profilWidget(
                        onTap: () {
                          Get.off(() => const LoginPageView());
                        },
                        title: "Logout",
                        icon: MdiIcons.logout,
                      ),
                    ],
                  ),
                  const SizedBox(height: 200),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
