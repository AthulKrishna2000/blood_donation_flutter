import 'package:blood_donation_app/core/theme/app_colors.dart';
import 'package:blood_donation_app/features/profile/widgets/container_widget.dart';
import 'package:flutter/material.dart';

class ProfileNameWidget extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String status;
  final String description;
  const ProfileNameWidget({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.status,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ContainerWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                // color: AppColors.primary.withOpacity(0.1),
              ),

              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
              child: Text(
                status,
                style: TextStyle(
                  fontSize: 12,
                  //fontWeight: FontWeight.bold,
                  color: AppColors.textDark.withOpacity(0.7),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              '$firstName\n$lastName',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
                color: AppColors.textDark,
              ),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                fontSize: 14,
                //fontWeight: FontWeight.bold,
                color: AppColors.textDark.withOpacity(0.4),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
