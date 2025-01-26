import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:presensi_siswa/all_material.dart';

class StatusRow extends StatelessWidget {
  final Map<String, Map<String, dynamic>?>? dataSiswa;
  final int? jumlahMapel;
  final String? namaSiswa;

  const StatusRow({
    super.key,
    required this.dataSiswa,
    required this.jumlahMapel,
    required this.namaSiswa,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        jumlahMapel ?? 0,
        (index) {
          String key = (index + 1).toString();

          var siswaKey = namaSiswa ?? "";
          final status = dataSiswa?[siswaKey]?[key];

          return _buildIcon(status);
        },
      ),
    );
  }

  Widget _buildIcon(Map<String, dynamic>? data) {
    IconData icon = Icons.clear;
    Color color = Colors.red;

    if (data != null) {
      final String? status = data["status"];
      if (status == "hadir") {
        icon = Icons.check;
        color = AllMaterial.colorPrimary;
      } else if (status == "izin") {
        icon = MdiIcons.fileChart;
        color = AllMaterial.colorBlue;
      } else if (status == "sakit") {
        icon = MdiIcons.clipboardPlus;
        color = AllMaterial.colorMint;
      }
    }

    return Icon(
      icon,
      color: color,
    );
  }
}
