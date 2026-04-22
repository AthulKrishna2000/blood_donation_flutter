import 'package:blood_donation_app/app/view/custom_page_transition.dart';
import 'package:blood_donation_app/features/auth/presentation/screen/register_screen.dart';
import 'package:blood_donation_app/features/dashboard/view/dashboard_screen.dart';
import 'package:blood_donation_app/features/donor/view/donor_listing_screen.dart';
import 'package:blood_donation_app/features/home/view/homes_screen.dart';
import 'package:blood_donation_app/features/profile/view/edit_profile_screen.dart';
import 'package:blood_donation_app/features/profile/view/profile_screen.dart';
import 'package:blood_donation_app/routing/routes.dart';
import 'package:flutter/material.dart';

class AppRouter {
  AppRouter();

  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case registerScreen:
        return customPageTransition(const RegisterScreen(), settings);
      case homeScreen:
        return customPageTransition(const HomeScreen(), settings);
      case editprofileScreen:
        final args = settings.arguments as Map<String, String>? ?? {};
        return customPageTransition(
          EditProfileScreen(
            initialBloodGroup: args['initialBloodGroup'] ?? '',
            initialPhone: args['initialPhone'] ?? '',
            initialLocation: args['initialLocation'] ?? '',
            initialFirstName: args['initialFirstName'] ?? '',
            initialLastName: args['initialLastName'] ?? '',
          ),
          settings,
        );
      case profileScreen:
        return customPageTransition(const ProfileScreen(), settings);
      case dashboardScreen:
        return customPageTransition(const DashboardScreen(), settings);
      case donorSearchScreen:
        return customPageTransition(const DonorListingScreen(), settings);
      default:
        return customPageTransition(Container(), settings);
    }
  }
}
