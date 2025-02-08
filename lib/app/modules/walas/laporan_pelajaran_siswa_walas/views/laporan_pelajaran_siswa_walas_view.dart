import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/data/api_url.dart';
import 'package:presensi_siswa/app/widget/hero_image/hero_image.dart';
import 'package:presensi_siswa/app/widget/open_file/open_file_custom.dart';
import 'package:presensi_siswa/app/widget/preview_image/preview_image.dart';

import '../controllers/laporan_pelajaran_siswa_walas_controller.dart';

class LaporanPelajaranSiswaWalasView
    extends GetView<LaporanPelajaranSiswaWalasController> {
  const LaporanPelajaranSiswaWalasView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LaporanPelajaranSiswaWalasController());
    var arg = Get.arguments;
    print(Get.arguments["tanggal"]);
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      appBar: AppBar(
        backgroundColor: AllMaterial.colorWhite,
        surfaceTintColor: AllMaterial.colorWhite,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              "${arg["kelas"] ?? ""} - ${AllMaterial.formatNamaPanjang(arg["nama"] ?? "")}",
              style: AllMaterial.workSans(
                color: AllMaterial.colorPrimary,
                fontWeight: AllMaterial.fontSemiBold,
                fontSize: 14,
              ),
            ),
            Text(
              Get.arguments["tanggal"] ?? "",
              style: AllMaterial.workSans(
                color: AllMaterial.colorGreySec,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Obx(
                () => ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.jadwal.value?.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    var absen = controller.jadwal.value?.data?[index];
                    return Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: AllMaterial.menuJadwal(
                        context:
                            "Pukul ${AllMaterial.jamMenit(absen?.jadwal?.jamMulai ?? "")} - ${AllMaterial.jamMenit(absen?.jadwal?.jamSelesai ?? "")}",
                        title: "Jam ${absen?.jadwal?.mapel?.nama ?? ""}",
                        subtitleContext: "Status Absen :",
                        subtitle: absen?.status ?? "",
                        onTap: () async {
                          await controller
                              .fetchDetilAbsenSiswaByIdWalas("${absen?.id}");
                          AllMaterial.detilKonten(
                            buttonLabel: "Tutup Laporan",
                            title: AllMaterial.hariTanggalBulanTahun(
                              absen?.tanggal?.toIso8601String() ?? "",
                            ),
                            addSubtitle: false,
                            icon: const Icon(
                              Icons.clear,
                              color: AllMaterial.colorWhite,
                            ),
                            onTap: () => Get.back(),
                            konten: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: AllMaterial.contextWidget(
                                        icon: MdiIcons.mapMarker,
                                        subtitle: "Lokasi Absen",
                                        title: controller
                                                .detil
                                                .value
                                                ?.data
                                                ?.jadwal
                                                ?.koordinat
                                                ?.namaTempat ??
                                            "",
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: AllMaterial.contextWidget(
                                        icon: MdiIcons.clock,
                                        subtitle: "Waktu Absen",
                                        title:
                                            "Pukul ${AllMaterial.jamMenit(controller.detil.value?.data?.jam ?? "")}",
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: AllMaterial.contextWidget(
                                        icon: MdiIcons.account,
                                        subtitle: "Nama Siswa",
                                        title: AllMaterial.formatNamaPanjang(
                                            arg["nama"] ?? ""),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: AllMaterial.contextWidget(
                                        icon: MdiIcons.fingerprint,
                                        subtitle: "Jenis Absen",
                                        title: "Absen ${absen?.status ?? ""}",
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Container(
                                  width: Get.width,
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      color: AllMaterial.colorStroke,
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Deskripsi Absen",
                                        style: AllMaterial.workSans(
                                          fontSize: 17,
                                          color: AllMaterial.colorPrimary,
                                          fontWeight: AllMaterial.fontSemiBold,
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                      Text(
                                        controller.detil.value?.data?.detail
                                                        ?.catatan ==
                                                    "" ||
                                                controller.detil.value?.data
                                                        ?.detail?.catatan ==
                                                    null
                                            ? "Tidak ada deksripsi yang ditambahkan."
                                            : "${controller.detil.value?.data?.detail?.catatan}",
                                        style: AllMaterial.workSans(
                                          color: AllMaterial.colorGreySec,
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                      Text(
                                        "Bukti Dokumen",
                                        style: AllMaterial.workSans(
                                          fontSize: 17,
                                          color: AllMaterial.colorPrimary,
                                          fontWeight: AllMaterial.fontSemiBold,
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                      Obx(
                                        () => controller.detil.value?.data
                                                        ?.file !=
                                                    "" &&
                                                controller.detil.value?.data
                                                        ?.file !=
                                                    null
                                            ? GestureDetector(
                                                onTap: () {
                                                  if (controller.detil.value
                                                              ?.data?.file !=
                                                          null ||
                                                      controller.detil.value
                                                              ?.data?.file !=
                                                          "") {
                                                    if (controller.detil.value!
                                                            .data!.file!
                                                            .endsWith(".jpg") ||
                                                        controller.detil.value!
                                                            .data!.file!
                                                            .endsWith(".png")) {
                                                      Get.to(
                                                        () => HeroImage(
                                                          imageUrl: controller
                                                                  .detil
                                                                  .value
                                                                  ?.data
                                                                  ?.file
                                                                  ?.replaceAll(
                                                                      "localhost",
                                                                      ApiUrl
                                                                          .baseUrl) ??
                                                              "https://picsum.photos/200/300?grayscale",
                                                        ),
                                                      );
                                                    } else if (controller.detil
                                                            .value!.data!.file!
                                                            .endsWith(".pdf") ||
                                                        controller.detil.value!
                                                            .data!.file!
                                                            .endsWith(
                                                                ".docx")) {
                                                      FileHandler.openFile(
                                                          controller
                                                                  .detil
                                                                  .value
                                                                  ?.data
                                                                  ?.file ??
                                                              "");
                                                    } else {
                                                      Get.back();
                                                      AllMaterial
                                                          .messageScaffold(
                                                        title:
                                                            "File tidak ditemukan, coba lagi nanti!",
                                                      );
                                                    }
                                                  } else {
                                                    AllMaterial.messageScaffold(
                                                      title:
                                                          "File tidak ditemukan, coba lagi nanti!",
                                                    );
                                                  }
                                                },
                                                child: PreviewImage(
                                                  fileName: controller.detil
                                                          .value?.data?.file
                                                          ?.replaceAll(
                                                              "localhost",
                                                              ApiUrl.baseUrl) ??
                                                      "https://picsum.photos/200/300?grayscale",
                                                ),
                                              )
                                            : Text(
                                                "Tidak ada bukti dokumen yang ditambahkan.",
                                                style: AllMaterial.workSans(
                                                  color:
                                                      AllMaterial.colorGreySec,
                                                ),
                                              ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            // const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
