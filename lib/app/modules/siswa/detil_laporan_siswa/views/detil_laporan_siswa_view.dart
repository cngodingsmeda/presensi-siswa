import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/data/api_url.dart';
import 'package:presensi_siswa/app/widget/hero_image/hero_image.dart';
import 'package:presensi_siswa/app/widget/open_file/open_file_custom.dart';
import 'package:presensi_siswa/app/widget/preview_image/preview_image.dart';

import '../controllers/detil_laporan_siswa_controller.dart';

class DetilLaporanSiswaView extends GetView<DetilLaporanSiswaController> {
  const DetilLaporanSiswaView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetilLaporanSiswaController());
    // final lapCont = Get.put(LaporanSiswaController());
    var arg = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AllMaterial.colorWhite,
        surfaceTintColor: AllMaterial.colorWhite,
        centerTitle: true,
        title: Text(
          arg["tanggal"] ?? "",
          style: AllMaterial.workSans(
            fontSize: 17,
            fontWeight: AllMaterial.fontSemiBold,
          ),
        ),
      ),
      body: AllMaterial.containerLinear(
        padding: 0,
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.detilAbsen.length,
                  itemBuilder: (context, index) {
                    var mapel = controller.detilAbsen[index];
                    if (controller.detilAbsen.isEmpty) {
                      return Center(
                        child: Text(
                          "Tidak ada detail laporan yang tersedia",
                          style: AllMaterial.workSans(
                              color: AllMaterial.colorGreySec),
                        ),
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: AllMaterial.menuJadwal(
                        context:
                            "Pukul ${AllMaterial.jamMenit(mapel["absen"]["jam"] ?? "")}",
                        title: "Jam ${mapel["mapel"]["nama"]}",
                        subtitleContext: "Status Absen :",
                        subtitle: mapel["absen"]["status"],
                        subtitleColor: mapel["absen"]["status"] == "tidak_hadir"
                            ? false
                            : true,
                        onTap: () async {
                          var id = mapel["absen"]["id"];

                          await controller.fetchDetilAbsenSiswa(id);
                          var detil = controller.detil.value?.data;
                          AllMaterial.detilKonten(
                            buttonLabel: "Tutup Laporan",
                            title: "Jam ${mapel["mapel"]["nama"]}",
                            addSubtitle: false,
                            icon: const Icon(
                              Icons.clear,
                              color: AllMaterial.colorWhite,
                            ),
                            onTap: () => Get.back(),
                            konten: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: AllMaterial.contextWidget(
                                        icon: MdiIcons.mapMarker,
                                        subtitle: "Lokasi Absen",
                                        title: detil?.jadwal?.koordinat
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
                                            "Pukul ${AllMaterial.jamMenit(detil?.jam ?? "")}",
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
                                        icon: MdiIcons.accountTie,
                                        subtitle: "Guru Mapel",
                                        title: AllMaterial.formatNamaPanjang(
                                            detil?.jadwal?.guruMapel?.nama ??
                                                ""),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: AllMaterial.contextWidget(
                                        icon: MdiIcons.fingerprint,
                                        subtitle: "Jenis Absen",
                                        title:
                                            "Absen ${mapel["absen"]["status"]}",
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
                                        detil?.detail?.catatan == "" ||
                                                detil?.detail?.catatan == null
                                            ? "Tidak ada deskripsi yang ditambahkan."
                                            : "${detil?.detail?.catatan}",
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
                                                                  .value!
                                                                  .data!
                                                                  .file ??
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
              const SizedBox(height: 20),
              // const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
