import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/controller/general_controller.dart';
import 'package:presensi_siswa/app/data/api_url.dart';
import 'package:presensi_siswa/app/modules/siswa/absen_harian_siswa/views/absen_harian_siswa_view.dart';
import 'package:presensi_siswa/app/modules/siswa/edit_profil_siswa/views/edit_profil_siswa_view.dart';
import 'package:presensi_siswa/app/modules/siswa/main_siswa/controllers/main_siswa_controller.dart';
import 'package:presensi_siswa/app/widget/ubah_password/views/ubah_password_view.dart';
import 'package:presensi_siswa/app/widget/verifikasi_email/views/verifikasi_email_view.dart';

import '../controllers/profil_siswa_controller.dart';

class ProfilSiswaView extends GetView<ProfilSiswaController> {
  const ProfilSiswaView({super.key});

  @override
  Widget build(BuildContext context) {
    final mainCont = Get.put(MainSiswaController());
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
                      mainCont.profilSiswa.value?.data?.fotoProfile == "" ||
                              mainCont.profilSiswa.value?.data?.fotoProfile ==
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
                          : Container(
                              alignment: Alignment.center,
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1000),
                                color: AllMaterial.colorMint,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    mainCont.profilSiswa.value?.data
                                            ?.fotoProfile
                                            .toString()
                                            .replaceAll(
                                              "localhost",
                                              ApiUrl.baseUrl,
                                            ) ??
                                        "https://picsum.photos/200/300?grayscale",
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
                                  mainCont.profilSiswa.value?.data?.nama ?? ""),
                              style: AllMaterial.workSans(
                                fontWeight: AllMaterial.fontBold,
                                fontSize: 20,
                                color: AllMaterial.colorBlack,
                              ),
                            ),
                            Text(
                              "NIS : ${mainCont.profilSiswa.value?.data?.nis ?? ""}",
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
                          final genC = Get.put(GeneralController());
                          AllMaterial.cusDialogValidasi(
                            title: "Logout",
                            subtitle: "Apakah Kamu yakin?",
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
