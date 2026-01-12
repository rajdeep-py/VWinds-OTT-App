import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:audio_ott_app/theme/app_theme.dart';
import 'package:audio_ott_app/controllers/home_controller.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
    return Obx(() {
      return BottomNavigationBar(
        backgroundColor: AppColors.card,
        currentIndex: controller.selectedIndex.value,
        onTap: (i) => controller.setIndex(i),
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.inactiveIcon,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: 'Library',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Discover'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
        type: BottomNavigationBarType.fixed,
      );
    });
  }
}
