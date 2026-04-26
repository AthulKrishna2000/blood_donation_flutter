import 'package:blood_donation_app/core/theme/app_colors.dart';
import 'package:blood_donation_app/features/donor/bloc/donor_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BloodGroupFilterWidget extends StatelessWidget {
  final String bloodGroup;
  final Color? color;
  final VoidCallback? onSelected;

  const BloodGroupFilterWidget({
    super.key,
    required this.bloodGroup,
    this.color,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: Container(
        height: 40,
        width: 60,
        decoration: BoxDecoration(
          color: color ?? AppColors.primary,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            bloodGroup,
            style: TextStyle(
              color: (color ?? AppColors.primary) == Colors.white
                  ? AppColors.primary
                  : Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
