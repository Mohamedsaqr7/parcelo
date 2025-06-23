import 'package:flutter/material.dart';

class BaseRoute extends PageRouteBuilder<dynamic> {
  BaseRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              Stack(children: [page]),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget widget,
          ) {
            // تحديد البداية والنهاية للحركة
            const begin = Offset(1.0, 0.0); // يبدأ من اليمين إلى اليسار
            const end = Offset.zero; // ينتهي عند موضعه الطبيعي
            final tween = Tween(begin: begin, end: end);
            final curvedAnimation = CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            );

            return SlideTransition(
              position: tween.animate(curvedAnimation),
              child: widget,
            );
          },
        );
  Widget page;
}