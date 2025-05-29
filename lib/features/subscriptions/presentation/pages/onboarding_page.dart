import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_theme.dart';
import 'home_page.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),

              // Subscription logos animation
              AnimationLimiter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(milliseconds: 375),
                    childAnimationBuilder: (widget) => SlideAnimation(
                      horizontalOffset: 50.0,
                      child: FadeInAnimation(child: widget),
                    ),
                    children: [
                      _buildServiceLogo(AppColors.primary, Icons.palette),
                      const SizedBox(width: 8),
                      _buildServiceLogo(AppColors.warning, Icons.stars),
                      const SizedBox(width: 8),
                      _buildServiceLogo(AppColors.primary, Icons.music_note),
                      const SizedBox(width: 8),
                      _buildServiceLogo(AppColors.primary, Icons.play_arrow),
                      const SizedBox(width: 8),
                      _buildServiceLogo(AppColors.primary, Icons.gamepad),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 60),

              // Main title
              AnimationConfiguration.staggeredList(
                position: 1,
                duration: const Duration(milliseconds: 500),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: Text(
                      'Manage all your\nsubscriptions',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.heroTitle,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Subtitle
              AnimationConfiguration.staggeredList(
                position: 2,
                duration: const Duration(milliseconds: 500),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: Text(
                      'Keep regular expenses on hand\nand receive timely notifications of\nupcoming fees',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.heroSubtitle,
                    ),
                  ),
                ),
              ),

              const Spacer(flex: 3),

              // Get started button
              AnimationConfiguration.staggeredList(
                position: 3,
                duration: const Duration(milliseconds: 500),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: AppColors.textPrimary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'Get started',
                          style: AppTextStyles.buttonPrimary,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServiceLogo(Color color, IconData icon) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.textPrimary,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Icon(icon, color: color, size: 28),
    );
  }
}
