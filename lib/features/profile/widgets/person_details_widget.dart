import 'package:blood_donation_app/core/theme/app_colors.dart';
import 'package:blood_donation_app/features/profile/widgets/container_widget.dart';
//import 'package:blood_donation_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class PersonDetailsWidget extends StatelessWidget {
  final String email;
  final String phone;
  final String city;

  const PersonDetailsWidget({
    super.key,
    required this.email,
    required this.phone,
    required this.city,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ContainerWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PersonDetailsline(
              text: email,
              icon: Icons.email,
              hintText: "Email Address",
            ),
            PersonDetailsline(
              text: phone,
              icon: Icons.phone,
              hintText: "Phone Number",
            ),
            PersonDetailsline(
              text: city,
              icon: Icons.location_city,
              hintText: "City",
            ),
          ],
        ),
      ),
    );
  }
}

class PersonDetailsline extends StatelessWidget {
  final String text;
  final IconData icon;
  final String hintText;
  const PersonDetailsline({
    super.key,
    required this.text,
    required this.icon,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ContainerWidget(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                  child: Icon(icon, color: AppColors.secondary),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hintText,
                      style: TextStyle(
                        color: AppColors.textDark.withValues(alpha: 0.4),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    Text(
                      text,
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    
                  ],
                ),

              ],
            ),
          ),
        ),
      ],
    );
  }
}
