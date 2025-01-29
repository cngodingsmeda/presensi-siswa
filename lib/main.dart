import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/modules/login_page/controllers/login_page_controller.dart';
import 'package:presensi_siswa/app/modules/login_page/views/login_page_view.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:presensi_siswa/app/widget/splash_screen/custom_splash.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);
  await Permission.storage.request();
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      title: "Presensi Siswa",
      getPages: AppPages.routes,
      theme: ThemeData(
        colorSchemeSeed: AllMaterial.colorPrimary,
      ),
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

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          showSplash = false;
        });
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
      return const CusplashScreen();
    } else {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
          overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);

      return Obx(() {
        if (logController.isAuth.value) {
          return logController.periksaRole();
        } else {
          return const LoginPageView();
        }
      });
    }
  }
}
