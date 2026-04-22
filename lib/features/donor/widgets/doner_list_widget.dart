import 'package:blood_donation_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class DonerListWidget extends StatelessWidget {
  final String bloodGroup;
  final String location;
  final String phone;
  final String firstName;
  final String lastName;
  const DonerListWidget({
    super.key,
    required this.bloodGroup,
    required this.location,
    required this.phone,
    required this.firstName,
    required this.lastName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
        ),
        width: double.infinity,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    firstName + " " + lastName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 80,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 4.0,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: Text(
                      bloodGroup,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.containerBackground,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    location,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark.withOpacity(0.6),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => _makePhoneCall(context, phone),
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Contact:",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textDark.withOpacity(0.7),
                          ),
                        ),
                        const SizedBox(width: 6),

                        // 👇 Use GestureDetector instead of IconButton (better alignment)
                        GestureDetector(
                          onTap: () => _makePhoneCall(context, phone),
                          child: Icon(
                            Icons.phone,
                            color: AppColors.primary,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _makePhoneCall(BuildContext context, String phone) async {
    final Uri url = Uri(scheme: 'tel', path: phone);

    try {
      final bool launched = await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
      if (!launched) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Could not open dialer')));
      }
    } on PlatformException catch (_) {
      try {
        final bool launched = await launchUrl(
          url,
          mode: LaunchMode.externalApplication,
        );
        if (!launched) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Could not open dialer')),
          );
        }
      } catch (_) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Could not open dialer')));
      }
    } catch (_) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Could not open dialer')));
    }
  }
}
