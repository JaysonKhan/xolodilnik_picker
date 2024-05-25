// import 'package:ebb/assets/constants/app_icons.dart';
// import 'package:ebb/features/auth/domain/entities/authentication_status.dart';
// import 'package:ebb/features/auth/presentation/blocs/authentication_bloc/authentication_bloc.dart';
// import 'package:ebb/features/common/presentation/widgets/login_dialog.dart';
// import 'package:ebb/features/common/presentation/widgets/w_scale_animation.dart';
// import 'package:ebb/features/menu/notification/presentation/blocs/notification_bloc.dart';
// import 'package:ebb/features/menu/notification/presentation/pages/notification_screen.dart';
// import 'package:ebb/utils/fade_route_builder.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// class NotificationIconWidget extends StatelessWidget {
//   const NotificationIconWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<NotificationBloc, NotificationState>(
//       builder: (context, state) {
//         return WScaleAnimation(
//           onTap: () {
//             if (context.read<AuthenticationBloc>().state.authenticationStatus != AuthenticationStatus.authenticated) {
//               showLoginDialog(context);
//             } else {
//               Navigator.of(context, rootNavigator: true).push(fade(page: const NotificationScreen()));
//             }
//           },
//           child: Padding(
//             padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
//             child: SvgPicture.asset(state.hasUnread ? AppIcons.notifUnread : AppIcons.alertIcon),
//           ),
//         );
//       },
//     );
//   }
// }
