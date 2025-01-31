import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/modules/petugas/absen_pelajaran_siswa_petugas/views/absen_pelajaran_siswa_petugas_view.dart';
import 'package:presensi_siswa/app/modules/petugas/main_petugas/controllers/main_petugas_controller.dart';
import 'package:presensi_siswa/app/widget/status_row/status_row.dart';

import '../controllers/absen_bulanan_siswa_petugas_controller.dart';

class AbsenBulananSiswaPetugasView
    extends GetView<AbsenBulananSiswaPetugasController> {
  const AbsenBulananSiswaPetugasView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AbsenBulananSiswaPetugasController());
    var arg = Get.arguments ?? "";
    final profC = Get.put(MainPetugasController());
    var namaKelas = Get.arguments["namaKelas"];
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
                InkWell(
                  borderRadius: BorderRadius.circular(100),
                  onTap: () {},
                  child: Ink(
                    padding: const EdgeInsets.all(14),
                    child: SvgPicture.asset(
                      "assets/svg/calendar.svg",
                      color: AllMaterial.colorBlack,
                    ),
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
                        "Absen Bulanan $namaKelas",
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
                            title: "32 Orang",
                          ),
                          AllMaterial.iconWidget(
                            icon: MdiIcons.mapMarker,
                            title: profC
                                    .profilPetugas.value?.data?.sekolah?.nama ??
                                "",
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Material(
                        color: Colors.transparent,
                        child: RichText(
                          text: TextSpan(
                            text: "Menampilkan hasil untuk ",
                            style: AllMaterial.workSans(
                              color: AllMaterial.colorGreySec,
                            ),
                            children: [
                              TextSpan(
                                  text: "Senin, 12 ${arg["bulan"]} 2024",
                                  style: AllMaterial.workSans(
                                    color: AllMaterial.colorPrimary,
                                    fontWeight: AllMaterial.fontSemiBold,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {}),
                            ],
                          ),
                        ),
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
                        () => Column(
                          children: List.generate(
                            controller.jumlahSiswa.value,
                            (index) {
                              String namaSiswa = controller.listSiswa[index];

                              int countKeys(Map<String, dynamic>? data,
                                  String namaSiswa) {
                                if (data == null) return 0;

                                Map<String, dynamic>? siswaData =
                                    data[namaSiswa] as Map<String, dynamic>?;
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
                                        fontWeight: AllMaterial.fontRegular,
                                        fontSize: 14,
                                        color: AllMaterial.colorGreySec,
                                      ),
                                    ),
                                    trailing: StatusRow(
                                      namaSiswa: namaSiswa,
                                      dataSiswa:
                                          controller.absen.value?.data?.absen,
                                      jumlahMapel: totalKeys,
                                    ),
                                    onTap: () {
                                      final siswaKey = namaSiswa;

                                      final dataSiswa =
                                          controller.absen.value?.data?.absen;

                                      int? getIdSiswa(
                                          String siswaKey, String key) {
                                        final data = dataSiswa?[siswaKey]?[key];
                                        if (data != null) {
                                          return data["id_siswa"];
                                        }
                                        return 0;
                                      }

                                      bool areAllValuesNull() {
                                        for (int i = 1; i <= totalKeys; i++) {
                                          String key = i.toString();
                                          if (dataSiswa?[siswaKey]?[key] !=
                                              null) {
                                            return false;
                                          }
                                        }
                                        return true;
                                      }

                                      bool isAlpa = areAllValuesNull();
                                      final idSiswa =
                                          getIdSiswa(siswaKey, "$totalKeys");
                                      if (isAlpa) {
                                        AllMaterial.messageScaffold(
                                          title:
                                              "Tidak ditemukan Absen untuk siswa terkait!",
                                        );
                                      } else {
                                        print(idSiswa);
                                        Get.to(
                                          () =>
                                              const AbsenPelajaranSiswaPetugasView(),
                                          arguments: {
                                            "idSiswa": idSiswa,
                                            "kelas": namaKelas,
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
