import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:presensi_siswa/all_material.dart';

class CusplashScreen extends StatelessWidget {
  const CusplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom],
    );
    return Scaffold(
      backgroundColor: AllMaterial.colorPrimary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 105,
              height: 105,
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: SvgPicture.asset("assets/svg/logo.svg"),
            ),
            RichText(
              text: TextSpan(
                text: "Presisi",
                style: AllMaterial.workSans(
                  color: AllMaterial.colorWhite,
                  fontWeight: AllMaterial.fontSemiBold,
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
