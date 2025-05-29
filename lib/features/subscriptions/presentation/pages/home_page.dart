import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection_container.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../general/presentation/bloc/general_bloc.dart';
import '../../../general/presentation/bloc/general_event.dart';
import '../../../general/presentation/pages/general_tab.dart';
import '../bloc/subscription_bloc.dart';
import '../bloc/subscription_event.dart';
import 'subscription_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<SubscriptionBloc>()
                ..add(const SubscriptionEvent.loadSubscriptions()),
        ),
        BlocProvider(
          create: (context) =>
              getIt<GeneralBloc>()..add(const GeneralEvent.loadGeneral()),
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Column(
            children: [
              _buildHeader(),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [GeneralTab(), SubscriptionPageContent()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging ||
          _currentIndex != _tabController.index) {
        setState(() {
          _currentIndex = _tabController.index;
        });
      }
    });
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ).copyWith(bottom: 36, top: 12),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.backgroundTertiary,
              borderRadius: BorderRadius.circular(50),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu_rounded,
                color: AppColors.textPrimary,
                size: 28,
              ),
            ),
          ),
          const Spacer(),
          _buildTabBar(),
          const Spacer(),
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.backgroundTertiary,
              borderRadius: BorderRadius.circular(50),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_none_rounded,
                color: AppColors.textPrimary,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.backgroundTertiary,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          _buildTabButton('General', 0, Icons.dashboard_rounded),
          _buildTabButton('My Subs', 1, Icons.subscriptions_outlined),
        ],
      ),
    );
  }

  Widget _buildTabButton(String title, int index, IconData icon) {
    final isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () {
        _tabController.animateTo(index);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.iconPrimary, size: 24),
            if (isSelected) ...[
              const SizedBox(width: 6),
              Text(
                title,
                style: isSelected
                    ? AppTextStyles.tabSelected
                    : AppTextStyles.tabUnselected,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
