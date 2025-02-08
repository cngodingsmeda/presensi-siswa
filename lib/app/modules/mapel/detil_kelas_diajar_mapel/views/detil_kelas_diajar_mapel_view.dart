import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/data/api_url.dart';
import 'package:presensi_siswa/app/model/model_mapel/detil_kelas_diajar_mapel_model.dart';
import 'package:presensi_siswa/app/modules/mapel/main_mapel/controllers/main_mapel_controller.dart';
import 'package:presensi_siswa/app/widget/hero_image/hero_image.dart';
import 'package:presensi_siswa/app/widget/open_file/open_file_custom.dart';
import 'package:presensi_siswa/app/widget/preview_image/preview_image.dart';

import '../controllers/detil_kelas_diajar_mapel_controller.dart';

class DetilKelasDiajarMapelView
    extends GetView<DetilKelasDiajarMapelController> {
  const DetilKelasDiajarMapelView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetilKelasDiajarMapelController());
    final mainCont = Get.put(MainMapelController());

    var namaMapel = mainCont.profilMapel.value?.data?.mapel?.nama ?? "";
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      appBar: AppBar(
        backgroundColor: AllMaterial.colorWhite,
        surfaceTintColor: AllMaterial.colorWhite,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              "${controller.arg["namaKelas"]} - $namaMapel",
              style: AllMaterial.workSans(
                color: AllMaterial.colorPrimary,
                fontWeight: AllMaterial.fontSemiBold,
                fontSize: 14,
              ),
            ),
            Text(
              AllMaterial.hariTanggalBulanTahun(
                controller.arg["tanggal"].toString(),
              ),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AllMaterial.outlineText(
                              title: "Siswa Hadir",
                              subtitle:
                                  "${controller.arg["jumlahHadir"]} orang",
                            ),
                            const SizedBox(width: 8),
                            Obx(
                              () => AllMaterial.outlineText(
                                title: "Jumlah Siswa",
                                subtitle:
                                    "${controller.jumlahMenit.value} menit",
                              ),
                            ),
                            const SizedBox(width: 8),
                            Obx(
                              () => AllMaterial.outlineText(
                                title: "Guru Walas",
                                subtitle: AllMaterial.formatNamaPanjang(
                                    controller.absen.value?.data?.guruWalas
                                            ?.nama ??
                                        "-"),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          4,
                          (index) {
                            List<String> statuses = [
                              "Hadir",
                              "Alpa",
                              "Izin",
                              "Sakit",
                            ];
                            String status = statuses[index];

                            Color borderColor;
                            IconData? widget;

                            if (status == "Hadir") {
                              borderColor = AllMaterial.colorPrimary;
                              widget = Icons.check;
                            } else if (status == "Izin") {
                              borderColor = AllMaterial.colorBlue;
                              widget = MdiIcons.fileChart;
                            } else if (status == "Alpa") {
                              borderColor = AllMaterial.colorRed;
                              widget = MdiIcons.close;
                            } else if (status == "Sakit") {
                              widget = MdiIcons.clipboardPlus;
                              borderColor = AllMaterial.colorMint;
                            } else {
                              borderColor = Colors.grey;
                            }

                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  widget,
                                  color: borderColor,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  "= $status",
                                  style: AllMaterial.workSans(
                                    fontWeight: AllMaterial.fontRegular,
                                    fontSize: 14,
                                    color: AllMaterial.colorGreySec,
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 30),
                      Obx(
                        () => controller.statusCode.value == 404
                            ? Center(
                                child: Text(
                                  "Tidak ada absen pada tanggal yang diberikan",
                                  style: AllMaterial.workSans(
                                    color: AllMaterial.colorGreySec,
                                  ),
                                ),
                              )
                            : controller.listSiswa.isEmpty
                                ? Center(
                                    child: Text(
                                      "Data siswa tidak ditemukan",
                                      style: AllMaterial.workSans(
                                        color: AllMaterial.colorGreySec,
                                      ),
                                    ),
                                  )
                                : ListView.builder(
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    itemCount: controller.listSiswa.length,
                                    itemBuilder: (context, index) {
                                      final namaSiswa =
                                          controller.listSiswa[index];
                                      final totalKeys = controller
                                          .getJumlahMapelSiswa(namaSiswa);
                                      final siswaData =
                                          controller.absen.value?.data?.absen;

                                      return Column(
                                        children: [
                                          ListTile(
                                            contentPadding: EdgeInsets.zero,
                                            leading: Text(
                                              "${index + 1}.",
                                              style: AllMaterial.workSans(
                                                fontWeight:
                                                    AllMaterial.fontBold,
                                                fontSize: 15,
                                                color: AllMaterial.colorBlack,
                                              ),
                                            ),
                                            title: Text(
                                              namaSiswa,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: AllMaterial.workSans(
                                                fontWeight:
                                                    AllMaterial.fontRegular,
                                                fontSize: 14,
                                                color: AllMaterial.colorGreySec,
                                              ),
                                            ),
                                            trailing: StatusRow(
                                              namaSiswa: namaSiswa,
                                              dataSiswa: siswaData,
                                              jumlahMapel: totalKeys,
                                            ),
                                            onTap: () async {
                                              var data = siswaData?[index];
                                              final idSiswa = data?.siswa?.id;

                                              if (data?.absen == null) {
                                                print(idSiswa);
                                                AllMaterial.messageScaffold(
                                                  title:
                                                      "Tidak ada data absen untuk siswa terkait!",
                                                );
                                              } else {
                                                if (data?.absen?.status
                                                            ?.toLowerCase() ==
                                                        "alpa" ||
                                                    data?.absen?.status == "") {
                                                  AllMaterial.messageScaffold(
                                                    title:
                                                        "Siswa melewatkan absen harian!",
                                                  );
                                                } else {
                                                  print(idSiswa);
                                                  await controller
                                                      .fetchDetilAbsenSiswaByIdMapel(
                                                          "${data?.absen?.id ?? 0}");
                                                  AllMaterial.detilKonten(
                                                    buttonLabel:
                                                        "Tutup Laporan",
                                                    title: AllMaterial
                                                        .hariTanggalBulanTahun(
                                                      controller.detil.value
                                                              ?.data?.tanggal
                                                              ?.toIso8601String() ??
                                                          DateTime.now()
                                                              .toIso8601String(),
                                                    ),
                                                    addSubtitle: false,
                                                    icon: const Icon(
                                                      Icons.clear,
                                                      color: AllMaterial
                                                          .colorWhite,
                                                    ),
                                                    onTap: () => Get.back(),
                                                    konten: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: AllMaterial
                                                                  .contextWidget(
                                                                icon: MdiIcons
                                                                    .mapMarker,
                                                                subtitle:
                                                                    "Lokasi Absen",
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
                                                            const SizedBox(
                                                                width: 10),
                                                            Expanded(
                                                              child: AllMaterial
                                                                  .contextWidget(
                                                                icon: MdiIcons
                                                                    .clock,
                                                                subtitle:
                                                                    "Waktu Absen",
                                                                title:
                                                                    "Pukul ${AllMaterial.jamMenit(controller.detil.value?.data?.jam ?? "")}",
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                            height: 20),
                                                        Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: AllMaterial
                                                                  .contextWidget(
                                                                icon: MdiIcons
                                                                    .account,
                                                                subtitle:
                                                                    "Nama Siswa",
                                                                title: AllMaterial
                                                                    .formatNamaPanjang(
                                                                        data?.siswa?.nama ??
                                                                            ""),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                width: 10),
                                                            Expanded(
                                                              child: AllMaterial
                                                                  .contextWidget(
                                                                icon: MdiIcons
                                                                    .fingerprint,
                                                                subtitle:
                                                                    "Jenis Absen",
                                                                title:
                                                                    "Absen ${data?.absen?.status ?? ""}",
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                            height: 20),
                                                        Container(
                                                          width: Get.width,
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(16),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            border: Border.all(
                                                              color: AllMaterial
                                                                  .colorStroke,
                                                              width: 1.5,
                                                            ),
                                                          ),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "Deskripsi Absen",
                                                                style: AllMaterial
                                                                    .workSans(
                                                                  fontSize: 17,
                                                                  color: AllMaterial
                                                                      .colorPrimary,
                                                                  fontWeight:
                                                                      AllMaterial
                                                                          .fontSemiBold,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                  height: 15),
                                                              Text(
                                                                controller.detil.value?.data?.detail?.catatan ==
                                                                            "" ||
                                                                        controller.detil.value?.data?.detail?.catatan ==
                                                                            null
                                                                    ? "Tidak ada deksripsi yang ditambahkan."
                                                                    : "${controller.detil.value?.data?.detail?.catatan}",
                                                                style: AllMaterial
                                                                    .workSans(
                                                                  color: AllMaterial
                                                                      .colorGreySec,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                  height: 15),
                                                              Text(
                                                                "Bukti Dokumen",
                                                                style: AllMaterial
                                                                    .workSans(
                                                                  fontSize: 17,
                                                                  color: AllMaterial
                                                                      .colorPrimary,
                                                                  fontWeight:
                                                                      AllMaterial
                                                                          .fontSemiBold,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                  height: 15),
                                                              Obx(
                                                                () => controller.detil.value?.data?.file !=
                                                                            "" &&
                                                                        controller.detil.value?.data?.file !=
                                                                            null
                                                                    ? GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          if (controller.detil.value?.data?.file != null ||
                                                                              controller.detil.value?.data?.file != "") {
                                                                            if (controller.detil.value!.data!.file!.endsWith(".jpg") ||
                                                                                controller.detil.value!.data!.file!.endsWith(".png")) {
                                                                              Get.to(
                                                                                () => HeroImage(
                                                                                  imageUrl: controller.detil.value?.data?.file?.replaceAll("localhost", ApiUrl.baseUrl) ?? "https://picsum.photos/200/300?grayscale",
                                                                                ),
                                                                              );
                                                                            } else if (controller.detil.value!.data!.file!.endsWith(".pdf") || controller.detil.value!.data!.file!.endsWith(".docx")) {
                                                                              FileHandler.openFile(controller.detil.value?.data?.file ?? "");
                                                                            } else {
                                                                              Get.back();
                                                                              AllMaterial.messageScaffold(
                                                                                title: "File tidak ditemukan, coba lagi nanti!",
                                                                              );
                                                                            }
                                                                          } else {
                                                                            AllMaterial.messageScaffold(
                                                                              title: "File tidak ditemukan, coba lagi nanti!",
                                                                            );
                                                                          }
                                                                        },
                                                                        child:
                                                                            PreviewImage(
                                                                          fileName:
                                                                              controller.detil.value?.data?.file?.replaceAll("localhost", ApiUrl.baseUrl) ?? "https://picsum.photos/200/300?grayscale",
                                                                        ),
                                                                      )
                                                                    : Text(
                                                                        "Tidak ada bukti dokumen yang ditambahkan.",
                                                                        style: AllMaterial
                                                                            .workSans(
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
                                                }
                                              }
                                            },
                                          ),
                                          const Divider(
                                              color: AllMaterial.colorStroke),
                                        ],
                                      );
                                    },
                                  ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(
          top: 20,
          right: 20,
          left: 20,
          bottom: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(5),
                overlayColor: AllMaterial.colorPrimary,
              ),
              onPressed: () {},
              child: Text(
                "Sebelumnya",
                style: AllMaterial.workSans(
                  fontWeight: AllMaterial.fontMedium,
                  fontSize: 14,
                  color: AllMaterial.colorPrimary,
                ),
              ),
            ),
            Text(
              "${controller.listSiswa.length} dari ${controller.jumlahSiswa.value}",
              style: AllMaterial.workSans(
                fontSize: 14,
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(5),
                overlayColor: AllMaterial.colorPrimary,
              ),
              onPressed: () {},
              child: Text(
                "Selanjutnya",
                style: AllMaterial.workSans(
                  fontWeight: AllMaterial.fontMedium,
                  fontSize: 14,
                  color: AllMaterial.colorPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StatusRow extends StatelessWidget {
  final List<AbsenElement>? dataSiswa;
  final int? jumlahMapel;
  final String? namaSiswa;

  const StatusRow({
    super.key,
    required this.dataSiswa,
    required this.jumlahMapel,
    required this.namaSiswa,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        jumlahMapel ?? 0,
        (index) {
          final absen = dataSiswa?.firstWhere(
            (absen) => absen.siswa?.nama == namaSiswa,
            orElse: () => AbsenElement(),
          );

          final status = absen?.absen?.status ?? "";

          return _buildIcon(status);
        },
      ),
    );
  }

  Widget _buildIcon(String? status) {
    IconData icon = Icons.clear;
    Color color = Colors.red;

    if (status != null) {
      if (status == "hadir") {
        icon = Icons.check;
        color = AllMaterial.colorPrimary;
      } else if (status == "izin") {
        icon = MdiIcons.fileChart;
        color = AllMaterial.colorBlue;
      } else if (status == "sakit") {
        icon = MdiIcons.clipboardPlus;
        color = AllMaterial.colorMint;
      }
    }

    return Icon(
      icon,
      color: color,
    );
  }
}
