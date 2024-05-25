import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xolodilnik_picker/assets/colors/colors.dart';

abstract class AppTheme {
  static ThemeData theme() => ThemeData(
        useMaterial3: false,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
        scaffoldBackgroundColor: AppColors.white,
        fontFamily: 'VelaSans',
        // splashColor: AppColors.mainDark,
        highlightColor: AppColors.white,
        primaryColor: AppColors.yellow,
        primaryColorLight: AppColors.white,
        primaryColorDark: AppColors.yellow,
        hintColor: AppColors.grey2,
        disabledColor: AppColors.darkRed,
        iconTheme: const IconThemeData(color: AppColors.grey1),
        hoverColor: AppColors.darkRed,
        // shadowColor: buttonColor.withOpacity(0.36),
        unselectedWidgetColor: AppColors.mainDark,
        cardColor: AppColors.mainDark,
        focusColor: AppColors.mainDark,
        // buttonTheme: const ButtonThemeData(buttonColor: AppColors.greyButton),
        canvasColor: AppColors.mainDark,
        bottomSheetTheme: const BottomSheetThemeData(backgroundColor: AppColors.mainDark),
        //color,
        progressIndicatorTheme: ProgressIndicatorThemeData(
          refreshBackgroundColor: AppColors.white,
          color: AppColors.mainOrange,
          circularTrackColor: AppColors.mainOrange,
          linearTrackColor: AppColors.mainOrange,
        ),
        dividerTheme: const DividerThemeData(color: AppColors.mainDark),
        secondaryHeaderColor: AppColors.mainDark,
        // toggleButtonsTheme: const ToggleButtonsThemeData(focusColor: mainGreen),
        // navigationBarTheme: const NavigationBarThemeData(backgroundColor: white),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: AppColors.white,
            selectedItemColor: AppColors.mainDark,
            unselectedItemColor: AppColors.grey2,
            selectedLabelStyle: TextStyle(color: AppColors.mainDark, fontWeight: FontWeight.w600, fontSize: 11),
            unselectedLabelStyle: TextStyle(color: AppColors.grey2, fontWeight: FontWeight.w400, fontSize: 11),
            selectedIconTheme: IconThemeData(color: AppColors.mainDark),
            unselectedIconTheme: IconThemeData(color: AppColors.mainDark)),
        dividerColor: AppColors.mainDark,
        // bannerTheme: const MaterialBannerThemeData(backgroundColor: AppColors.dividerColor),
        appBarTheme: AppBarTheme(
          elevation: 0,
          iconTheme: const IconThemeData(color: AppColors.mainDark),
          titleTextStyle: displayMedium.copyWith(color: AppColors.mainDark),
          centerTitle: true,
          backgroundColor: AppColors.white,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Platform.isIOS ? AppColors.mainDark : AppColors.white,
              statusBarIconBrightness: Platform.isIOS ? Brightness.light : Brightness.dark,
              statusBarBrightness: Platform.isIOS ? Brightness.light : Brightness.dark,
              // systemNavigationBarColor: Platform.isIOS ? AppColors.mainDark : AppColors.white,
              systemNavigationBarIconBrightness: Brightness.dark),
        ),
        // tabBarTheme: TabBarTheme(
        //     indicatorColor: mainGreen,
        //     labelColor: dark,
        //     indicator: BoxDecoration(color: dividerColor, borderRadius: BorderRadius.circular(7))),
        // radioTheme: const RadioThemeData(
        //     visualDensity: VisualDensity.compact, materialTapTargetSize: MaterialTapTargetSize.shrinkWrap),
        // sliderTheme: SliderThemeData(
        //     valueIndicatorColor: grey,
        //     thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 7),
        //     overlayShape: SliderComponentShape.noOverlay),
        // listTileTheme: const ListTileThemeData(
        //     style: ListTileStyle.drawer, textColor: grey, tileColor: listTileColor, iconColor: grey),
        cardTheme: const CardTheme(
          color: AppColors.mainDark, /*surfaceTintColor: grey*/
        ),
        // popupMenuTheme: const PopupMenuThemeData(color: grey, surfaceTintColor: grey),
        drawerTheme: const DrawerThemeData(
            backgroundColor: AppColors.mainDark, scrimColor: AppColors.mainDark, surfaceTintColor: AppColors.white, shadowColor: AppColors.mainDark),
        // floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: buttonGreenColor),
        textTheme: const TextTheme(
            displayLarge: displayLarge,
            displayMedium: displayMedium,
            displaySmall: displaySmall,
            headlineLarge: headlineLarge,
            headlineMedium: headlineMedium,
            headlineSmall: headlineSmall,
            titleLarge: titleLarge,
            titleMedium: titleMedium,
            titleSmall: titleSmall,
            bodyLarge: bodyLarge,
            bodyMedium: bodyMedium,
            bodySmall: bodySmall,
            labelLarge: labelLarge,
            labelMedium: labelMedium,
            labelSmall: labelSmall),
      );

  // Fonts
  static const displayLarge = TextStyle(fontSize: 25, fontWeight: FontWeight.w700, color: AppColors.mainDark, letterSpacing: 0.1);
  static const displayMedium = TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.mainDark, letterSpacing: 0.1);
  static const displaySmall = TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.mainDark, letterSpacing: 0.1);
  static const headlineLarge = TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.mainDark, letterSpacing: 0.1);
  static const headlineMedium = TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: AppColors.mainDark, letterSpacing: 0.1);
  static const headlineSmall = TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.mainDark, letterSpacing: 0.1);
  static const titleLarge = TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.mainDark, letterSpacing: 0.1);
  static const titleMedium = TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.mainDark, letterSpacing: 0.1);
  static const titleSmall = TextStyle(fontSize: 11, fontWeight: FontWeight.w400, color: AppColors.mainDark, letterSpacing: 0.1);
  static const bodyLarge = TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.mainDark, letterSpacing: 0.1);
  static const bodyMedium = TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.mainDark, letterSpacing: 0.1);
  static const bodySmall = TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.mainDark, letterSpacing: 0.1);
  static const labelLarge = TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: AppColors.white, letterSpacing: 0.1);
  static const labelMedium = TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.mainDark, letterSpacing: 0.1);
  static const labelSmall = TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: AppColors.mainDark, letterSpacing: 0.1);
}
