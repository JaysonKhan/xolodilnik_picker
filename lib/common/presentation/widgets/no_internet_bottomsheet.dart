import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:xolodilnik_picker/assets/colors/colors.dart';
import 'package:xolodilnik_picker/assets/constants/app_icons.dart';
import 'package:xolodilnik_picker/assets/constants/app_images.dart';
import 'package:xolodilnik_picker/common/presentation/bloc/internet_bloc/internet_bloc.dart';
import 'package:xolodilnik_picker/common/presentation/widgets/w_button.dart';
import 'package:xolodilnik_picker/common/presentation/widgets/w_scale_animation.dart';
import 'package:xolodilnik_picker/utils/extensions.dart';

class NoInternetBottomSheet extends StatelessWidget {
  const NoInternetBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetBloc, InternetState>(
      listener: (context, state) {
        if (state.isConnected == true) {
          Navigator.of(context).pop();
        }
      },
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Container(
          padding: const EdgeInsets.only(
            bottom: 20,
          ),
          decoration: BoxDecoration(
            color: context.theme.primaryColorLight,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16),
              topLeft: Radius.circular(16),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                  alignment: Alignment.centerRight,
                  child: BlocBuilder<InternetBloc, InternetState>(
                    builder: (context, state) {
                      return WScaleAnimation(
                          onTap: () {
                            if (state.isConnected) {
                              Navigator.of(context).pop();
                            } else {}
                          },
                          child: Padding(padding: const EdgeInsets.all(16), child: SvgPicture.asset(AppIcons.xBack)));
                    },
                  )),
              Image.asset(
                AppImages.noInternet,
                height: 162,
              ),
              const SizedBox(height: 23),
              Text("network_error",
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      )),
              const SizedBox(height: 8),
              Text("network_error_description",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.grey1,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      )),
              const SizedBox(height: 34),
              BlocBuilder<InternetBloc, InternetState>(
                builder: (context, state) {
                  return WButton(
                    hasGradient: true,
                    textColor: AppColors.white,
                    isLoading: state.status == FormzSubmissionStatus.inProgress,
                    margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom + 16, left: 16, right: 16),
                    borderRadius: 10,
                    onTap: () {
                      context.read<InternetBloc>().add(CheckConnectionEvent(
                          onError: () {},
                          onSuccess: () {
                            Navigator.of(context).pop();
                          }));
                    },
                    text: "again",
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

void showNoInternetBottomSheet(BuildContext context) {
  showModalBottomSheet(
    isDismissible: false,
    context: context,
    enableDrag: false,
    backgroundColor: Colors.transparent,
    builder: (context) => const NoInternetBottomSheet(),
  );
}
