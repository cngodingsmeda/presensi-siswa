import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:presensi_siswa/all_material.dart';

import '../controllers/jadwal_absen_siswa_controller.dart';

class JadwalAbsenSiswaView extends GetView<JadwalAbsenSiswaController> {
  const JadwalAbsenSiswaView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(JadwalAbsenSiswaController());
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
                    "Jadwal Absen",
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
                        context: "Pukul 07:00-13:55",
                        title: "Jadwal Hari Senin",
                        subtitle: "Tersedia",
                        subtitleContext: "Jadwal Absen :",
                        onTap: () {
                          AllMaterial.detilKonten(
                            buttonLabel: "Tutup Jadwal",
                            title: "Jadwal Hari Senin",
                            subtitle:
                                "Absen Harian di hari Senin tersedia untuk kelas XI Rekayasa Perangkat Lunak 1.",
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
                                        title: "Pukul 07:00 - 14:00",
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
                                        subtitle: "Jumlah Siswa",
                                        title: "Total 32 Siswa",
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: AllMaterial.contextWidget(
                                        icon: MdiIcons.notebook,
                                        subtitle: "Jumlah Jam",
                                        title: "3 Jam Pelajaran",
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
                                        "Jam di Hari Senin",
                                        style: AllMaterial.workSans(
                                          fontSize: 17,
                                          color: AllMaterial.colorPrimary,
                                          fontWeight: AllMaterial.fontSemiBold,
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Mata Pelajaran",
                                                  style: AllMaterial.workSans(
                                                    fontSize: 14,
                                                    color: AllMaterial
                                                        .colorGreySec,
                                                    fontWeight:
                                                        AllMaterial.fontMedium,
                                                  ),
                                                ),
                                                const SizedBox(height: 15),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: List.generate(
                                                    3,
                                                    (index) => Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 5,
                                                              right: 2),
                                                      child: Text(
                                                        controller.mapel[index],
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: AllMaterial
                                                            .workSans(
                                                          fontSize: 14,
                                                          color: AllMaterial
                                                              .colorBlack,
                                                          fontWeight:
                                                              AllMaterial
                                                                  .fontMedium,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Jam Mulai & Selesai",
                                                  style: AllMaterial.workSans(
                                                    fontSize: 14,
                                                    color: AllMaterial
                                                        .colorGreySec,
                                                    fontWeight:
                                                        AllMaterial.fontMedium,
                                                  ),
                                                ),
                                                const SizedBox(height: 15),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: List.generate(
                                                    3,
                                                    (index) => Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 5),
                                                      child: Text(
                                                        "Pukul ${controller.jam[index]}",
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: AllMaterial
                                                            .workSans(
                                                          fontSize: 14,
                                                          color: AllMaterial
                                                              .colorBlack,
                                                          fontWeight:
                                                              AllMaterial
                                                                  .fontMedium,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
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
