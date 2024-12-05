import 'package:flutter/foundation.dart';

import '../utils/shared_prefs.dart';

void debugPrintData({required dynamic tittle, dynamic val}) {
  if (kDebugMode) {
    debugPrint("$tittle:-$val");
  }
}

Map<String, String> requestHeader(passAuthToken) {
  return {
    "Content-Type": "application/json",
    if (passAuthToken == true)
      "Authorization":
          "Bearer ${preferences.getString(SharedPreference.ACCESS_TOKEN)}",
  };
}
