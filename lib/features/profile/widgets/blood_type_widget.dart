import 'package:blood_donation_app/core/theme/app_colors.dart';
import 'package:blood_donation_app/features/profile/widgets/container_widget.dart';
import 'package:flutter/material.dart';

class BloodTypeWidget extends StatelessWidget {
  final String bloodType;
  const BloodTypeWidget({super.key, required this.bloodType});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ContainerWidget(
                  height: MediaQuery.of(context).size.height * 0.13,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Blood Type",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textDark.withOpacity(0.7),
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            bloodType,
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          SizedBox(width: 16),
                          Flexible(
                            child: Text(
                              "Your blood type helps us match you with compatible recipients and donors, ensuring safe and effective blood transfusions.",
                              style: TextStyle(
                                fontSize: 10,
                                color: AppColors.textDark.withValues(
                                  alpha: 0.4,
                                ),
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ContainerWidget(
                  height: MediaQuery.of(context).size.height * 0.13,
                  backgroundColor: AppColors.primary,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "12",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Donations",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ContainerWidget(
                  height: MediaQuery.of(context).size.height * 0.08,
                  backgroundColor: AppColors.textDark.withValues(alpha: 0.1),
                  child: Row(
                    children: [
                      ContainerWidget(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.favorite_border,
                              size: 12,
                              color: AppColors.textDark.withValues(alpha: 0.4),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 6),
                      Text(
                        "36 \nlives saved",
                        style: TextStyle(
                          fontSize: 10,
                          color: AppColors.textDark,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ContainerWidget(
                  height: MediaQuery.of(context).size.height * 0.08,
                  backgroundColor: Colors.blue.withValues(alpha: 0.1),
                  child: Row(
                    children: [
                      Icon(Icons.calendar_today, size: 20, color: Colors.white),
                      SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          "Last donated: 2 months ago",
                          style: TextStyle(
                            fontSize: 10,
                            color: AppColors.textDark.withValues(alpha: 0.9),
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
