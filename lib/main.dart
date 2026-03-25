import 'package:blood_donation_app/core/theme/app_theme.dart';
import 'package:blood_donation_app/features/auth/presentation/screen/splash_screen.dart';
import 'package:blood_donation_app/routing/routing.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // ✅ ADD THIS
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.white.withOpacity(0.5), // makes it transparent
      statusBarIconBrightness: Brightness.dark, // white icons
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood Donation App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
      onGenerateRoute: AppRouter().onGenerateRoute,
    );
  }
}
