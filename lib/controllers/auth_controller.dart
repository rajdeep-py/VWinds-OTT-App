import 'dart:async';

import 'package:get/get.dart';
import 'package:audio_ott_app/models/user.dart';
import 'package:audio_ott_app/routes/app_routes.dart';

class AuthController extends GetxController {
  final Rxn<User> user = Rxn<User>();
  final RxBool isLoading = false.obs;
  final RxString phone = ''.obs;
  final RxString otp = ''.obs;

  String _lastSentOtp = '';

  bool get isLoggedIn => user.value != null;

  Future<void> sendOtp(String phoneNumber) async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    // Simulate sending OTP
    _lastSentOtp = (100000 + (DateTime.now().millisecondsSinceEpoch % 899999))
        .toString();
    phone.value = phoneNumber;
    isLoading.value = false;
    Get.snackbar(
      'OTP Sent',
      'OTP sent to $phoneNumber',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  Future<bool> verifyOtp(String code) async {
    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 600));
    isLoading.value = false;
    if (code == _lastSentOtp || code == '000000') {
      // Simulate user creation on successful OTP
      user.value = User(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        phone: phone.value,
      );
      Get.offAllNamed(AppRoutes.login);
      return true;
    } else {
      Get.snackbar(
        'Invalid OTP',
        'Please enter a valid code',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
  }

  Future<void> register({
    required String fullName,
    required String email,
    required String location,
    required List<String> preferences,
  }) async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    user.value = User(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      fullName: fullName,
      email: email,
      location: location,
      preferences: preferences,
      phone: phone.value,
    );
    isLoading.value = false;
    Get.snackbar(
      'Welcome',
      'Account created — hello $fullName',
      snackPosition: SnackPosition.BOTTOM,
    );
    Get.offAllNamed(AppRoutes.login);
  }

  void logout() {
    user.value = null;
    Get.offAllNamed(AppRoutes.login);
  }
}
