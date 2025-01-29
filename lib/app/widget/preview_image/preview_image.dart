import 'package:flutter/material.dart';
import 'package:presensi_siswa/all_material.dart';

class PreviewImage extends StatelessWidget {
  final String fileName;

  const PreviewImage({super.key, required this.fileName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Hero(
              tag: 'imageHero',
              child: Image.network(
                fileName,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fileName.split('/').last.toString().split(' ').join('-'),
                  style: AllMaterial.workSans(
                    fontSize: 16,
                    fontWeight: AllMaterial.fontBold,
                  ),
                ),
                Text(
                  fileName.split('.').last,
                  style: AllMaterial.workSans(
                    fontSize: 14,
                    color: AllMaterial.colorGreySec,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
