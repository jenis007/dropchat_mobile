import 'dart:convert';
import 'package:dropchats/model/SingUp_model.dart';
import 'package:dropchats/utils/shared_prefs.dart';
import 'package:get/get.dart';

import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketService extends GetxService {
  // final String baseUrl="http://192.168.29.147:7000/v1"; ///krushang
  // final String baseUrl = "http://192.168.29.59:7000/v1"; ///jignesh
  //final String baseUrl  = "http://68.183.91.39:7002/v1"; ///live
  //  final String baseUrl = "http://68.183.91.39:7000/v1"; ///dev
  //  final String baseUrl = "https://7majlis.com:7001/v1"; ///stage
  final String baseUrl = "https://dev.dropchats.one";
  UserData? userData;

  ///live

  late io.Socket socket;
  bool socketAssigned = false;

  void initializeSocket() {
    if (socketAssigned) return;
    socketAssigned = true;
    socket = io.io(baseUrl, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
    });
    socket.onConnect((_) {
      print('connect');
      socket.emit('msg', 'test');
    });
    socket.onConnect((_) => print('connected'));
    // socket.onDisconnect((_) => print('Disconnected'));
    socket.onError((error) => print('Error: $error'));

    if (!socket.connected) socket.connect();
  }

  void reConnect() {
    if (!socket.connected) socket.connect();
  }

  void disconnect() => socket.dispose();

  void justDisconnect() => socket.disconnect();

  void sendEvent(String eventName, Map<String, dynamic> event) {
    socket.emit(eventName, event);
  }

  int? get currentUser {
    final savedData =
        preferences.getString(SharedPreference.userData).toString();
    // final savedData =
    //     getIt<SharedPrefService>().getData(LocalStorageKey.userData);
    if (savedData.isEmpty || savedData == null) return null;
    userData = UserData.fromJson(jsonDecode(savedData));
    // UserDetails userDetails = UserDetails.fromJson(jsonDecode(savedData));
    return userData?.id;
  }
}
