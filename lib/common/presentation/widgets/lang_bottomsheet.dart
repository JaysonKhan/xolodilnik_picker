import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xolodilnik_picker/assets/colors/colors.dart';
import 'package:xolodilnik_picker/assets/constants/app_icons.dart';
import 'package:xolodilnik_picker/common/presentation/widgets/language_title.dart';
import 'package:xolodilnik_picker/common/presentation/widgets/w_button.dart';
import 'package:xolodilnik_picker/common/presentation/widgets/w_scale_animation.dart';
import 'package:xolodilnik_picker/utils/extensions.dart';

class LanguageBottomSheet extends StatefulWidget {
  final String locale;
  const LanguageBottomSheet({super.key, this.onTapX, required this.locale});

  final Function()? onTapX;

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  List<String> titleList = ['O‘zbekcha', 'Ўзбекча', 'Русский', 'English'];
  List<String> img = [
    AppIcons.flagUz,
    AppIcons.flagUz,
    AppIcons.flagRu,
    AppIcons.flagEn,
  ];
  late int selectedLanguage;

  @override
  void initState() {
    widget.locale == 'uz'
        ? selectedLanguage = 0
        : widget.locale == 'uk'
            ? selectedLanguage = 1
            : widget.locale == 'ru'
                ? selectedLanguage = 2
                : selectedLanguage = 3;

    // StorageRepository.getString('language') == 'uz'
    //     ? selectedLanguage = 0
    //     : StorageRepository.getString('language') == 'uk'
    //         ? selectedLanguage = 1
    //         : StorageRepository.getString('language') == 'ru'
    //             ? selectedLanguage = 2
    //             : selectedLanguage = 3;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 20),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          color: AppColors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  "choose_lang",
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(fontWeight: FontWeight.w800),
                ),
                const Spacer(),
                WScaleAnimation(
                  child: SvgPicture.asset(
                    AppIcons.xBack,
                    width: 24,
                    height: 24,
                    colorFilter: const ColorFilter.mode(AppColors.grey2, BlendMode.dstIn),
                  ),
                  onTap: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Container(height: 1, color: AppColors.grey4),
            ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 16),
                separatorBuilder: (context, index) => Container(height: 1, color: AppColors.grey4),
                itemCount: titleList.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => LanguageTitle(
                      isHaveImage: true,
                      img: img[index],
                      onTap: (value) {
                        selectedLanguage = index;
                        setState(() {});
                      },
                      title: titleList[index],
                      value: selectedLanguage,
                      groupValue: index,
                    )),
            WButton(
              hasGradient: true,
              color: AppColors.red,
              margin: EdgeInsets.only(top: 20, bottom: MediaQuery.of(context).padding.bottom),
              onTap: () {
                Navigator.pop(
                    context,
                    selectedLanguage == 0
                        ? 'uz'
                        : selectedLanguage == 1
                            ? 'uk'
                            : selectedLanguage == 2
                                ? 'ru'
                                : 'en');
              },
              child: Text(
                "confirm",
                style: context.textTheme.headlineMedium!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.white),
              ),
            ),
          ],
        ));
  }
}

class LanguageModel {
  final String title;
  final String flag;
  final String keys;

  const LanguageModel({
    required this.title,
    required this.flag,
    required this.keys,
  });
}
