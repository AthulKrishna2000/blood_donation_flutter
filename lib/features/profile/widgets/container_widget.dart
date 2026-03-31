import 'package:blood_donation_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  const ContainerWidget({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 0.2),
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor ?? AppColors.containerBackground,
      ),
      child: Padding(padding: const EdgeInsets.all(16.0), child: child),
    );
  }
}
