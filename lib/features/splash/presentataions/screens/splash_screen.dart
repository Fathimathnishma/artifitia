import 'package:artifitia/features/on_boarding/presentation/view/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:artifitia/core/utils/app_icons.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();

    // Start fade-in effect
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _opacity = 1.0;
      });
    });

    // Navigate to onboarding after delay
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const OnBoardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedOpacity(
        duration: const Duration(seconds: 2),
        opacity: _opacity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),

            // Logo
            Center(child: Image.asset(AppIcons.appLogo, height: 66)),

            const Spacer(),

            // Decorative bottom tab
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Container(
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
