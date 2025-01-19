import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:presensi_siswa/all_material.dart';
import '../controllers/histori_tinjauan_petugas_controller.dart';

class HistoriTinjauanPetugasView
    extends GetView<HistoriTinjauanPetugasController> {
  const HistoriTinjauanPetugasView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HistoriTinjauanPetugasController());
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      body: AllMaterial.containerLinear(
        padding: 0,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Row
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
                      "Histori Tinjauan",
                      style: AllMaterial.workSans(
                        fontSize: 17,
                        fontWeight: AllMaterial.fontSemiBold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Section 1 (for example: ajuanList)
                      // (controller.absenPending.isEmpty)
                      //     ? const SizedBox.shrink()
                      //     :
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              controller.stringTitle[0],
                              style: AllMaterial.workSans(
                                fontWeight: AllMaterial.fontMedium,
                                color: AllMaterial.colorGreySec,
                              ),
                            ),
                          ),
                          ...List.generate(
                            // controller.absenPending.length,
                            3,
                            (index) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: AllMaterial.cardWidget(
                                  atas: "Senin, 24 Agustus 2024",
                                  svg: SvgPicture.asset(
                                      "assets/icons/tanda-seru.svg"),
                                  bawah: "Kelas XI RPL 2",
                                  tengah: controller.nama[index],
                                  onTap: () {
                                    AllMaterial.detilKonten(
                                      customButton: true,
                                      customButtonWidget: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: ElevatedButton.icon(
                                              onPressed: () {},
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
                                              icon: const Icon(
                                                Icons.clear,
                                                color: AllMaterial.colorPrimary,
                                              ),
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
                                              onPressed: () {},
                                              label: Text(
                                                "Terima",
                                                style: AllMaterial.workSans(
                                                  color: AllMaterial.colorWhite,
                                                  fontSize: 16,
                                                  fontWeight:
                                                      AllMaterial.fontSemiBold,
                                                ),
                                              ),
                                              icon: const Icon(
                                                Icons.check,
                                                color: AllMaterial.colorWhite,
                                              ),
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
                                      title: "Senin, 12 Agustus 2024",
                                      addSubtitle: false,
                                      konten: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 5,
                                              horizontal: 10,
                                            ),
                                            margin: const EdgeInsets.only(
                                              right: 5,
                                              bottom: 15,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  AllMaterial.colorSoftPrimary,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              border: Border.all(
                                                color: AllMaterial.colorStroke,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Icon(
                                                  MdiIcons.accountTie,
                                                  color:
                                                      AllMaterial.colorPrimary,
                                                ),
                                                const SizedBox(width: 4),
                                                Text(
                                                  "Ratna S.Pd",
                                                  style: AllMaterial.workSans(
                                                    color: AllMaterial
                                                        .colorPrimary,
                                                    fontWeight:
                                                        AllMaterial.fontMedium,
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                Text(
                                                  "|",
                                                  style: AllMaterial.workSans(
                                                    color: AllMaterial
                                                        .colorSoftPrimary,
                                                    fontWeight:
                                                        AllMaterial.fontMedium,
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                Text(
                                                  "XI RPL 1",
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
                                                  title: controller.nama[index],
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              Expanded(
                                                child:
                                                    AllMaterial.contextWidget(
                                                  icon: MdiIcons.clock,
                                                  subtitle: "Waktu Absen",
                                                  title:
                                                      "Pukul ${controller.jam[index]}",
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
                                                  title: controller.nama[index],
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              Expanded(
                                                child:
                                                    AllMaterial.contextWidget(
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
                                                  "Tidak ada deskripsi yang ditambahkan.",
                                                  style: AllMaterial.workSans(
                                                    color: AllMaterial
                                                        .colorGreySec,
                                                  ),
                                                ),
                                                const SizedBox(height: 15),
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
                                                Text(
                                                  "Tidak ada bukti dokumen yang ditambahkan.",
                                                  style: AllMaterial.workSans(
                                                    color: AllMaterial
                                                        .colorGreySec,
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
                          const SizedBox(height: 20),
                        ],
                      ),

                      // Section 2 (for example: ditolak)
                      // (controller.absenDitolak.isEmpty)
                      //     ? const SizedBox.shrink()
                      //     :
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              controller.stringTitle[1],
                              style: AllMaterial.workSans(
                                fontWeight: AllMaterial.fontMedium,
                                color: AllMaterial.colorGreySec,
                              ),
                            ),
                          ),
                          ...List.generate(
                              // controller.absenDitolak.length,
                              1, (index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: AllMaterial.cardWidget(
                                atas: "Senin, 24 Agustus 2024",
                                svg: SvgPicture.asset(
                                    "assets/icons/tanda-seru.svg"),
                                bawah: "Kelas XI RPL 2",
                                tengah: controller.nama[index],
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
                                                title: "SMK Negeri 2 Mataram",
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Expanded(
                                              child: AllMaterial.contextWidget(
                                                icon: MdiIcons.clock,
                                                subtitle: "Waktu Absen",
                                                title:
                                                    "Pukul ${controller.jam[index]}",
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
                                                "Deskripsi Absen",
                                                style: AllMaterial.workSans(
                                                  fontSize: 17,
                                                  color:
                                                      AllMaterial.colorPrimary,
                                                  fontWeight:
                                                      AllMaterial.fontSemiBold,
                                                ),
                                              ),
                                              const SizedBox(height: 15),
                                              Text(
                                                "Tidak ada deskripsi yang ditambahkan.",
                                                style: AllMaterial.workSans(
                                                  color:
                                                      AllMaterial.colorGreySec,
                                                ),
                                              ),
                                              const SizedBox(height: 15),
                                              Text(
                                                "Bukti Dokumen",
                                                style: AllMaterial.workSans(
                                                  fontSize: 17,
                                                  color:
                                                      AllMaterial.colorPrimary,
                                                  fontWeight:
                                                      AllMaterial.fontSemiBold,
                                                ),
                                              ),
                                              const SizedBox(height: 15),
                                              Text(
                                                "Tidak ada bukti dokumen yang ditambahkan.",
                                                style: AllMaterial.workSans(
                                                  color:
                                                      AllMaterial.colorGreySec,
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
                          }),
                          const SizedBox(height: 20),
                        ],
                      ),

                      // Section 3 (for example: diterimaList)
                      // (controller.absenDiterima.isEmpty)
                      //     ? const SizedBox.shrink()
                      //     :
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              controller.stringTitle[2],
                              style: AllMaterial.workSans(
                                fontWeight: AllMaterial.fontMedium,
                                color: AllMaterial.colorGreySec,
                              ),
                            ),
                          ),
                          ...List.generate(
                              // controller.absenDiterima.length,
                              4, (index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: AllMaterial.cardWidget(
                                atas: "Senin, 24 Agustus 2024",
                                svg: SvgPicture.asset(
                                    "assets/icons/tanda-seru.svg"),
                                bawah: "Kelas XI RPL 2",
                                tengah: controller.nama[index],
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
                                                title: "SMK Negeri 2 Mataram",
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Expanded(
                                              child: AllMaterial.contextWidget(
                                                icon: MdiIcons.clock,
                                                subtitle: "Waktu Absen",
                                                title:
                                                    "Pukul ${controller.jam[index]}",
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
                                                "Deskripsi Absen",
                                                style: AllMaterial.workSans(
                                                  fontSize: 17,
                                                  color:
                                                      AllMaterial.colorPrimary,
                                                  fontWeight:
                                                      AllMaterial.fontSemiBold,
                                                ),
                                              ),
                                              const SizedBox(height: 15),
                                              Text(
                                                "Tidak ada deskripsi yang ditambahkan.",
                                                style: AllMaterial.workSans(
                                                  color:
                                                      AllMaterial.colorGreySec,
                                                ),
                                              ),
                                              const SizedBox(height: 15),
                                              Text(
                                                "Bukti Dokumen",
                                                style: AllMaterial.workSans(
                                                  fontSize: 17,
                                                  color:
                                                      AllMaterial.colorPrimary,
                                                  fontWeight:
                                                      AllMaterial.fontSemiBold,
                                                ),
                                              ),
                                              const SizedBox(height: 15),
                                              Text(
                                                "Tidak ada bukti dokumen yang ditambahkan.",
                                                style: AllMaterial.workSans(
                                                  color:
                                                      AllMaterial.colorGreySec,
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
                          }),
                          const SizedBox(height: 20),
                        ],
                      ),
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
