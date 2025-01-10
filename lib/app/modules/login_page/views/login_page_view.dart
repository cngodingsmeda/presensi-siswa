import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/modules/siswa/main_siswa/views/main_siswa_view.dart';

import '../controllers/login_page_controller.dart';

class LoginPageView extends GetView<LoginPageController> {
  const LoginPageView({super.key});
  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginPageController());
    return Scaffold(
      body: AllMaterial.containerLinear(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset("assets/svg/smile.svg"),
                const SizedBox(height: 30),
                Text(
                  "Selamat Datang !",
                  style: AllMaterial.workSans(
                    fontSize: 30,
                    fontWeight: AllMaterial.fontMedium,
                  ),
                ),
                const SizedBox(height: 50),
                // Username Field
                AllMaterial.textField(
                  label: "Username",
                  controller: loginController.userC,
                  focusNode: loginController.userF,
                ),
                const SizedBox(height: 20),

                // Password Field
                Obx(() => TextField(
                      controller: loginController.passC,
                      focusNode: loginController.passF,
                      obscureText: loginController.isPasswordHidden.value,
                      onTapOutside: (e) {
                        loginController.passF.unfocus();
                      },
                      cursorColor: AllMaterial.colorPrimary,
                      decoration: InputDecoration(
                        hoverColor: AllMaterial.colorPrimary,
                        focusColor: AllMaterial.colorPrimary,
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: AllMaterial.colorPrimary,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        labelText: 'Password',
                        labelStyle: AllMaterial.workSans(
                          color: AllMaterial.colorBlack.withOpacity(0.6),
                          fontWeight: AllMaterial.fontMedium,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color(0xffF1ECEC).withOpacity(0.1)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            loginController.isPasswordHidden.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: loginController.togglePasswordVisibility,
                        ),
                      ),
                    )),
                const SizedBox(height: 25),
                AllMaterial.cusButton(
                  label: "Login",
                  onTap: () {
                    Get.off(() => const MainSiswaView());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
