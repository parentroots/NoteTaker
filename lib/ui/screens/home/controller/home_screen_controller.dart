import 'dart:async';

import 'package:get/get.dart';

class HomeScreenController extends GetxController{
  String currentTime = "";
  late Timer _timer;

  @override
  void onInit() {
    super.onInit();
    _updateTime();
    _timer = Timer.periodic(Duration(seconds: 1), (_) => _updateTime());
  }

  void _updateTime() {
    final now = DateTime.now();

    int hour = now.hour;
    String amPm = hour >= 12 ? "PM" : "AM";

    // 12-hour format
    if (hour > 12) hour -= 12;
    if (hour == 0) hour = 12;

    currentTime = "${_twoDigits(hour)}:${_twoDigits(now.minute)}:${_twoDigits(now.second)} $amPm";
    update(); // UI update
  }

  String _twoDigits(int n) => n.toString().padLeft(2, '0');

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}