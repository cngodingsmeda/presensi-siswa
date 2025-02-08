import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/model/model_walas/absen_kelas_harian_petugas_model.dart';
import 'package:presensi_siswa/app/modules/walas/laporan_pelajaran_siswa_walas/views/laporan_pelajaran_siswa_walas_view.dart';
import 'package:presensi_siswa/app/modules/walas/main_walas/controllers/main_walas_controller.dart';

import '../controllers/absen_harian_siswa_walas_controller.dart';

class AbsenHarianSiswaWalasView
    extends GetView<AbsenHarianSiswaWalasController> {
  const AbsenHarianSiswaWalasView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AbsenHarianSiswaWalasController());
    final mainCont = Get.put(MainWalasController());
    var namaKelas = mainCont.profilWalas.value?.data?.kelas?.nama ?? "";
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Absen Harian $namaKelas",
                        style: AllMaterial.workSans(
                          fontSize: 25,
                          fontWeight: AllMaterial.fontMedium,
                        ),
                      ),
                      Wrap(
                        spacing: 10,
                        alignment: WrapAlignment.start,
                        children: [
                          AllMaterial.iconWidget(
                            icon: MdiIcons.account,
                            title: "${mainCont.jumlahSiswa.value} Orang",
                          ),
                          AllMaterial.iconWidget(
                            icon: MdiIcons.mapMarker,
                            title: "SMK Negeri 2 Mataram",
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
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
                                  "Tidak ada data absen yang ditemukan",
                                  style: AllMaterial.workSans(
                                    color: AllMaterial.colorGreySec,
                                  ),
                                ),
                              )
                            : Column(
                                children: List.generate(
                                  controller.jumlahSiswa.value,
                                  (index) {
                                    String namaSiswa =
                                        controller.listSiswa[index];

                                    int countKeys(Map<String, dynamic>? data,
                                        String namaSiswa) {
                                      if (data == null) return 0;

                                      Map<String, dynamic>? siswaData =
                                          data[namaSiswa]
                                              as Map<String, dynamic>?;
                                      if (siswaData == null) return 0;
                                      return siswaData.keys.length;
                                    }

                                    int totalKeys = countKeys(
                                      controller.absen.value?.data?.absen,
                                      namaSiswa,
                                    );

                                    return Column(
                                      children: [
                                        ListTile(
                                          contentPadding: EdgeInsets.zero,
                                          minVerticalPadding: 0,
                                          leading: Text(
                                            "${index + 1}.",
                                            style: AllMaterial.workSans(
                                              fontWeight: AllMaterial.fontBold,
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
                                            dataSiswa: controller
                                                .absen.value?.data?.absen,
                                            jumlahMapel: totalKeys,
                                          ),
                                          onTap: () {
                                            final siswaKey = namaSiswa;

                                            final dataSiswa = controller
                                                .absen.value?.data?.absen;

                                            int? getIdSiswa(
                                                String siswaKey, String key) {
                                              final data =
                                                  dataSiswa?[siswaKey]?[key];
                                              if (data != null) {
                                                return data.idSiswa;
                                              }
                                              return 0;
                                            }

                                            bool areAllValuesNull() {
                                              for (int i = 1;
                                                  i <= totalKeys;
                                                  i++) {
                                                String key = i.toString();
                                                if (dataSiswa?[siswaKey]
                                                        ?[key] !=
                                                    null) {
                                                  return false;
                                                }
                                              }
                                              return true;
                                            }

                                            bool isAlpa = areAllValuesNull();
                                            final idSiswa = getIdSiswa(
                                                siswaKey, "$totalKeys");

                                            if (isAlpa) {
                                              AllMaterial.messageScaffold(
                                                title:
                                                    "Siswa melewatkan absen harian!",
                                              );
                                            } else {
                                              print(idSiswa);
                                              Get.to(
                                                () =>
                                                    const LaporanPelajaranSiswaWalasView(),
                                                arguments: {
                                                  "idSiswa": idSiswa,
                                                  "kelas": mainCont
                                                          .profilWalas
                                                          .value
                                                          ?.data
                                                          ?.kelas
                                                          ?.nama ??
                                                      "",
                                                  "tanggal": AllMaterial
                                                      .hariTanggalBulanTahun(
                                                    DateTime.now()
                                                        .toIso8601String(),
                                                  ),
                                                  "nama": namaSiswa,
                                                },
                                              );
                                            }
                                          },
                                        ),
                                        const Divider(
                                          color: AllMaterial.colorStroke,
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                      ),
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
            Obx(
              () => Text(
                "${controller.listSiswa.length} dari ${controller.jumlahSiswa.value}",
                style: AllMaterial.workSans(
                  fontSize: 14,
                ),
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
  final String namaSiswa;
  final Map<String, Map<String, AbsenDetail?>>? dataSiswa;
  final int jumlahMapel;

  const StatusRow({
    super.key,
    required this.namaSiswa,
    required this.dataSiswa,
    required this.jumlahMapel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        jumlahMapel,
        (index) {
          String key = (index + 1).toString();
          AbsenDetail? absen = dataSiswa?[namaSiswa]?[key];

          return _buildIcon(absen?.status);
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
