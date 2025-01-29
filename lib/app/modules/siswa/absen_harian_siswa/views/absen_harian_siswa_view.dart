import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/modules/siswa/buat_absen_harian_siswa/views/buat_absen_harian_siswa_view.dart';
import 'package:presensi_siswa/app/modules/siswa/home_siswa/controllers/home_siswa_controller.dart';
import 'package:presensi_siswa/app/modules/siswa/jadwal_absen_siswa/views/jadwal_absen_siswa_view.dart';
import 'package:presensi_siswa/app/modules/siswa/main_siswa/controllers/main_siswa_controller.dart';

import '../controllers/absen_harian_siswa_controller.dart';

class AbsenHarianSiswaView extends GetView<AbsenHarianSiswaController> {
  const AbsenHarianSiswaView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AbsenHarianSiswaController());
    final mainCont = Get.put(MainSiswaController());
    final homeCont = Get.put(HomeSiswaController());
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 210,
                      width: Get.width,
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            "assets/images/school.png",
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: Get.width,
                      margin: const EdgeInsets.only(top: 180),
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        ),
                        color: AllMaterial.colorWhite,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            mainCont.profilSiswa.value?.data?.sekolah?.nama ??
                                "",
                            style: AllMaterial.workSans(
                              fontSize: 25,
                              fontWeight: AllMaterial.fontMedium,
                            ),
                          ),
                          Wrap(
                            spacing: 10,
                            alignment: WrapAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 10,
                                ),
                                margin: const EdgeInsets.only(
                                  right: 5,
                                  top: 15,
                                ),
                                decoration: BoxDecoration(
                                  color: AllMaterial.colorSoftPrimary,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: AllMaterial.colorStroke,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          MdiIcons.notebook,
                                          color: AllMaterial.colorPrimary,
                                        ),
                                        const SizedBox(width: 4),
                                        Obx(
                                          () => Text(
                                            "${controller.jumlahMapel.value} Mapel",
                                            style: AllMaterial.workSans(
                                              color: AllMaterial.colorPrimary,
                                              fontWeight:
                                                  AllMaterial.fontMedium,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Obx(() {
                                var jadwalAbsen =
                                    controller.jadwal.value?.data?.dataJadwal ??
                                        [];
                                if (jadwalAbsen.isEmpty) {
                                  return AllMaterial.iconWidget(
                                      icon: MdiIcons.clock,
                                      title: "Tidak ada jadwal");
                                } else {
                                  return AllMaterial.iconWidget(
                                    icon: MdiIcons.clock,
                                    title: controller
                                                    .jadwal
                                                    .value
                                                    ?.data
                                                    ?.dataJadwal
                                                    ?.first
                                                    .jadwal
                                                    ?.jamMulai ==
                                                "" &&
                                            controller
                                                    .jadwal
                                                    .value
                                                    ?.data
                                                    ?.dataJadwal
                                                    ?.first
                                                    .jadwal
                                                    ?.jamMulai ==
                                                null &&
                                            controller
                                                    .jadwal
                                                    .value
                                                    ?.data
                                                    ?.dataJadwal
                                                    ?.last
                                                    .jadwal
                                                    ?.jamSelesai ==
                                                "" &&
                                            controller
                                                    .jadwal
                                                    .value
                                                    ?.data
                                                    ?.dataJadwal
                                                    ?.last
                                                    .jadwal
                                                    ?.jamSelesai ==
                                                null
                                        ? "Tidak ada jadwal"
                                        : "Pukul ${controller.jadwal.value?.data?.dataJadwal?.first.jadwal?.jamMulai ?? "00:00"}-${controller.jadwal.value?.data?.dataJadwal?.last.jadwal?.jamSelesai ?? "00:00"}",
                                  );
                                }
                              }),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Obx(
                            () => Text(
                              "Absen ${mainCont.profilSiswa.value?.data?.kelas?.nama ?? ""} ${controller.bisaAbsen.isTrue ? "tersedia" : "tidak tersedia"} untuk hari ini.",
                              style: AllMaterial.workSans(
                                color: AllMaterial.colorGreySec,
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Rekap Absen Minggu Ini",
                                  style: AllMaterial.workSans(
                                    fontWeight: AllMaterial.fontMedium,
                                    fontSize: 14,
                                    color: AllMaterial.colorGreySec,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Obx(
                                        () => AllMaterial.outlineText(
                                          title: "Absen Hadir",
                                          subtitle:
                                              "${homeCont.absenHadir.value}x",
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Obx(
                                        () => AllMaterial.outlineText(
                                          title: "Absen Izin/Sakit/Dispensasi",
                                          subtitle:
                                              "${homeCont.absenIzin.value}x",
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  "Progres Absen Mingguan",
                                  style: AllMaterial.workSans(
                                    fontWeight: AllMaterial.fontMedium,
                                    fontSize: 14,
                                    color: AllMaterial.colorGreySec,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Wrap(
                                  spacing: 5,
                                  children: List.generate(
                                      mainCont.rekapMingguan.value?.data
                                              ?.progress?.length ??
                                          0, (index) {
                                    var statuses = mainCont
                                        .rekapMingguan.value?.data?.progress;
                                    var status = statuses![index].status;

                                    Color borderColor;
                                    Color textColor;
                                    Color? backgroundColor;

                                    if (status == "hadir") {
                                      borderColor = Colors.green;
                                      backgroundColor = Colors.green;
                                      textColor = Colors.white;
                                    } else if (status == "izin" ||
                                        status == "sakit") {
                                      borderColor = AllMaterial.colorBlue;
                                      backgroundColor = Colors.transparent;
                                      textColor = AllMaterial.colorBlue;
                                    } else if (status == "alpa") {
                                      borderColor = AllMaterial.colorRed;
                                      backgroundColor = Colors.transparent;
                                      textColor = AllMaterial.colorRed;
                                    } else if (status == "libur") {
                                      borderColor = AllMaterial.colorGreySec;
                                      backgroundColor = Colors.transparent;
                                      textColor = AllMaterial.colorGreySec;
                                    } else {
                                      borderColor = Colors.black;
                                      backgroundColor = Colors.transparent;
                                      textColor = Colors.black;
                                    }

                                    return Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Container(
                                        width: 35,
                                        height: 35,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: backgroundColor,
                                          border: Border.all(
                                            color: borderColor,
                                          ),
                                        ),
                                        child: Text(
                                          "${index + 1}",
                                          style: AllMaterial.workSans(
                                            fontWeight: AllMaterial.fontMedium,
                                            fontSize: 14,
                                            color: textColor,
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                                const SizedBox(height: 18),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: List.generate(
                                          5,
                                          (index) {
                                            List<String> statuses = [
                                              "Hadir",
                                              "Alpa",
                                              "Izin/Sakit",
                                              "Hari Libur",
                                              "Belum Absen",
                                            ];
                                            String status = statuses[index];

                                            Color borderColor;
                                            Color? backgroundColor;

                                            if (status == "Hadir") {
                                              borderColor = Colors.green;
                                              backgroundColor = Colors.green;
                                            } else if (status == "Izin/Sakit") {
                                              borderColor =
                                                  AllMaterial.colorBlue;
                                              backgroundColor =
                                                  Colors.transparent;
                                            } else if (status == "Alpa") {
                                              borderColor =
                                                  AllMaterial.colorRed;
                                              backgroundColor =
                                                  Colors.transparent;
                                            } else if (status == "Hari Libur") {
                                              borderColor =
                                                  AllMaterial.colorGreySec;
                                              backgroundColor =
                                                  Colors.transparent;
                                            } else {
                                              borderColor = Colors.black;
                                              backgroundColor =
                                                  Colors.transparent;
                                            }

                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                right: 15,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Container(
                                                    width: 15,
                                                    height: 15,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2),
                                                      color: backgroundColor,
                                                      border: Border.all(
                                                        color: borderColor,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  Text(
                                                    "= $status",
                                                    style: AllMaterial.workSans(
                                                      fontWeight: AllMaterial
                                                          .fontRegular,
                                                      fontSize: 14,
                                                      color: AllMaterial
                                                          .colorGreySec,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    MdiIcons.arrowLeft,
                    color: AllMaterial.colorWhite,
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(100),
                  onTap: () {
                    Get.to(() => const JadwalAbsenSiswaView());
                  },
                  child: Ink(
                    padding: const EdgeInsets.all(14),
                    child: SvgPicture.asset(
                      "assets/svg/calendar.svg",
                      color: AllMaterial.colorWhite,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          color: AllMaterial.colorWhite,
          boxShadow: [AllMaterial.topShadow],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AllMaterial.hariTanggalBulanTahun(
                DateTime.now().toIso8601String(),
              ),
              style: AllMaterial.workSans(
                fontWeight: AllMaterial.fontMedium,
                fontSize: 16,
                color: AllMaterial.colorBlack,
              ),
            ),
            Obx(
              () => controller.jumlahMapel.value == 0
                  ? Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        "Tidak ada jadwal untuk hari ini",
                        style: AllMaterial.workSans(
                          fontWeight: AllMaterial.fontMedium,
                          color: AllMaterial.colorGreySec,
                        ),
                      ),
                    )
                  : Column(
                      children:
                          List.generate(controller.jumlahMapel.value, (index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                "${controller.mapel[index]} (${controller.jam[index]})",
                                style: AllMaterial.workSans(
                                  fontWeight: AllMaterial.fontRegular,
                                  fontSize: 14,
                                  color: AllMaterial.colorGreySec,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.check,
                                  color: AllMaterial.colorPrimary,
                                ),
                                const SizedBox(width: 2),
                                Text(
                                  "Terisi",
                                  style: AllMaterial.workSans(
                                    fontWeight: AllMaterial.fontMedium,
                                    fontSize: 15,
                                    color: AllMaterial.colorBlack,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      }),
                    ),
            ),
            const SizedBox(height: 20),
            AllMaterial.cusButton(
              onTap: controller.bisaAbsen.isFalse
                  ? null
                  : () {
                      Get.to(() => const BuatAbsenHarianSiswaView());
                    },
              label: "Absen Harian",
              icon: const Icon(
                Icons.fingerprint,
                color: AllMaterial.colorWhite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
