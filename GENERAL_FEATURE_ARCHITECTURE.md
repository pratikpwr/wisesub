# General Feature - Clean Architecture Implementation

This document describes the implementation of the General feature using Clean Architecture principles with feature-first organization and flutter_bloc for state management.

## Overview

The General feature provides:
- **Monthly spending calculation** for a specific month and year
- **Upcoming subscription renewal** detection based on billing dates
- **Payment history** showing subscriptions in latest spend order

## Architecture Structure

```
lib/features/general/
├── data/
│   └── repositories/
│       └── general_repository_impl.dart    # Repository implementation
├── domain/
│   ├── entities/
│   │   ├── monthly_spending.dart           # Monthly spending entity
│   │   └── payment_history.dart           # Payment history entity
│   ├── repositories/
│   │   └── general_repository.dart         # Repository interface
│   └── usecases/
│       ├── get_monthly_spending.dart       # Monthly spending use case
│       ├── get_payment_history.dart        # Payment history use case
│       └── get_upcoming_subscription_renewal.dart # Upcoming renewal use case
└── presentation/
    ├── bloc/
    │   ├── general_bloc.dart              # Bloc implementation
    │   ├── general_event.dart             # Events with Freezed
    │   ├── general_state.dart             # States with Freezed
    │   ├── general_event.freezed.dart     # Generated event code
    │   └── general_state.freezed.dart     # Generated state code
    └── pages/
        └── general_tab.dart               # UI implementation
```

## Clean Architecture Layers

### 1. Domain Layer (Business Logic)

#### Entities
- **MonthlySpending**: Represents monthly spending summary with total amount, month, year, and percentage change
- **PaymentHistory**: Represents individual payment records with subscription, amount, and date

#### Repository Interface
- **GeneralRepository**: Defines contracts for data operations
  - `getMonthlySpending(month, year)`: Returns monthly spending calculation
  - `getUpcomingSubscriptionRenewal()`: Returns next subscription to renew
  - `getPaymentHistory(limit)`: Returns payment history sorted by latest spend

#### Use Cases
Each use case implements a single business operation:

- **GetMonthlySpending**: Calculates spending for a specific month/year
- **GetUpcomingSubscriptionRenewal**: Finds the next subscription renewal
- **GetPaymentHistory**: Retrieves payment history in latest order

### 2. Data Layer (Data Management)

#### Repository Implementation
- **GeneralRepositoryImpl**: Implements `GeneralRepository` interface
  - Uses `SubscriptionRepository` as dependency
  - Contains business logic for calculations and data transformations
  - Handles error mapping and exception handling
  - Returns `Either<Failure, Data>` for functional error handling

#### Key Business Logic
- **Monthly spending calculation**: Aggregates subscription monthly prices
- **Percentage change calculation**: Compares with previous month (95% simulation)
- **Next payment date calculation**: Based on billing cycle and start date
- **Payment history generation**: Creates mock payment records for demonstration

### 3. Presentation Layer (UI & State Management)

#### Bloc Pattern with Freezed
- **GeneralState**: Immutable state using Freezed union types
  - `initial()`: Initial state
  - `loading()`: Loading state
  - `loaded()`: Success state with data
  - `error()`: Error state with failure

- **GeneralEvent**: Type-safe events using Freezed
  - `loadGeneral()`: Load all general data
  - `refreshGeneral()`: Refresh all data
  - `loadMonthlySpending(month, year)`: Load specific month data

#### UI Implementation
- **GeneralTab**: Main UI widget
  - Uses `BlocBuilder` for reactive UI updates
  - Displays spending summary, upcoming subscription, and payment history
  - Handles error states with retry functionality

## Dependency Injection

The feature is integrated into the app's DI container (`injection_container.dart`):

```dart
// General Repository
getIt.registerLazySingleton<GeneralRepository>(
  () => GeneralRepositoryImpl(getIt()),
);

// General Use cases
getIt.registerLazySingleton(() => GetMonthlySpending(getIt()));
getIt.registerLazySingleton(() => GetUpcomingSubscriptionRenewal(getIt()));
getIt.registerLazySingleton(() => GetPaymentHistory(getIt()));

// General Bloc
getIt.registerFactory(
  () => GeneralBloc(
    getMonthlySpending: getIt(),
    getUpcomingSubscriptionRenewal: getIt(),
    getPaymentHistory: getIt(),
  ),
);
```

## Integration with Main App

The General feature is integrated into the main app via `HomePage`:

```dart
MultiBlocProvider(
  providers: [
    BlocProvider(
      create: (context) => getIt<SubscriptionBloc>()
        ..add(const SubscriptionEvent.loadSubscriptions()),
    ),
    BlocProvider(
      create: (context) => getIt<GeneralBloc>()
        ..add(const GeneralEvent.loadGeneral()),
    ),
  ],
  child: // ... rest of app
)
```

## Key Features

### 1. Monthly Spending Calculation
- Aggregates all subscription monthly prices
- Calculates percentage change from previous month
- Displays formatted currency with change indicator

### 2. Upcoming Subscription Renewal
- Analyzes all subscriptions' billing cycles and start dates
- Finds the subscription with the nearest renewal date
- Supports both monthly and yearly billing cycles

### 3. Payment History
- Generates mock payment history for demonstration
- Sorts payments by most recent first
- Displays subscription details with formatted dates and amounts

## Error Handling

The implementation uses functional error handling with Dartz:

- `Either<Failure, Success>` for all operations
- Custom `Failure` classes for different error types
- Proper error propagation through all layers
- User-friendly error messages in UI

## Testing Strategy

The clean architecture enables easy testing:

- **Unit tests** for use cases with mocked repositories
- **Unit tests** for repository implementations with mocked data sources
- **Widget tests** for UI components with mocked blocs
- **Integration tests** for complete feature flows

## Future Enhancements

1. **Real payment history**: Integration with payment tracking
2. **Notification system**: Alerts for upcoming renewals
3. **Spending analytics**: Historical spending trends
4. **Budget management**: Spending limits and warnings
5. **Category-based analysis**: Spending breakdown by subscription categories

## Benefits of This Architecture

1. **Separation of Concerns**: Each layer has a single responsibility
2. **Testability**: Easy to unit test business logic in isolation
3. **Maintainability**: Clear structure makes code easy to understand and modify
4. **Scalability**: Easy to add new features or modify existing ones
5. **Reusability**: Use cases can be reused across different UI components
6. **Error Handling**: Consistent error handling across the application 