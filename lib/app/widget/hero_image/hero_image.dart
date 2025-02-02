import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_siswa/all_material.dart';

class HeroImage extends StatelessWidget {
  final String imageUrl;
  final String namePath;

  HeroImage({
    super.key,
    required this.imageUrl,
    required this.namePath,
  });

  final RxDouble initialPosition = 0.0.obs;
  var isError = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        actions: [
          isError.isTrue
              ? const SizedBox.shrink()
              : IconButton(
                  icon: const Icon(Icons.download),
                  onPressed: () =>
                      AllMaterial.downloadAndSaveImage(imageUrl, namePath),
                ),
        ],
      ),
      body: GestureDetector(
        onVerticalDragStart: (details) {
          initialPosition.value = details.localPosition.dy;
        },
        onVerticalDragUpdate: (details) {
          double distance = details.localPosition.dy - initialPosition.value;
          if (distance > 100) {
            Get.back();
          }
        },
        child: Center(
          child: Hero(
            tag: 'imageHero',
            child: InteractiveViewer(
              child: 
              Image.network(
                imageUrl,
                errorBuilder: (context, error, stackTrace) {
                  isError.value = true;
                  return SizedBox(
                    // width: 50,
                    // height: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.broken_image,
                          color: Colors.white,
                          size: 30,
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "Gambar tidak tersedia, coba lagi nanti.",
                          style: AllMaterial.workSans(
                              color: AllMaterial.colorWhite),
                        ),
                      ],
                    ),
                  );
                }, 
              ) 
            ),
          ),
        ),
      ),
    );
  }
}
