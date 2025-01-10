import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:presensi_siswa/all_material.dart';

import '../controllers/edit_profil_siswa_controller.dart';

class EditProfilSiswaView extends GetView<EditProfilSiswaController> {
  const EditProfilSiswaView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditProfilSiswaController());

    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      resizeToAvoidBottomInset: true,
      body: AllMaterial.containerLinear(
        padding: 0,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
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
                    Text(
                      "Edit Profil",
                      style: AllMaterial.workSans(
                        fontSize: 17,
                        fontWeight: AllMaterial.fontSemiBold,
                      ),
                    ),
                    const SizedBox(width: 50),
                  ],
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.bottomRight,
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          boxShadow: [AllMaterial.topShadow],
                          borderRadius: BorderRadius.circular(1000),
                          color: AllMaterial.colorMint,
                        ),
                        child: IconButton(
                          color: AllMaterial.colorPrimary,
                          style: const ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              AllMaterial.colorPrimary,
                            ),
                          ),
                          onPressed: () {},
                          icon: Icon(
                            MdiIcons.pencil,
                            color: AllMaterial.colorWhite,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          AllMaterial.editableWidget(
                            controller: controller.namaC,
                            focusNode: controller.namaF,
                            label: "Nama",
                          ),
                          AllMaterial.editableWidget(
                            controller: controller.nisC,
                            focusNode: controller.nisF,
                            label: "NIS",
                          ),
                          AllMaterial.editableWidget(
                            controller: controller.emailC,
                            focusNode: controller.emailF,
                            label: "Email",
                          ),
                          AllMaterial.editableWidget(
                            controller: controller.jenisKelaminC,
                            focusNode: controller.jenisKelaminF,
                            label: "Jenis Kelamin",
                          ),
                          AllMaterial.editableWidget(
                            controller: controller.kelasJurusanC,
                            focusNode: controller.kelasJurusanF,
                            label: "Kelas & Jurusan",
                          ),
                          AllMaterial.editableWidget(
                            controller: controller.noTeleponC,
                            focusNode: controller.noTeleponF,
                            label: "No. Telepon",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: AllMaterial.cusButton(
          addIcon: false,
          label: "Simpan Perubahan",
          onTap: () {},
        ),
      ),
    );
  }
}
