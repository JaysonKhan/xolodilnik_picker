import 'package:flutter/material.dart';
import 'package:xolodilnik_picker/assets/colors/colors.dart';
import 'package:xolodilnik_picker/assets/constants/app_icons.dart';

enum AppLang {
  uzbek(title: 'uz'),
  russian(title: 'ru'),
  english(title: 'en');

  const AppLang({required this.title});

  final String title;

  bool get isUzbek => this == AppLang.uzbek;
  bool get isRussian => this == AppLang.russian;
  bool get isEnglish => this == AppLang.english;
}

enum LocationPermissionStatus {
  locationServiceDisabled,
  permissionDenied,
  permissionGranted;

  bool get isLocationServiceDisabled => this == LocationPermissionStatus.locationServiceDisabled;
  bool get isPermissionDenied => this == LocationPermissionStatus.permissionDenied;
  bool get isPermissionGranted => this == LocationPermissionStatus.permissionGranted;
}

enum PopUpStatus {
  failure(AppIcons.failure, AppColors.whiteSmoke1),
  success(AppIcons.success, AppColors.whiteSmoke1),
  warning(AppIcons.failure, AppColors.whiteSmoke1);

  final String icon;
  final Color color;
  const PopUpStatus(this.icon, this.color);
  bool get isFailure => this == PopUpStatus.failure;
  bool get isSuccess => this == PopUpStatus.success;
  bool get isWarning => this == PopUpStatus.warning;
}

enum OrderStatus {
  accepted(AppIcons.check, AppColors.blue),
  collected(AppIcons.shoppingCart, AppColors.mainOrange),
  on_the_way(AppIcons.map, AppColors.onTheWayStatus),
  delivered(AppIcons.flag, AppColors.green),
  cancelled(AppIcons.check, AppColors.red),
  ;

  final String icon;
  final Color color;
  const OrderStatus(this.icon, this.color);
}
// ('accepted', 'Accepted'),
// ('collected', 'Collected'),
// ('on_the_way', 'On the way'),
// ('delivered', 'Delivered'),
// ('cancelled', 'Cancelled'),
