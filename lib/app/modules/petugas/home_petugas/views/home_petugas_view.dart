import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/modules/petugas/absen_harian_siswa_petugas/controllers/absen_harian_siswa_petugas_controller.dart';
import 'package:presensi_siswa/app/modules/petugas/histori_tinjauan_petugas/views/histori_tinjauan_petugas_view.dart';
import 'package:presensi_siswa/app/modules/petugas/main_petugas/controllers/main_petugas_controller.dart';

import '../controllers/home_petugas_controller.dart';

class HomePetugasView extends GetView<HomePetugasController> {
  const HomePetugasView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomePetugasController());
    final mainCont = Get.put(MainPetugasController());
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
                          Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
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
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: AllMaterial.cardWidget(
                            tengah: controller.nama[index],
                            atas: "Senin, 24 Agustus 2024",
                            bawah: "Absen Diterima",
                            onTap: () {
                              AllMaterial.detilKonten(
                                buttonLabel: "Tutup Laporan",
                                title: "Absen Harian",
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
                                            title: "SMK Negeri 2 Mataram",
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: AllMaterial.contextWidget(
                                            icon: MdiIcons.clock,
                                            subtitle: "Waktu Absen",
                                            title: "Pukul 08:05",
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
                                            icon: MdiIcons.account,
                                            subtitle: "Nama Siswa",
                                            title: controller.nama[index],
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Deskripsi Absen",
                                            style: AllMaterial.workSans(
                                              fontSize: 17,
                                              color: AllMaterial.colorPrimary,
                                              fontWeight:
                                                  AllMaterial.fontSemiBold,
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
                                              fontWeight:
                                                  AllMaterial.fontSemiBold,
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
                            svg:
                                SvgPicture.asset("assets/svg/absen-ceklis.svg"),
                          ),
                        ),
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
