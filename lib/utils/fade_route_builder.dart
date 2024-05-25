import 'package:flutter/cupertino.dart';

PageRouteBuilder fade({required Widget page, RouteSettings? settings}) {
  return PageRouteBuilder(
    settings: settings,
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurvedAnimation(curve: const Interval(0, 1, curve: Curves.linear), parent: animation),
        child: child,
      );
    },
  );
}
