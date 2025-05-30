import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../../core/di/injection_container.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../settings/presentation/bloc/app_initialization_bloc.dart';
import '../../../settings/presentation/bloc/app_initialization_event.dart';
import '../../../settings/presentation/bloc/app_initialization_state.dart';
import 'home_page.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AppInitializationBloc>(),
      child: BlocListener<AppInitializationBloc, AppInitializationState>(
        listener: (context, state) {
          if (state is OnboardingCompleted) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          }
        },
        child: Scaffold(
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
                          _buildServiceLogo(
                            AppColors.primary,
                            Icons.music_note,
                          ),
                          const SizedBox(width: 8),
                          _buildServiceLogo(
                            AppColors.primary,
                            Icons.play_arrow,
                          ),
                          const SizedBox(width: 8),
                          _buildServiceLogo(AppColors.primary, Icons.gamepad),
                        ],
                      ),
                    ),
                  ),

                  const Spacer(flex: 3),

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
                          style: AppTextTheme.getTextStyle(
                            fontSize: 36,
                            fontWeight: AppTextTheme.bold,
                            color: AppColors.textPrimary,
                            height: 1.2,
                            letterSpacing: -0.5,
                          ),
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
                          style: AppTextTheme.getTextStyle(
                            fontSize: 18,
                            fontWeight: AppTextTheme.regular,
                            color: AppColors.textSecondary,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const Spacer(flex: 1),

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
                          child:
                              BlocBuilder<
                                AppInitializationBloc,
                                AppInitializationState
                              >(
                                builder: (context, state) {
                                  final isLoading =
                                      state is AppInitializationLoading;

                                  return ElevatedButton(
                                    onPressed: isLoading
                                        ? null
                                        : () {
                                            context
                                                .read<AppInitializationBloc>()
                                                .add(
                                                  const MarkOnboardingCompletedEvent(),
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
                                    child: isLoading
                                        ? const SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                    AppColors.textPrimary,
                                                  ),
                                            ),
                                          )
                                        : Text(
                                            'Get started',
                                            style: AppTextStyles.buttonPrimary,
                                          ),
                                  );
                                },
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
