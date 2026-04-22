import 'package:blood_donation_app/core/theme/app_colors.dart';
import 'package:blood_donation_app/features/profile/widgets/container_widget.dart';
import 'package:flutter/material.dart';

class FinderDonorButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const FinderDonorButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onPressed,
        behavior: HitTestBehavior.opaque,
        child: ContainerWidget(
          backgroundColor: AppColors.primary,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person_search_outlined,
                color: AppColors.containerBackground,
              ),
              SizedBox(width: 8),
              Text(
                "Find Donors",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.containerBackground,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
