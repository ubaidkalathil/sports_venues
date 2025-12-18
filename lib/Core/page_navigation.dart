import 'package:flutter/cupertino.dart';
import 'dart:io' as io;

class PageNavigation {
  static void pushTo(BuildContext context, Widget screen) {
    Navigator.of(context, rootNavigator: true).push(
      io.Platform.isAndroid
          ? PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => screen,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
              transitionDuration: const Duration(milliseconds: 200),
            )
          : CupertinoPageRoute(builder: (context) => screen),
    );
  }

  static void pushReplaceTo(BuildContext context, Widget screen) {
    Navigator.of(context, rootNavigator: true).pushReplacement(
      io.Platform.isAndroid
          ? PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => screen,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
              transitionDuration: const Duration(milliseconds: 200),
            )
          : CupertinoPageRoute(builder: (context) => screen),
    );
  }

  static void pushRemoveUntil(BuildContext context, Widget screen) {
    Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
      io.Platform.isAndroid
          ? PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => screen,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
              transitionDuration: const Duration(milliseconds: 200),
            )
          : CupertinoPageRoute(builder: (context) => screen),
      (route) => route.isCurrent,
    );
  }

  static void pushToFromBottom(BuildContext context, Widget screen) {
    Navigator.of(context, rootNavigator: true).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }

  static void pushToFromRight(BuildContext context, Widget screen) {
    Navigator.of(context, rootNavigator: true).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = const Offset(1.0, 0.0);
          var end = Offset.zero;
          var tween = Tween(begin: begin, end: end);

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }

  static void pushToAndoid(BuildContext context, Widget screen) {
    Navigator.of(context, rootNavigator: true).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }

  static void pushToIOS(BuildContext context, Widget screen) {
    Navigator.of(
      context,
      rootNavigator: true,
    ).push(CupertinoPageRoute(builder: (context) => screen));
  }
}
