import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/modules/siswa/main_siswa/controllers/main_siswa_controller.dart';

import '../controllers/jadwal_absen_siswa_controller.dart';

class JadwalAbsenSiswaView extends GetView<JadwalAbsenSiswaController> {
  const JadwalAbsenSiswaView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(JadwalAbsenSiswaController());
    var namaKelas = Get.arguments["namaKelas"] ?? "";
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
                child: Obx(
                  () {
                    var jumlahHari = controller.hari.value?.data?.length ?? 0;
                    if (jumlahHari == 0) {
                      return Padding(
                        padding: EdgeInsets.only(top: Get.height / 2.4),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Tidak ada jadwal yang ditambahkan",
                                style: AllMaterial.workSans(
                                  fontWeight: AllMaterial.fontMedium,
                                  color: AllMaterial.colorGreySec,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.hari.value?.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          var jadwal = controller.hari.value?.data?[index];
                          String hariSekarang = DateFormat('EEEE', 'id_ID')
                              .format(DateTime.now())
                              .toLowerCase();
                          bool tersedia = jadwal?.hari == hariSekarang;
                          return Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: AllMaterial.menuJadwal(
                              context:
                                  "Pukul ${AllMaterial.jamMenit(jadwal?.minJamMulai)}-${AllMaterial.jamMenit(jadwal?.maxJamSelesai)}",
                              title: "Jadwal Hari ${jadwal?.hari ?? ""}",
                              subtitleColor: tersedia,
                              subtitle:
                                  tersedia ? "Tersedia" : "Tidak Tersedia",
                              subtitleContext: "Status Absen :",
                              onTap: () async {
                                await controller.fetchDetilJadwalHariAbsenSiswa(
                                    jadwal?.hari ?? "");
                                if (controller.detil.value == null) {
                                  AllMaterial.messageScaffold(
                                      title:
                                          "Terjadi kesalahan, coba lagi nanti");
                                } else {
                                  var detil = controller.detil.value;
                                  AllMaterial.detilKonten(
                                    buttonLabel: "Tutup Jadwal",
                                    title:
                                        "Jadwal Hari ${detil?.data?[index].hari ?? ""}",
                                    subtitle:
                                        "Absen Harian di hari ${detil?.data?[index].hari ?? ""} ${tersedia ? "tersedia" : "tidak tersedia"} untuk kelas $namaKelas.",
                                    icon: const Icon(
                                      Icons.clear,
                                      color: AllMaterial.colorWhite,
                                    ),
                                    onTap: () => Get.back(),
                                    konten: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: AllMaterial.contextWidget(
                                                icon: MdiIcons.mapMarker,
                                                subtitle: "Lokasi Absen",
                                                title: detil
                                                        ?.data
                                                        ?.first
                                                        .koordinat
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
                                                    "Pukul ${AllMaterial.jamMenit(detil?.data?.first.jamMulai)} - ${AllMaterial.jamMenit(detil?.data?.first.jamSelesai)}",
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
                                                title:
                                                    "Total ${MainSiswaController.jumlahSiswa.value} Siswa",
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Expanded(
                                              child: AllMaterial.contextWidget(
                                                icon: MdiIcons.notebook,
                                                subtitle: "Jumlah Jam",
                                                title:
                                                    "${detil?.data?.length} Jam Pelajaran",
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 20),
                                        Container(
                                          width: Get.width,
                                          padding: const EdgeInsets.all(16),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                              color: AllMaterial.colorStroke,
                                              width: 1.5,
                                            ),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Jam di Hari ${detil?.data?.first.hari}",
                                                style: AllMaterial.workSans(
                                                  fontSize: 17,
                                                  color:
                                                      AllMaterial.colorPrimary,
                                                  fontWeight:
                                                      AllMaterial.fontSemiBold,
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
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Mata Pelajaran",
                                                          style: AllMaterial
                                                              .workSans(
                                                            fontSize: 14,
                                                            color: AllMaterial
                                                                .colorGreySec,
                                                            fontWeight:
                                                                AllMaterial
                                                                    .fontMedium,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 15),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children:
                                                              List.generate(
                                                            detil?.data
                                                                    ?.length ??
                                                                0,
                                                            (index) => Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      bottom: 5,
                                                                      right: 2),
                                                              child: Text(
                                                                detil
                                                                        ?.data?[
                                                                            index]
                                                                        .mapel
                                                                        ?.nama ??
                                                                    "",
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
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Jam Mulai & Selesai",
                                                          style: AllMaterial
                                                              .workSans(
                                                            fontSize: 14,
                                                            color: AllMaterial
                                                                .colorGreySec,
                                                            fontWeight:
                                                                AllMaterial
                                                                    .fontMedium,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 15),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children:
                                                              List.generate(
                                                            detil?.data
                                                                    ?.length ??
                                                                0,
                                                            (index) => Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      bottom:
                                                                          5),
                                                              child: Text(
                                                                "Pukul ${AllMaterial.jamMenit(detil?.data?[index].jamMulai ?? "")}-${AllMaterial.jamMenit(detil?.data?[index].jamSelesai ?? "")}",
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
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
                                }
                              },
                            ),
                          );
                        },
                      );
                    }
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
