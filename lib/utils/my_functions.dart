import 'dart:async';
import 'package:html/parser.dart';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:xolodilnik_picker/assets/constants/enums.dart';

// TODO keraksizlari chopilsin!!!
abstract class MyFunctions {
  static String formatDoubleNumber(String doubleNumber) {
    double number = double.tryParse(doubleNumber) ?? 0;
    int numberInt = number.floor();
    double numberDouble = number - numberInt;
    String numberDoubleString = numberDouble.toString();
    if (numberDoubleString.length > 5) {
      return "${formatNumber(numberInt.toString())}.${numberDoubleString.substring(2, 5)}";
    } else {
      return "${formatNumber(numberInt.toString())}.0";
    }
  }

  static String? parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String? parsedString = parse(document.body?.text).documentElement?.text;

    return parsedString;
  }

  static String formatNumber(String number) {
    final rNumber = number.replaceAll(' ', '').replaceAll('.', '').split('').reversed.join();
    String formatted = '';
    for (int i = 0; i < rNumber.length; i++) {
      if ((i + 1) % 3 == 0 && i != rNumber.length - 1) {
        formatted = ' ${rNumber[i]}$formatted';
      } else {
        formatted = rNumber[i] + formatted;
      }
    }
    return formatted;
  }

  static String formatDateFromApi(
    String date, {
    String? format = 'dd.MM.yyyy',
    bool withTime = false,
  }) {
    DateTime dateTime;
    if (date.isNotEmpty) {
      dateTime = DateTime.parse(date);
    } else {
      dateTime = DateTime.now();
    }
    if (!withTime) {
      return DateFormat(format).format(dateTime);
    } else {
      return DateFormat("$format, HH:mm").format(dateTime);
    }
  }

  static String getTranslate({required String textKey, required Map<String, dynamic> translations}) {
    String result = textKey;
    if (translations.containsKey(textKey)) {
      result = translations[textKey];
      return result;
    }
    return result;
  }

  static String phoneFormatter(String content, List<int> stopsList) {
    final buffer = StringBuffer();
    for (int i = 0; i < content.length; i++) {
      if (stopsList.contains(i + 1)) {
        buffer.write(' ');
      }
      buffer.write(content[i]);
    }
    return buffer.toString();
  }

  static Future<PermissionStatus> getCameraPermission(bool platformIsAndroid) async {
    if (platformIsAndroid) {
      var permission = await Permission.camera.status;
      if (!permission.isGranted) {
        permission = await Permission.camera.request();
      }
      return permission;
    }
    return PermissionStatus.granted;
  }

  static Future<PermissionStatus> getPhotosPermission(bool platformIsAndroid) async {
    if (platformIsAndroid) {
      Permission permissionType;

      final androidInfo = await DeviceInfoPlugin().androidInfo;

      if (androidInfo.version.sdkInt <= 32) {
        permissionType = Permission.storage;
      } else {
        permissionType = Permission.photos;
      }

      var permission = await permissionType.status;
      permission = await permissionType.request();

      if (permission != PermissionStatus.granted) {
        permission = await permissionType.request();
      }
      return permission;
    }
    return PermissionStatus.granted;
  }

  static Future<LocationPermissionStatus> getWhetherPermissionGranted() async {
    try {
      final isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!isLocationServiceEnabled) {
        return LocationPermissionStatus.locationServiceDisabled;
      } else {
        final geoPermission = await Geolocator.checkPermission();
        if (geoPermission == LocationPermission.denied || geoPermission == LocationPermission.deniedForever) {
          final permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.always || permission == LocationPermission.whileInUse) {
            return LocationPermissionStatus.permissionGranted;
          } else {
            return LocationPermissionStatus.permissionDenied;
          }
        }
        if (geoPermission == LocationPermission.always || geoPermission == LocationPermission.whileInUse) {
          return LocationPermissionStatus.permissionGranted;
        } else {
          return LocationPermissionStatus.permissionDenied;
        }
      }
    } on Exception {
      return LocationPermissionStatus.permissionDenied;
    }
  }

  static Future<Position?> getCurrentLocation() async {
    try {
      return await Geolocator.getCurrentPosition();
    } on Exception {
      return null;
    }
  }

  static String getMonthName(int index) {
    // assert(index < 1 || index > 12, 'Allowed range is from 1 to 12');
    switch (index) {
      case 1:
        return 'Январь';
      case 2:
        return 'Февраль';
      case 3:
        return 'Март';
      case 4:
        return 'Апрель';
      case 5:
        return 'Май';
      case 6:
        return 'Июнь';
      case 7:
        return 'Июль';
      case 8:
        return 'Август';
      case 9:
        return 'Сентябрь';
      case 10:
        return 'Октябрь';
      case 11:
        return 'Ноябрь';
      case 12:
        return 'Декабрь';
      default:
        return '';
    }
  }

  static String getFormatCost(String cost) {
    if (cost.isEmpty) return '';
    var oldCost = cost;
    if (cost.contains('.')) {
      final arr = cost.split('.');
      oldCost = arr.first;
    }
    var newCost = '';
    for (var i = 0; i < oldCost.length; i++) {
      if ((oldCost.length - i) % 3 == 0) newCost += ' ';
      newCost += oldCost[i];
    }
    return newCost.trimLeft();
  }
}
