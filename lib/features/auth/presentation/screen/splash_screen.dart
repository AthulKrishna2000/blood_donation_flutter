import 'dart:async';

import 'package:blood_donation_app/core/theme/app_colors.dart';
import 'package:blood_donation_app/features/auth/presentation/screen/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _loadAndNavigate();
  }

  Future<void> _loadAndNavigate() async {
    // ✅ Preload background image
    await precacheImage(const AssetImage('assets/log.png'), context);

    // Optional delay (for splash feel)
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    // Navigate after image is ready
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Text(
          "Donate Blood ❤️",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
