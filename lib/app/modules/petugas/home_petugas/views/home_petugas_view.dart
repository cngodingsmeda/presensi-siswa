import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/data/api_url.dart';
import 'package:presensi_siswa/app/modules/petugas/absen_harian_siswa_petugas/controllers/absen_harian_siswa_petugas_controller.dart';
import 'package:presensi_siswa/app/modules/petugas/histori_tinjauan_petugas/controllers/histori_tinjauan_petugas_controller.dart';
import 'package:presensi_siswa/app/modules/petugas/histori_tinjauan_petugas/views/histori_tinjauan_petugas_view.dart';
import 'package:presensi_siswa/app/modules/petugas/main_petugas/controllers/main_petugas_controller.dart';
import 'package:presensi_siswa/app/widget/hero_image/hero_image.dart';
import 'package:presensi_siswa/app/widget/preview_image/preview_image.dart';

import '../controllers/home_petugas_controller.dart';

class HomePetugasView extends GetView<HomePetugasController> {
  const HomePetugasView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomePetugasController());
    final mainCont = Get.put(MainPetugasController());
    final historiC = Get.put(HistoriTinjauanPetugasController());
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      body: SafeArea(
        child: AllMaterial.containerLinear(
          padding: 0,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Selamat datang,",
                                style: AllMaterial.workSans(
                                  fontWeight: AllMaterial.fontMedium,
                                  fontSize: 14,
                                  color: AllMaterial.colorGreySec,
                                ),
                              ),
                              Text(
                                "Petugas BK",
                                style: AllMaterial.workSans(
                                  fontWeight: AllMaterial.fontSemiBold,
                                  fontSize: 20,
                                  color: AllMaterial.colorBlack,
                                ),
                              ),
                            ],
                          ),
                          Obx(
                            () => mainCont.profilPetugas.value?.data
                                            ?.fotoProfile ==
                                        "" ||
                                    mainCont.profilPetugas.value?.data
                                            ?.fotoProfile ==
                                        null
                                ? Container(
                                    alignment: Alignment.center,
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(1000),
                                      color: AllMaterial.colorMint,
                                    ),
                                    child: Obx(
                                      () => Text(
                                        mainCont.userNameFilter.value,
                                        style: AllMaterial.workSans(
                                          color: AllMaterial.colorWhite,
                                          fontWeight: AllMaterial.fontSemiBold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      Get.to(
                                        () => HeroImage(
                                          namePath:
                                              "${mainCont.profilPetugas.value?.data?.nama?.replaceAll(" ", "-")}-fotoProfile",
                                          imageUrl: mainCont.profilPetugas.value
                                                  ?.data?.fotoProfile
                                                  ?.replaceAll("localhost",
                                                      ApiUrl.baseUrl) ??
                                              "https://picsum.photos/200/300?grayscale",
                                        ),
                                      );
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(1000),
                                        color: AllMaterial.colorMint,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            mainCont.profilPetugas.value?.data
                                                    ?.fotoProfile
                                                    ?.replaceAll(
                                                  "localhost",
                                                  ApiUrl.baseUrl,
                                                ) ??
                                                "https://picsum.photos/200/300?grayscale",
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 17),
                      Material(
                        borderRadius: BorderRadius.circular(35),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(35),
                          onTap: () async {
                            var absen =
                                Get.put(AbsenHarianSiswaPetugasController());
                            await absen.fetchKelasTinjauan();
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              border: Border.all(
                                color: AllMaterial.colorStroke,
                                width: 1,
                              ),
                            ),
                            child: ListTile(
                              minVerticalPadding: 0,
                              contentPadding: EdgeInsets.zero,
                              leading: CircleAvatar(
                                radius: 22,
                                backgroundColor: AllMaterial.colorSecondary,
                                child:
                                    SvgPicture.asset("assets/svg/calendar.svg"),
                              ),
                              title: Text(
                                "Absen Harian Siswa",
                                style: AllMaterial.workSans(
                                  fontWeight: AllMaterial.fontSemiBold,
                                  color: AllMaterial.colorBlack,
                                ),
                              ),
                              subtitle: Text(
                                AllMaterial.hariTanggalBulanTahun(
                                  DateTime.now().toIso8601String(),
                                ),
                                style: AllMaterial.workSans(
                                  color: AllMaterial.colorGreySec,
                                ),
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: AllMaterial.colorPrimary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 23),
                Container(
                  height: Get.height,
                  decoration: BoxDecoration(
                    boxShadow: [
                      AllMaterial.topShadow,
                    ],
                    color: AllMaterial.colorWhite,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 25,
                    horizontal: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Rekap Tinjauan",
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(
                              () => AllMaterial.outlineText(
                                title: "Absen Diterima",
                                subtitle:
                                    "${controller.absenDiterima.value} absen",
                              ),
                            ),
                            const SizedBox(width: 8),
                            Obx(
                              () => AllMaterial.outlineText(
                                title: "Absen Ditolak",
                                subtitle:
                                    "${controller.absenDitolak.value} absen",
                              ),
                            ),
                            const SizedBox(width: 8),
                            Obx(
                              () => AllMaterial.outlineText(
                                title: "Absen Belum Ditinjau",
                                subtitle:
                                    "${controller.absenBelumDitinjau.value} absen",
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Material(
                        color: AllMaterial.colorWhite,
                        child: InkWell(
                          onTap: () {
                            Get.to(() => const HistoriTinjauanPetugasView());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Histori Tinjauan",
                                style: AllMaterial.workSans(
                                  fontWeight: AllMaterial.fontMedium,
                                  fontSize: 14,
                                  color: AllMaterial.colorGreySec,
                                ),
                              ),
                              const Icon(
                                size: 14,
                                Icons.arrow_forward_ios_rounded,
                                color: AllMaterial.colorPrimary,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Obx(
                        () {
                          var histori = historiC.absenPending.length > 3
                              ? historiC.absenPending.sublist(0, 3)
                              : historiC.absenPending;
                          if (histori.isEmpty) {
                            print(histori.length);
                            return Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Center(
                                child: Text(
                                  "Tidak ada absen yang harus ditinjau",
                                  style: AllMaterial.workSans(
                                    color: AllMaterial.colorGreySec,
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: histori.length,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: AllMaterial.cardWidget(
                                  tengah: AllMaterial.formatNamaPanjang(
                                      histori[index]?.siswa?.nama ?? ""),
                                  atas: AllMaterial.hariTanggalBulanTahun(
                                      histori[index]
                                              ?.tanggal
                                              ?.toIso8601String() ??
                                          DateTime.now().toIso8601String()),
                                  bawah: "Absen Belum Ditinjau",
                                  onTap: () async {
                                    final id =
                                        histori[index]?.id?.toString() ?? "0";

                                    await historiC
                                        .fetchDetilHistoriTinjauanPetugas(id);

                                    final absen = historiC.detilAbsen.value;

                                    AllMaterial.detilKonten(
                                      customButton: true,
                                      customButtonWidget: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: ElevatedButton.icon(
                                              onPressed: () async {
                                                AllMaterial.cusDialogValidasi(
                                                  title: "Menolak Absen",
                                                  subtitle:
                                                      "Apakah Anda yakin?",
                                                  onConfirm: () async {
                                                    await mainCont
                                                        .patchTinjauanAbsenPetugas(
                                                            false, id);
                                                    Get.back();
                                                    Get.back();
                                                  },
                                                  onCancel: () => Get.back(),
                                                );
                                              },
                                              label: Text(
                                                "Tolak",
                                                style: AllMaterial.workSans(
                                                  color:
                                                      AllMaterial.colorPrimary,
                                                  fontSize: 16,
                                                  fontWeight:
                                                      AllMaterial.fontSemiBold,
                                                ),
                                              ),
                                              icon: const Icon(Icons.clear,
                                                  color:
                                                      AllMaterial.colorPrimary),
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    AllMaterial.colorWhite,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                elevation: 0,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 14),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 15),
                                          Expanded(
                                            child: ElevatedButton.icon(
                                              onPressed: () async {
                                                AllMaterial.cusDialogValidasi(
                                                  title: "Menerima Absen",
                                                  subtitle:
                                                      "Apakah Anda yakin?",
                                                  onConfirm: () async {
                                                    await mainCont
                                                        .patchTinjauanAbsenPetugas(
                                                            true, id);
                                                    Get.back();
                                                    Get.back();
                                                  },
                                                  onCancel: () => Get.back(),
                                                );
                                              },
                                              label: Text(
                                                "Terima",
                                                style: AllMaterial.workSans(
                                                  color: AllMaterial.colorWhite,
                                                  fontSize: 16,
                                                  fontWeight:
                                                      AllMaterial.fontSemiBold,
                                                ),
                                              ),
                                              icon: const Icon(Icons.check,
                                                  color:
                                                      AllMaterial.colorWhite),
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    AllMaterial.colorPrimary,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                elevation: 0,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 14),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      title: absen?.data?.tanggal == null
                                          ? ""
                                          : AllMaterial.hariTanggalBulanTahun(
                                              absen?.data?.tanggal
                                                      ?.toIso8601String() ??
                                                  ""),
                                      addSubtitle: false,
                                      konten: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 10),
                                            margin: const EdgeInsets.only(
                                                right: 5, bottom: 15),
                                            decoration: BoxDecoration(
                                              color:
                                                  AllMaterial.colorSoftPrimary,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              border: Border.all(
                                                  color:
                                                      AllMaterial.colorStroke),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Icon(MdiIcons.accountTie,
                                                    color: AllMaterial
                                                        .colorPrimary),
                                                const SizedBox(width: 4),
                                                Text(
                                                  absen?.data?.siswa?.kelas
                                                          ?.guruWalas?.nama ??
                                                      "",
                                                  style: AllMaterial.workSans(
                                                    color: AllMaterial
                                                        .colorPrimary,
                                                    fontWeight:
                                                        AllMaterial.fontMedium,
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                Text("|",
                                                    style: AllMaterial.workSans(
                                                        color: AllMaterial
                                                            .colorSoftPrimary)),
                                                const SizedBox(width: 10),
                                                Text(
                                                  absen?.data?.siswa?.kelas
                                                          ?.nama ??
                                                      "",
                                                  style: AllMaterial.workSans(
                                                    color: AllMaterial
                                                        .colorPrimary,
                                                    fontWeight:
                                                        AllMaterial.fontMedium,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child:
                                                    AllMaterial.contextWidget(
                                                  icon: MdiIcons.account,
                                                  subtitle: "Nama Siswa",
                                                  title: absen
                                                          ?.data?.siswa?.nama ??
                                                      "",
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              Expanded(
                                                child:
                                                    AllMaterial.contextWidget(
                                                  icon: MdiIcons.clock,
                                                  subtitle: "Waktu Absen",
                                                  title:
                                                      "Pukul ${absen?.data?.jam == "" ? "" : AllMaterial.jamMenit(absen?.data?.jam)}",
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
                                                child:
                                                    AllMaterial.contextWidget(
                                                  icon: MdiIcons.accountTie,
                                                  subtitle: "Guru Mapel",
                                                  title: absen?.data?.jadwal
                                                          ?.guruMapel?.nama ??
                                                      "",
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              Expanded(
                                                child:
                                                    AllMaterial.contextWidget(
                                                  icon: MdiIcons.fingerprint,
                                                  subtitle: "Jenis Absen",
                                                  title:
                                                      "Absen ${absen?.data?.status ?? ""}",
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
                                                  color:
                                                      AllMaterial.colorStroke,
                                                  width: 1.5),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Deskripsi Absen",
                                                  style: AllMaterial.workSans(
                                                    fontSize: 17,
                                                    color: AllMaterial
                                                        .colorPrimary,
                                                    fontWeight: AllMaterial
                                                        .fontSemiBold,
                                                  ),
                                                ),
                                                const SizedBox(height: 15),
                                                Text(
                                                  absen?.data?.detail
                                                              ?.catatan ==
                                                          ""
                                                      ? "Tidak ada deskripsi yang ditambahkan."
                                                      : absen?.data?.detail
                                                              ?.catatan ??
                                                          "",
                                                  style: AllMaterial.workSans(
                                                      color: AllMaterial
                                                          .colorGreySec),
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                Text(
                                                  "Bukti Dokumen",
                                                  style: AllMaterial.workSans(
                                                    fontSize: 17,
                                                    color: AllMaterial
                                                        .colorPrimary,
                                                    fontWeight: AllMaterial
                                                        .fontSemiBold,
                                                  ),
                                                ),
                                                const SizedBox(height: 15),
                                                Obx(
                                                  () => historiC
                                                                  .detilAbsen
                                                                  .value
                                                                  ?.data
                                                                  ?.file ==
                                                              "" ||
                                                          historiC
                                                                  .detilAbsen
                                                                  .value
                                                                  ?.data
                                                                  ?.file ==
                                                              null
                                                      ? GestureDetector(
                                                          onTap: () {
                                                            Get.to(
                                                              () => HeroImage(
                                                                namePath:
                                                                    "${absen?.data?.siswa?.nama?.replaceAll(" ", "-")}-${DateFormat('dd-MM-yyyy').format(
                                                                  DateTime
                                                                      .now(),
                                                                )}",
                                                                imageUrl: absen
                                                                        ?.data
                                                                        ?.file
                                                                        ?.replaceAll(
                                                                            "localhost",
                                                                            ApiUrl.baseUrl) ??
                                                                    "https://picsum.photos/200/300?grayscale",
                                                              ),
                                                            );
                                                          },
                                                          child: PreviewImage(
                                                            fileName: absen
                                                                    ?.data?.file
                                                                    ?.replaceAll(
                                                                        "localhost",
                                                                        ApiUrl
                                                                            .baseUrl) ??
                                                                "https://picsum.photos/200/300?grayscale",
                                                          ),
                                                        )
                                                      : Text(
                                                          "Tidak ada bukti dokumen yang ditambahkan.",
                                                          style: AllMaterial
                                                              .workSans(
                                                            color: AllMaterial
                                                                .colorGreySec,
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
                                  svg: SvgPicture.asset(
                                    "assets/svg/absen-ceklis.svg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
