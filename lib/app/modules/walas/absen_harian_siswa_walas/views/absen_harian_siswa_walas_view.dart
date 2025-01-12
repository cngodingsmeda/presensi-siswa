import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:presensi_siswa/all_material.dart';

import '../controllers/absen_harian_siswa_walas_controller.dart';

class AbsenHarianSiswaWalasView
    extends GetView<AbsenHarianSiswaWalasController> {
  const AbsenHarianSiswaWalasView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AbsenHarianSiswaWalasController());
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
                  onTap: () {
                    // Get.to(() => const JadwalAbsenSiswaView());
                  },
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
                        "Absen Harian XI RPL 1",
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
                            title: "SMK Negeri 2 Mataram",
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
                              WidgetSpan(
                                child: InkWell(
                                  onTap: () {},
                                  splashColor:
                                      AllMaterial.colorPrimary.withOpacity(0.3),
                                  highlightColor:
                                      AllMaterial.colorPrimary.withOpacity(0.1),
                                  child: Text(
                                    "Senin, 12 Agustus 2024",
                                    style: AllMaterial.workSans(
                                      color: AllMaterial.colorPrimary,
                                      fontWeight: AllMaterial.fontSemiBold,
                                    ),
                                  ),
                                ),
                              ),
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
                      Column(
                        children: List.generate(
                          controller.nama.length,
                          (index) {
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
                                    controller.nama[index],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: AllMaterial.workSans(
                                      fontWeight: AllMaterial.fontRegular,
                                      fontSize: 14,
                                      color: AllMaterial.colorGreySec,
                                    ),
                                  ),
                                  trailing: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.check,
                                        color: AllMaterial.colorPrimary,
                                      ),
                                      Icon(
                                        Icons.clear,
                                        color: AllMaterial.colorRed,
                                      ),
                                      Icon(
                                        Icons.check,
                                        color: AllMaterial.colorPrimary,
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    print(
                                        "Nama yang dipilih: ${controller.nama[index]}");
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
              "10 dari 32",
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
