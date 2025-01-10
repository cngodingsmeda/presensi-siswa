import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:presensi_siswa/all_material.dart';

import '../controllers/detil_laporan_siswa_controller.dart';

class DetilLaporanSiswaView extends GetView<DetilLaporanSiswaController> {
  const DetilLaporanSiswaView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetilLaporanSiswaController());
    return Scaffold(
      body: AllMaterial.containerLinear(
        padding: 0,
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      MdiIcons.arrowLeft,
                      color: AllMaterial.colorBlack,
                    ),
                  ),
                  SizedBox(
                    width: Get.width / 4.5,
                  ),
                  Text(
                    "Detil Laporan",
                    style: AllMaterial.workSans(
                      fontSize: 17,
                      fontWeight: AllMaterial.fontSemiBold,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: AllMaterial.menuJadwal(
                        context: "Pukul ${controller.jam[index]}",
                        title: "Jam ${controller.mapel[index]}",
                        subtitleContext: "Jenis Absen :",
                        subtitle: "Hadir",
                        onTap: () {
                          AllMaterial.detilKonten(
                            buttonLabel: "Tutup Laporan",
                            title: "Jam ${controller.mapel[index]}",
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
                                  children: [
                                    Expanded(
                                      child: AllMaterial.contextWidget(
                                        icon: MdiIcons.mapMarker,
                                        subtitle: "Lokasi Absen",
                                        title:
                                            "SMK Negeri 2 Mataram dengan Deskripsi Sangat Panjang",
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: AllMaterial.contextWidget(
                                        icon: MdiIcons.clock,
                                        subtitle: "Waktu Absen",
                                        title:
                                            "Pukul ${controller.jamAbsen[index]}",
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: AllMaterial.contextWidget(
                                        icon: MdiIcons.accountTie,
                                        subtitle: "Guru Mapel",
                                        title: "Heri Harjanto S.Pd",
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: AllMaterial.contextWidget(
                                        icon: MdiIcons.fingerprint,
                                        subtitle: "Jenis Absen",
                                        title: "Absen Hadir",
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
                                        "Tidak ada deskripsi yang ditambahkan.",
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
                                      Text(
                                        "Tidak ada bukti dokumen yang ditambahkan.",
                                        style: AllMaterial.workSans(
                                          color: AllMaterial.colorGreySec,
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
