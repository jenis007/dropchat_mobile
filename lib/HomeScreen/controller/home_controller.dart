import 'package:dropchats/main.dart';
import 'package:dropchats/utils/app_snackbar.dart';
import 'package:dropchats/utils/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
    getCurrentLocation();
    socket();
    super.onInit();
  }

  void socket() {
    service.socket.emit('msg', 'test');
    service.socket.on('event', (data) => print(data));
    service.socket.disconnect();
  }

  Future<void> getLocationPermissions() async {
    LocationPermission permission = await Geolocator.checkPermission();
    debugPrint("current");
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      // Permission is granted, get current location
      try {
        Position initPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );

        // Now you can update your currentLatLng with the obtained position
        currentLatLng = LatLng(initPosition.latitude, initPosition.longitude);
      } catch (e) {
        print('Error getting current location: $e');
      }
    } else {
      MyToasts.warningToast(toast: 'Please Give Location Permissions');
      // alertDialog();
    }
  }
}

Future<LatLng?> getCurrentLocation() async {
  // Define a fallback static LatLng value
  LatLng staticLatLng = const LatLng(34.0206085, -118.7413786);

  // Example: San Francisco coordinates
  // if (!(await Geolocator.isLocationServiceEnabled())) {
  //   MyToasts.errorToast(toast: 'Please enable device location');
  //   // Return the static LatLng value
  //   return staticLatLng;
  // }

  LocationPermission permission = await Geolocator.requestPermission();
  debugPrint("getCurrentLocation------------------->");

  if (permission == LocationPermission.denied ||
      permission == LocationPermission.deniedForever ||
      permission == LocationPermission.unableToDetermine) {
    debugPrint("Location permission denied------------------->");
    // Return the static LatLng value
    return staticLatLng;
  } else {
    Position initPosition;
    try {
      initPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
    } catch (e) {
      debugPrint("Error getting current position: $e");
      // Return the static LatLng value in case of an error
      return staticLatLng;
    }

    debugPrint(
        "initPosition: ${initPosition.latitude},${initPosition.longitude}");

    currentLatLng = LatLng(initPosition.latitude, initPosition.longitude);

    return LatLng(initPosition.latitude, initPosition.longitude);
  }
}
