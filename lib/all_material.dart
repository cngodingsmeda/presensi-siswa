import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

abstract class AllMaterial {
  static var box = GetStorage();

  // Font Family
  static var workSans = GoogleFonts.workSans;

  // Font Weight
  static const fontExtraBold = FontWeight.w800;
  static const fontBold = FontWeight.w700;
  static const fontSemiBold = FontWeight.w600;
  static const fontMedium = FontWeight.w500;
  static const fontRegular = FontWeight.w400;

  // Color
  static const colorPrimary = Color(0xff3EB075);
  static const colorSecondary = Color(0xffCCF9DB);
  static const colorSoftPrimary = Color(0xffF7FFFA);
  static const colorWhite = Colors.white;
  static const colorBlack = Color(0xff0B0B0B);
  static const colorStroke = Color(0xffEDF2EE);
  static const colorGreySec = Color(0xff8F8F8F);
  static const colorBlue = Color(0xff007AFF);
  static const colorRed = Color(0xffFF3B30);
  static const colorMint = Color(0xff00C7BE);

  // Linear Background
  static var linearBackground = const LinearGradient(
    stops: [0, 1],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFEAF5ED),
      Color(0xffffffff),
    ],
  );

  // Top Shadow
  static var topShadow = BoxShadow(
    color: const Color(0x00000000).withOpacity(0.06),
    offset: const Offset(0, -6),
    blurRadius: 24,
    spreadRadius: 5,
  );

  // Page Gradient
  static containerLinear({Widget? child, double padding = 20}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: padding),
      decoration: const BoxDecoration(color: AllMaterial.colorWhite),
      child: child,
    );
  }

  // Button
  static cusButton({
    String? label,
    void Function()? onTap,
    Widget? icon,
    bool addIcon = true,
  }) {
    return ElevatedButton.icon(
      onPressed: onTap,
      label: Text(
        "$label",
        style: AllMaterial.workSans(
          color: AllMaterial.colorWhite,
          fontSize: 16,
          fontWeight: AllMaterial.fontSemiBold,
        ),
      ),
      icon: addIcon == true ? icon : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: AllMaterial.colorPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 14),
        fixedSize: Size(Get.width, 50),
      ),
    );
  }

  // Text Field
  static textField(
      {FocusNode? focusNode,
      String? label,
      TextEditingController? controller}) {
    return TextField(
      selectionControls: MaterialTextSelectionControls(),
      controller: controller,
      focusNode: focusNode,
      cursorColor: AllMaterial.colorPrimary,
      textInputAction: TextInputAction.next,
      onTapOutside: (_) {
        focusNode!.unfocus();
      },
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AllMaterial.colorPrimary,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        hoverColor: AllMaterial.colorPrimary,
        labelText: label,
        labelStyle: AllMaterial.workSans(
          color: AllMaterial.colorBlack.withOpacity(0.6),
          fontWeight: AllMaterial.fontMedium,
        ),
        focusColor: AllMaterial.colorPrimary,
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xffF1ECEC),
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  // Text Outline
  static outlineText({String? title, String? subtitle}) {
    return Container(
      decoration: BoxDecoration(
        color: AllMaterial.colorSoftPrimary,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AllMaterial.colorStroke,
        ),
      ),
      padding: const EdgeInsets.all(11),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title",
            style: AllMaterial.workSans(
              color: AllMaterial.colorPrimary,
              fontWeight: AllMaterial.fontSemiBold,
            ),
          ),
          Text(
            "$subtitle",
            style: AllMaterial.workSans(
              color: AllMaterial.colorBlack,
              fontSize: 18,
              fontWeight: AllMaterial.fontSemiBold,
            ),
          ),
        ],
      ),
    );
  }

  // CARD WIDGET
  static cardWidget(
      {String? atas,
      String? tengah,
      String? bawah,
      void Function()? onTap,
      Widget? svg}) {
    return Material(
      color: AllMaterial.colorPrimary,
      borderRadius: BorderRadius.circular(
        16,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(
          16,
        ),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              16,
            ),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: AllMaterial.colorSecondary,
                    child: svg,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$atas",
                        style: AllMaterial.workSans(
                          color: AllMaterial.colorWhite,
                        ),
                      ),
                      Text(
                        "$tengah",
                        style: AllMaterial.workSans(
                          fontWeight: AllMaterial.fontSemiBold,
                          fontSize: 18,
                          color: AllMaterial.colorWhite,
                        ),
                      ),
                      Text(
                        "$bawah",
                        style: AllMaterial.workSans(
                          color: AllMaterial.colorWhite,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: AllMaterial.colorWhite,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // NOTIF WIDGET
  static notifWidget({
    String? atas,
    String? bawah,
    bool dibaca = false,
    void Function()? onTap,
  }) {
    return Material(
      color: const Color(0xffF9FDFA),
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 7,
          ),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  radius: 5,
                  backgroundColor: AllMaterial.colorRed,
                ),
                const SizedBox(width: 5),
                Container(
                  padding: const EdgeInsets.all(8),
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: AllMaterial.colorSecondary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: SvgPicture.asset("assets/svg/notif.svg"),
                ),
              ],
            ),
            title: Text(
              "$atas",
              style: AllMaterial.workSans(
                fontWeight: AllMaterial.fontSemiBold,
                fontSize: 18,
                color: AllMaterial.colorBlack,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            subtitle: Text(
              "$bawah",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: AllMaterial.workSans(
                color: AllMaterial.colorGreySec,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: AllMaterial.colorPrimary,
              size: 16,
            ),
          ),
        ),
      ),
    );
  }

  // PROFIL WIDGET
  static profilWidget({
    String? title,
    void Function()? onTap,
    IconData? icon,
  }) {
    return Material(
      color: const Color(0xffF9FDFA),
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 7,
          ),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(
              icon,
              color: AllMaterial.colorPrimary,
            ),
            title: Text(
              "$title",
              style: AllMaterial.workSans(
                fontWeight: AllMaterial.fontMedium,
                color: AllMaterial.colorBlack,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: AllMaterial.colorPrimary,
              size: 16,
            ),
          ),
        ),
      ),
    );
  }

  // ICON WIDGET
  static iconWidget({String? title, IconData? icon}) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      margin: const EdgeInsets.only(
        right: 5,
        top: 15,
      ),
      decoration: BoxDecoration(
        color: AllMaterial.colorSoftPrimary,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AllMaterial.colorStroke,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: AllMaterial.colorPrimary,
          ),
          const SizedBox(width: 4),
          Text(
            "$title",
            style: AllMaterial.workSans(
              color: AllMaterial.colorPrimary,
              fontWeight: AllMaterial.fontMedium,
            ),
          ),
        ],
      ),
    );
  }

  // DETAIL BOTTOM SHEET
  static detilKonten({
    Widget? icon,
    String? buttonLabel,
    String? title,
    String? subtitle,
    Widget? konten,
    bool addSubtitle = true,
    void Function()? onTap,
  }) {
    return Get.bottomSheet(
      isDismissible: true,
      isScrollControlled: true,
      Wrap(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 5,
                    width: 135,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: AllMaterial.colorGreySec,
                    ),
                  ),
                ),
                const SizedBox(height: 35),
                Text(
                  "$title",
                  style: AllMaterial.workSans(
                    fontSize: 25,
                    fontWeight: AllMaterial.fontMedium,
                  ),
                ),
                const SizedBox(height: 10),
                addSubtitle == false
                    ? const SizedBox.shrink()
                    : Text(
                        "$subtitle",
                        style: AllMaterial.workSans(
                          fontWeight: AllMaterial.fontMedium,
                          color: AllMaterial.colorGreySec,
                        ),
                      ),
                const SizedBox(height: 20),
                SizedBox(child: konten),
                const SizedBox(height: 20),
                AllMaterial.cusButton(
                  icon: icon,
                  label: "$buttonLabel",
                  onTap: onTap,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // JADWAL WIDGET
  static menuJadwal({
    void Function()? onTap,
    String? title,
    String? subtitle,
    String? context,
    String? subtitleContext,
  }) {
    return Material(
      color: const Color(0xffF9FDFA),
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 7,
          ),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    "$title",
                    style: AllMaterial.workSans(
                      fontWeight: AllMaterial.fontSemiBold,
                      fontSize: 18,
                      color: AllMaterial.colorBlack,
                    ),
                  ),
                ),
                const Icon(Icons.more_horiz),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                RichText(
                  text: TextSpan(
                    text: "$subtitleContext",
                    style: AllMaterial.workSans(
                      color: AllMaterial.colorGreySec,
                    ),
                    children: [
                      TextSpan(
                        text: " $subtitle",
                        style: AllMaterial.workSans(
                          fontWeight: AllMaterial.fontMedium,
                          color: AllMaterial.colorPrimary,
                        ),
                      ),
                    ],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
                AllMaterial.iconWidget(
                  icon: MdiIcons.clock,
                  title: context,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static contextWidget({String? title, String? subtitle, IconData? icon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: AllMaterial.colorPrimary,
            ),
            const SizedBox(width: 5),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                "$subtitle",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AllMaterial.workSans(
                  color: AllMaterial.colorGreySec,
                  fontSize: 16,
                  fontWeight: AllMaterial.fontMedium,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
          child: Text(
            "$title",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AllMaterial.workSans(
              color: AllMaterial.colorBlack,
              fontSize: 16,
              fontWeight: AllMaterial.fontMedium,
            ),
          ),
        ),
      ],
    );
  }

  // Profile Widget
  static editableWidget({
    FocusNode? focusNode,
    String? label,
    TextEditingController? controller,
    int maxLines = 1,
    bool addRowButton = false,
    String? rowButtonLabel,
    void Function()? onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$label",
              style: AllMaterial.workSans(
                fontWeight: AllMaterial.fontMedium,
                fontSize: 14,
                color: AllMaterial.colorGreySec,
              ),
            ),
            addRowButton == true
                ? TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(5),
                      overlayColor: AllMaterial.colorPrimary,
                    ),
                    onPressed: onTap,
                    child: Text(
                      "$rowButtonLabel",
                      style: AllMaterial.workSans(
                        fontWeight: AllMaterial.fontMedium,
                        fontSize: 14,
                        color: AllMaterial.colorBlack,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          focusNode: focusNode,
          maxLines: maxLines,
          cursorColor: AllMaterial.colorPrimary,
          textInputAction: TextInputAction.next,
          onTapOutside: (_) {
            focusNode!.unfocus();
          },
          style: AllMaterial.workSans(
            color: AllMaterial.colorGreySec,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 14,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AllMaterial.colorPrimary,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            hoverColor: AllMaterial.colorPrimary,
            focusColor: AllMaterial.colorPrimary,
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xffEDF2EE),
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        const SizedBox(height: 25),
      ],
    );
  }

  // Message Scaffold
  static void messageScaffold({required String title}) {
    if (Get.context != null) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 2),
          content: Text(title),
        ),
      );
    }
  }

  static String getErrorMessage(int statusCode) {
    switch (statusCode) {
      case 400:
        return "Permintaan tidak valid. Periksa input Anda.";
      case 401:
        return "Anda tidak memiliki akses. Silakan login.";
      case 403:
        return "Anda tidak diizinkan untuk mengakses halaman ini.";
      case 404:
        return "Data tidak ditemukan.";
      case 408:
        return "Waktu habis. Silakan coba lagi.";
      case 500:
        return "Terjadi kesalahan pada server. Silakan coba lagi nanti.";
      case 502:
        return "Server sedang tidak dapat diakses. Coba lagi nanti.";
      case 503:
        return "Layanan sedang tidak tersedia. Silakan coba beberapa saat lagi.";
      case 504:
        return "Server tidak merespons tepat waktu. Silakan coba lagi.";
      default:
        return "Terjadi kesalahan tidak diketahui.";
    }
  }
}
