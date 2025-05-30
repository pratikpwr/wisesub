import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection_container.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../subscriptions/presentation/pages/home_page.dart';
import '../../../subscriptions/presentation/pages/onboarding_page.dart';
import '../bloc/app_initialization_bloc.dart';
import '../bloc/app_initialization_event.dart';
import '../bloc/app_initialization_state.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<AppInitializationBloc>()
            ..add(const CheckOnboardingStatusEvent()),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: BlocListener<AppInitializationBloc, AppInitializationState>(
          listener: (context, state) {
            if (state is OnboardingRequired) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const OnboardingPage()),
              );
            } else if (state is OnboardingCompleted) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            }
          },
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                ),
                SizedBox(height: 24),
                Text(
                  'Loading...',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
