import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/controller/general_controller.dart';
import 'package:presensi_siswa/app/data/api_url.dart';
import 'package:presensi_siswa/app/modules/walas/edit_profil_walas/views/edit_profil_walas_view.dart';
import 'package:presensi_siswa/app/modules/walas/main_walas/controllers/main_walas_controller.dart';
import 'package:presensi_siswa/app/widget/hero_image/hero_image.dart';
import 'package:presensi_siswa/app/widget/ubah_password/views/ubah_password_view.dart';
import 'package:presensi_siswa/app/widget/verifikasi_email/views/verifikasi_email_view.dart';

import '../controllers/profil_walas_controller.dart';

class ProfilWalasView extends GetView<ProfilWalasController> {
  const ProfilWalasView({super.key});
  @override
  Widget build(BuildContext context) {
    final mainCont = Get.put(MainWalasController());
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      body: AllMaterial.containerLinear(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
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
                      mainCont.profilWalas.value?.data?.fotoProfile == "" ||
                              mainCont.profilWalas.value?.data?.fotoProfile ==
                                  null
                          ? Container(
                              alignment: Alignment.center,
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1000),
                                color: AllMaterial.colorMint,
                              ),
                              child: Obx(
                                () => Text(
                                  mainCont.userNameFilter.value,
                                  style: AllMaterial.workSans(
                                    color: AllMaterial.colorWhite,
                                    fontWeight: AllMaterial.fontSemiBold,
                                    fontSize: 40,
                                  ),
                                ),
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                Get.to(
                                  () => HeroImage(
                                    namePath:
                                        "${mainCont.profilWalas.value?.data?.nama?.replaceAll(" ", "-")}-fotoProfile",
                                    imageUrl: mainCont.profilWalas.value?.data
                                            ?.fotoProfile
                                            ?.replaceAll(
                                                "localhost", ApiUrl.baseUrl) ??
                                        "https://picsum.photos/200/300?grayscale",
                                  ),
                                );
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1000),
                                  color: AllMaterial.colorMint,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      mainCont.profilWalas.value?.data
                                              ?.fotoProfile
                                              ?.replaceAll(
                                            "localhost",
                                            ApiUrl.baseUrl,
                                          ) ??
                                          "https://picsum.photos/200/300?grayscale",
                                    ),
                                  ),
                                ),
                              ),
                            ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AllMaterial.formatNamaPanjang(
                                  mainCont.profilWalas.value?.data?.nama ?? ""),
                              style: AllMaterial.workSans(
                                fontWeight: AllMaterial.fontBold,
                                fontSize: 20,
                                color: AllMaterial.colorBlack,
                              ),
                            ),
                            Text(
                              "NIP : ${mainCont.profilWalas.value?.data?.nip ?? ""}",
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
                          Get.to(() => const EditProfilWalasView());
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
                          // Get.to(() => const AbsenHarianSiswaPetugasView());
                        },
                        title: "Absen Harian",
                        icon: MdiIcons.calendarBlank,
                      ),
                      AllMaterial.profilWidget(
                        onTap: () {
                          var email = mainCont.profilWalas.value?.data?.email;
                          if (email == "" || email == null) {
                            Get.to(() => const VerifikasiEmailView());
                          } else {
                            AllMaterial.messageScaffold(
                              title: "Email Anda telah terverifikasi!",
                            );
                          }
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
                          final genC = Get.put(GeneralController());
                          AllMaterial.cusDialogValidasi(
                            title: "Logout",
                            subtitle: "Apakah Anda yakin?",
                            onConfirm: () async {
                              await genC.logout();
                              Get.back();
                            },
                            onCancel: () => Get.back(),
                          );
                        },
                        title: "Logout",
                        icon: MdiIcons.logout,
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
