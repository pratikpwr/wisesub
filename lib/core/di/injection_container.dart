import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../features/subscriptions/data/datasources/subscription_local_data_source.dart';
import '../../features/subscriptions/data/models/category_model.dart';
import '../../features/subscriptions/data/models/subscription_model.dart';
import '../../features/subscriptions/data/repositories/subscription_repository_impl.dart';
import '../../features/subscriptions/domain/repositories/subscription_repository.dart';
import '../../features/subscriptions/domain/usecases/add_category.dart';
import '../../features/subscriptions/domain/usecases/add_subscription.dart';
import '../../features/subscriptions/domain/usecases/delete_subscription.dart';
import '../../features/subscriptions/domain/usecases/get_categories.dart';
import '../../features/subscriptions/domain/usecases/get_subscriptions.dart';
import '../../features/subscriptions/presentation/bloc/subscription_bloc.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  // Initialize Hive
  await Hive.initFlutter();

  // Register Hive adapters
  Hive.registerAdapter(SubscriptionModelAdapter());
  Hive.registerAdapter(CategoryModelAdapter());

  // Open Hive boxes
  final subscriptionBox = await Hive.openBox<SubscriptionModel>(
    subscriptionsBoxName,
  );
  final categoryBox = await Hive.openBox<CategoryModel>(categoriesBoxName);

  // Data sources
  getIt.registerLazySingleton<SubscriptionLocalDataSource>(
    () => SubscriptionLocalDataSourceImpl(
      subscriptionBox: subscriptionBox,
      categoryBox: categoryBox,
    ),
  );

  // Repository
  getIt.registerLazySingleton<SubscriptionRepository>(
    () => SubscriptionRepositoryImpl(localDataSource: getIt()),
  );

  // Use cases
  getIt.registerLazySingleton(() => GetSubscriptions(getIt()));
  getIt.registerLazySingleton(() => GetCategories(getIt()));
  getIt.registerLazySingleton(() => AddSubscription(getIt()));
  getIt.registerLazySingleton(() => AddCategory(getIt()));
  getIt.registerLazySingleton(() => DeleteSubscription(getIt()));

  // BLoC
  getIt.registerFactory(
    () => SubscriptionBloc(
      getSubscriptions: getIt(),
      getCategories: getIt(),
      addSubscription: getIt(),
      addCategory: getIt(),
      deleteSubscription: getIt(),
    ),
  );

  // Add default category if none exists
  await _addDefaultCategory();
}

Future<void> _addDefaultCategory() async {
  final categoryBox = await Hive.openBox<CategoryModel>(categoriesBoxName);

  if (categoryBox.isEmpty) {
    final defaultCategory = CategoryModel(
      id: 'default_entertainment',
      name: 'Entertainment',
      subscriptionIds: [],
      createdAt: DateTime.now(),
    );

    await categoryBox.put(defaultCategory.id, defaultCategory);
  }
}
