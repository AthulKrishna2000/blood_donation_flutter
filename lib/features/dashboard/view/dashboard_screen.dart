import 'package:blood_donation_app/features/dashboard/bloc/dashboard_bloc.dart';
import 'package:blood_donation_app/features/dashboard/widgets/bottom_navigation.dart';
import 'package:blood_donation_app/features/home/view/homes_screen.dart';
import 'package:blood_donation_app/features/profile/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  final List<Widget> _screens = const [
    HomeScreen(),
    ProfileScreen(), // Profile Screen Placeholder
  ];

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    return Scaffold(
      body: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          currentIndex = state.selectedIndex;
          return _screens[currentIndex];
        },
      ),
      bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}
