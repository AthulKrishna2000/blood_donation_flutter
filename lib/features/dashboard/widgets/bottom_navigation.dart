import 'package:blood_donation_app/core/theme/app_colors.dart';
import 'package:blood_donation_app/features/dashboard/bloc/dashboard_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        final currentIndex = state.selectedIndex;

        return Container(
          height: 55,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppColors.containerBackground,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              /// 🔹 Home
              _navItem(
                context,
                icon: Icons.home,
                label: "Home",
                index: 0,
                currentIndex: currentIndex,
              ),

              /// 🔹 Profile
              _navItem(
                context,
                icon: Icons.person,
                label: "Profile",
                index: 1,
                currentIndex: currentIndex,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _navItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required int index,
    required int currentIndex,
  }) {
    final isSelected = index == currentIndex;

    return Container(
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.primary.withOpacity(0.1)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          context.read<DashboardBloc>().add(SelectTableEvent(index: index));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 22, // 🔥 smaller icon
                color: isSelected ? AppColors.primary : AppColors.secondary,
              ),
              //const SizedBox(height: 2),
              Text(
                label,
                style: TextStyle(
                  fontSize: 11,
                  color: isSelected ? AppColors.primary : AppColors.secondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
