import 'package:blood_donation_app/core/theme/app_colors.dart';
import 'package:blood_donation_app/features/profile/widgets/container_widget.dart';
import 'package:flutter/material.dart';

class TitalWidget extends StatelessWidget {
  final String firsttitle;
  final String lasttitle;
  final String description;
  const TitalWidget({
    super.key,
    required this.firsttitle,
    required this.lasttitle,
    this.description = "",
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
            ),
            SizedBox(height: 8),
            Text(
              firsttitle,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
                color: AppColors.textDark,
              ),
            ),
            Text(
              lasttitle,
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w900,
                color: AppColors.primary,
              ),
            ),
            SizedBox(height: 20),
            Text(
              description,
              style: TextStyle(
                fontSize: 14,
                //fontWeight: FontWeight.bold,
                color: AppColors.textDark.withOpacity(0.4),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
