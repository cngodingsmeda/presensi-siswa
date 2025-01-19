import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:presensi_siswa/app/modules/login_page/controllers/login_page_controller.dart';
import 'package:presensi_siswa/app/modules/login_page/views/login_page_view.dart';
import 'package:presensi_siswa/app/widget/custom_splash.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Presensi Siswa",
      getPages: AppPages.routes,
      locale: const Locale('id_ID'),
      debugShowCheckedModeBanner: false,
      home: const InitPage(),
    ),
  );
}

class InitPage extends StatefulWidget {
  const InitPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _InitPageState createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> with WidgetsBindingObserver {
  bool showSplash = true;
  final LoginPageController logController = Get.put(LoginPageController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    // Tunda untuk menampilkan splash screen
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          showSplash = false;
        });
        // Panggil pengecekan autentikasi setelah splash screen
        logController.checkAuthentication();
      }
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      setState(() {
        showSplash = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (showSplash) {
      return const CusplashScreen(); // Menampilkan splash screen
    } else {
      // Tampilan setelah splash screen
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
          overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);

      return Obx(() {
        if (logController.isAuth.value) {
          return logController
              .periksaRole(); // Periksa role dan arahkan ke halaman yang sesuai
        } else {
          return const LoginPageView(); // Jika tidak terautentikasi, tampilkan halaman login
        }
      });
    }
  }
}
