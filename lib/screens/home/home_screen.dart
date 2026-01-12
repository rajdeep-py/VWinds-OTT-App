import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:audio_ott_app/theme/app_theme.dart';
import 'package:audio_ott_app/cards/home/welcome_card.dart';
import 'package:audio_ott_app/widgets/bottom_nav_bar.dart';
import 'package:audio_ott_app/controllers/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController home = Get.find();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                gradient: AppGradients.primaryGradient,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.audiotrack,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'VWINDS',
              style: AppTextStyles.heading3.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.screenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              WelcomeCard(onGetStarted: () {}),
              const SizedBox(height: 18),
              Text('Recommended for you', style: AppTextStyles.heading3),
              const SizedBox(height: 12),
              SizedBox(
                height: 160,
                child: Obx(() {
                  final tiles = home.tiles;
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: tiles.length,
                    itemBuilder: (context, index) {
                      final item = tiles[index];
                      final tilt = index.isEven ? -0.06 : 0.06;
                      return Container(
                        width: 140,
                        margin: EdgeInsets.only(right: 12),
                        child: Transform.rotate(
                          angle: tilt,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              gradient: AppGradients.primaryGradient,
                            ),
                            padding: const EdgeInsets.all(6),
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
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
