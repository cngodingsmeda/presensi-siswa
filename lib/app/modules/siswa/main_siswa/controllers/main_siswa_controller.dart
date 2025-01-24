import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainSiswaController extends GetxController {
  var currentIndexBar = 0.obs;
  PageController pageController = PageController();
  var isLoading = true.obs;
}
