import 'package:artifitia/core/services/easy_navigation.dart';
import 'package:artifitia/core/utils/app_colors%20.dart';
import 'package:artifitia/core/utils/app_icons.dart';
import 'package:artifitia/core/widget/ctextform.dart';
import 'package:artifitia/features/auth/presentations/view/login_screen.dart';
import 'package:artifitia/features/auth/presentations/view/widget/circles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          bottom: 26,
          left: 26,
          right: 26,
          top: 46,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Create an\naccount',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 36,
              ),
            ),
            const Gap(36),

            // Username/Email Field
            CTextField(label: 'Username or Email', icon: Icons.person),
            const Gap(31),

            // Password Field
            CTextField(
              label: 'Password',
              icon: Icons.lock,
              obscureText: _obscureText,
              suffix: IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
            ),
            const Gap(31),

            // Confirm Password Field
            CTextField(
              label: 'Confirm Password',
              icon: Icons.lock,
              obscureText: _obscureText,
              suffix: IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
            ),
            const Gap(11),

            // Register Text
            Text.rich(
              TextSpan(
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                children: [
                  const TextSpan(
                    text: 'By clicking the ',
                    style: TextStyle(color: Colors.black54),
                  ),
                  TextSpan(
                    text: 'Register ',
                    style: TextStyle(color: AppColors.primary),
                  ),
                  const TextSpan(
                    text: 'button, you agree to the public offer.',
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),

            const Gap(51),

            // Create Account Button
            Container(
              height: 55,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Center(
                child: Text(
                  'Create Account',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            const Gap(25),

            // Divider Text
            Center(
              child: Text(
                '- OR Continue with -',
                style: TextStyle(
                  color: AppColors.blackShade,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
            ),
            const Gap(20),

            // Social Buttons
            Center(
              child: SizedBox(
                width: 185,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BorderCircle(imagePath: AppIcons.googleIcon),
                    BorderCircle(imagePath: AppIcons.appleIcon),
                    BorderCircle(imagePath: AppIcons.facebookIcons),
                  ],
                ),
              ),
            ),
            const Gap(25),

            // Already have an account + Login
            Center(
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(
                      text: 'I Already Have an Account ',
                      style: TextStyle(color: AppColors.blackShade),
                    ),
                    WidgetSpan(
                      child: GestureDetector(
                        onTap: () {
                          EasyNavigation.push(
                            context: context,
                            page: const LoginScreen(),
                          );
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: AppColors.primary,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
