import 'package:flutter/material.dart';

enum CustomPageTransitionType {
  leftToRight,
  bottomToTop,
}

extension CustomPageTransitionTypeExtension on CustomPageTransitionType {
  bool get isLeftToRight => this == CustomPageTransitionType.leftToRight;
  bool get isBottomToTop => this == CustomPageTransitionType.bottomToTop;
}

Route<dynamic> customPageTransition(Widget page, RouteSettings settings,
    {CustomPageTransitionType transitionType =
        CustomPageTransitionType.leftToRight}) {
  return PageRouteBuilder(
    settings: settings,
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final enterBegin = getOffset(transitionType);
      const enterEnd = Offset.zero;
      const curve = Curves.easeInOut;

      var enterTween = Tween(begin: enterBegin, end: enterEnd)
          .chain(CurveTween(curve: curve));
      var enterAnimation = animation.drive(enterTween);

      return SlideTransition(
        position: enterAnimation,
        child: child,
      );
    },
  );
}

Offset getOffset(CustomPageTransitionType transitionType) {
  switch (transitionType) {
    case CustomPageTransitionType.leftToRight:
      return const Offset(1.0, 0.0);
    case CustomPageTransitionType.bottomToTop:
      return const Offset(0.0, 1.0);
  }
}
