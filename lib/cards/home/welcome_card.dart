import 'package:flutter/material.dart';
import 'package:audio_ott_app/theme/app_theme.dart';

class WelcomeCard extends StatelessWidget {
  final VoidCallback? onGetStarted;
  const WelcomeCard({super.key, this.onGetStarted});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: AppDecorations.cardDecoration(radius: 14),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Start listening today', style: AppTextStyles.heading2),
                const SizedBox(height: 8),
                Text(
                  'Unravel new podcasts, audiobooks and music — curated for you.',
                  style: AppTextStyles.description,
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: onGetStarted ?? () {},
                  child: Text(
                    'Get started',
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
