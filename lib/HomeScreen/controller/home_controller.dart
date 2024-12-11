import 'package:dropchats/utils/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TabController? tabController;
  RxBool firstTimeOpen = false.obs;
  void finishSetup() {
    firstTimeOpen.value = false;
    update();
  }

  HomeController() : service = Get.find<SocketService>();
  final SocketService service;

  void onInit() {
    service.initializeSocket();
    socket();
    super.onInit();
  }

  void socket() {
    service.socket.emit('msg', 'test');
    service.socket.on('event', (data) => print(data));
    service.socket.disconnect();
  }
}
