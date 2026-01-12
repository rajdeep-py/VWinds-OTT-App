import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:audio_ott_app/theme/app_theme.dart';
import 'package:audio_ott_app/controllers/auth_controller.dart';
import 'package:audio_ott_app/routes/app_routes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController auth = Get.find();
    final phoneCtrl = TextEditingController();
    final otpCtrl = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.screenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 28),
              Text('Welcome back', style: AppTextStyles.heading1),
              const SizedBox(height: 6),
              Text(
                'Enter your phone number to continue',
                style: AppTextStyles.description,
              ),
              const SizedBox(height: 24),
              TextField(
                controller: phoneCtrl,
                keyboardType: TextInputType.phone,
                style: AppTextStyles.body,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 12, right: 8),
                    child: FaIcon(
                      FontAwesomeIcons.phone,
                      color: AppColors.textSecondary,
                      size: 18,
                    ),
                  ),
                  prefixIconConstraints: const BoxConstraints(minWidth: 48),
                  hintText: 'Phone number',
                  filled: true,
                  fillColor: AppColors.card,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: otpCtrl,
                keyboardType: TextInputType.number,
                style: AppTextStyles.body,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 12, right: 8),
                    child: FaIcon(
                      FontAwesomeIcons.key,
                      color: AppColors.textSecondary,
                      size: 18,
                    ),
                  ),
                  prefixIconConstraints: const BoxConstraints(minWidth: 48),
                  hintText: 'OTP',
                  filled: true,
                  fillColor: AppColors.card,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 2),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot password?',
                    style: AppTextStyles.description,
                  ),
                ),
              ),
              const SizedBox(height: 2),
              Obx(() {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(52),
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: auth.isLoading.value
                      ? null
                      : () async {
                          final phone = phoneCtrl.text.trim();
                          final otp = otpCtrl.text.trim();
                          if (otp.isEmpty) {
                            await auth.sendOtp(phone);
                          } else {
                            await auth.verifyOtp(otp);
                          }
                        },
                  child: auth.isLoading.value
                      ? const SizedBox(
                          height: 18,
                          width: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Text(
                          'Continue',
                          style: AppTextStyles.heading3.copyWith(
                            color: AppColors.textPrimary,
                          ),
                        ),
                );
              }),

              const SizedBox(height: 16),
              const Divider(color: Colors.white12, thickness: 1),
              const SizedBox(height: 12),
              Center(
                child: GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.signup),
                  child: RichText(
                    text: TextSpan(
                      text: "Didn't have an account? ",
                      style: AppTextStyles.description,
                      children: [
                        TextSpan(
                          text: 'Sign up now',
                          style: AppTextStyles.body.copyWith(
                            color: AppColors.gold,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
