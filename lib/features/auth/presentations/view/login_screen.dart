import 'package:artifitia/general/core/services/easy_navigation.dart';
import 'package:artifitia/general/core/utils/app_colors%20.dart';
import 'package:artifitia/general/core/utils/app_icons.dart';
import 'package:artifitia/general/core/widget/ctextform.dart';
import 'package:artifitia/features/app_root/presentation/view/app_root.dart';
import 'package:artifitia/features/auth/presentations/view/forgot_screen.dart';
import 'package:artifitia/features/auth/presentations/view/signUp_screen.dart';
import 'package:artifitia/features/auth/presentations/view/widget/circles.dart';
import 'package:artifitia/features/home/presentation/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              'Welcome\nBack!',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 36,
              ),
            ),
            const Gap(36),

            // Email
            CTextField(label: 'Username or Email', icon: Icons.person),
            const Gap(31),

            // Password
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
            const Gap(11),

            // Forgot Password
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    EasyNavigation.push(
                      context: context,
                      page: const ForgotScreen(),
                    );
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const Gap(51),

            // Login Button
            InkWell(
              onTap: () {
                EasyNavigation.push(context: context, page: AppRoot());
              },
              child: Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),

            const Gap(75),

            // Divider
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

            // Social Login
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

            // Sign Up
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Create An Account ',
                  style: TextStyle(
                    color: AppColors.blackShade,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
                InkWell(
                  onTap: () {
                    EasyNavigation.push(
                      context: context,
                      page: const SignUpScreen(),
                    );
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primary,
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
}
