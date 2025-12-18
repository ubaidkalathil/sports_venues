import 'package:connectivity_plus/connectivity_plus.dart';

class BasicUtils {
  static Future<bool> checkConnection() async {
    bool status = false;
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile)) {
      // Mobile network available.
      status = true;
    } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
      // Wi-fi is available.
      // Note for Android:
      // When both mobile and Wi-Fi are turned on system will return Wi-Fi only as active network type
      status = true;
    } else if (connectivityResult.contains(ConnectivityResult.none)) {
      // No available network types
      status = false;
    }

    return status;
  }
}
