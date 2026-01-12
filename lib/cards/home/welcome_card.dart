import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:audio_ott_app/theme/app_theme.dart';
import 'package:audio_ott_app/controllers/home_controller.dart';

class WelcomeCard extends StatelessWidget {
  final VoidCallback? onGetStarted;
  const WelcomeCard({super.key, this.onGetStarted});

  @override
  Widget build(BuildContext context) {
    final HomeController home = Get.find();

    return Container(
      padding: EdgeInsets.all(AppSpacing.screenPadding),
      decoration: AppDecorations.cardDecoration(radius: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Start listening today',
                      style: AppTextStyles.heading2,
                    ),
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
          const SizedBox(height: 14),
          SizedBox(
            height: 120,
            child: Obx(() {
              final tiles = home.tiles;
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tiles.length,
                itemBuilder: (context, index) {
                  final item = tiles[index];
                  final tilt = index.isEven ? -0.04 : 0.04;
                  return Container(
                    width: 120,
                    margin: EdgeInsets.only(right: 12),
                    child: Transform.rotate(
                      angle: tilt,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child:
                            (item['image'] != null &&
                                (item['image'] ?? '').isNotEmpty)
                            ? Image.asset(
                                item['image']!,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              )
                            : Image.network(
                                'https://picsum.photos/300/300?random=$index',
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
