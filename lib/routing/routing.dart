import 'package:blood_donation_app/app/view/custom_page_transition.dart';
import 'package:blood_donation_app/features/auth/presentation/screen/register_screen.dart';
import 'package:blood_donation_app/routing/routes.dart';
import 'package:flutter/material.dart';

class AppRouter {
  AppRouter();

  Route onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;

    switch (settings.name) {
      case registerScreen:
        return customPageTransition(const RegisterScreen(), settings);
      default:
        return customPageTransition(Container(), settings);
    }
  }
}
