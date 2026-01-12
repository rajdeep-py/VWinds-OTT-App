import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:audio_ott_app/theme/app_theme.dart';
import 'package:audio_ott_app/controllers/auth_controller.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final PageController _page = PageController();
  final AuthController auth = Get.find();

  final _name = TextEditingController();
  final _location = TextEditingController();
  final _email = TextEditingController();
  final List<String> _prefs = [];

  int _index = 0;

  void _next() {
    if (_index < 2) {
      _page.nextPage(
        duration: const Duration(milliseconds: 320),
        curve: Curves.ease,
      );
    } else {
      auth.register(
        fullName: _name.text.trim(),
        email: _email.text.trim(),
        location: _location.text.trim(),
        preferences: _prefs,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.textPrimary),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.screenPadding),
          child: Column(
            children: [
              LinearProgressIndicator(
                value: (_index + 1) / 3,
                color: AppColors.primary,
                backgroundColor: AppColors.card,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: PageView(
                  controller: _page,
                  onPageChanged: (i) => setState(() => _index = i),
                  children: [_stepOne(), _stepTwo(), _stepThree()],
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  Widget _stepOne() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Tell us about you', style: AppTextStyles.heading2),
        const SizedBox(height: 12),
        TextField(
          controller: _name,
          decoration: InputDecoration(
            hintText: 'Full name',
            filled: true,
            fillColor: AppColors.card,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: AppColors.card,
                  foregroundColor: AppColors.textPrimary,
                ),
                onPressed: () => Get.back(),
                child: Text('Cancel', style: AppTextStyles.body),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(52),
                  backgroundColor: AppColors.primary,
                ),
                onPressed: _next,
                child: Text(
                  'Next',
                  style: AppTextStyles.heading3.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _stepTwo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Location & Contact', style: AppTextStyles.heading2),
        const SizedBox(height: 12),
        TextField(
          controller: _location,
          decoration: InputDecoration(
            hintText: 'Location',
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
          controller: _email,
          decoration: InputDecoration(
            hintText: 'Email',
            filled: true,
            fillColor: AppColors.card,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: AppColors.card,
                  foregroundColor: AppColors.textPrimary,
                ),
                onPressed: () => _page.previousPage(
                  duration: const Duration(milliseconds: 320),
                  curve: Curves.ease,
                ),
                child: Text('Back', style: AppTextStyles.body),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(52),
                  backgroundColor: AppColors.primary,
                ),
                onPressed: _next,
                child: Text(
                  'Next',
                  style: AppTextStyles.heading3.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _stepThree() {
    final genres = ['Pop', 'Indie', 'EDM', 'Classical', 'HipHop', 'Jazz'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Preferences', style: AppTextStyles.heading2),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: genres.map((g) {
            final selected = _prefs.contains(g);
            return ChoiceChip(
              label: Text(
                g,
                style: selected
                    ? AppTextStyles.body.copyWith(color: AppColors.textPrimary)
                    : AppTextStyles.body.copyWith(
                        color: AppColors.textSecondary,
                      ),
              ),
              selected: selected,
              onSelected: (v) => setState(() {
                if (v) {
                  _prefs.add(g);
                } else {
                  _prefs.remove(g);
                }
              }),
              selectedColor: AppColors.primary,
              backgroundColor: AppColors.card,
            );
          }).toList(),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: AppColors.card,
                  foregroundColor: AppColors.textPrimary,
                ),
                onPressed: () => _page.previousPage(
                  duration: const Duration(milliseconds: 320),
                  curve: Curves.ease,
                ),
                child: Text('Back', style: AppTextStyles.body),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(52),
                  backgroundColor: AppColors.primary,
                ),
                onPressed: _next,
                child: Text(
                  'Create Account',
                  style: AppTextStyles.heading3.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
