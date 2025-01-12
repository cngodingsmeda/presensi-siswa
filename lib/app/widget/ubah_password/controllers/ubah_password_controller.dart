import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UbahPasswordController extends GetxController {
  TextEditingController emailC = TextEditingController();
  TextEditingController otpC = TextEditingController();
  TextEditingController passBefC = TextEditingController();
  TextEditingController passNewC = TextEditingController();
  TextEditingController confirmPassNewC = TextEditingController();
  FocusNode emailF = FocusNode();
  FocusNode otpF = FocusNode();
  FocusNode passBefF = FocusNode();
  FocusNode passNewF = FocusNode();
  FocusNode confirmPassNewF = FocusNode();

  var isOtpComplete = false.obs;
}
