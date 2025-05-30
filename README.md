# WiseSub - Smart Subscription Manager 💰

A modern Flutter application for managing and tracking your subscriptions with intelligent insights and cost optimization features.

## 📱 Features

### Core Features
- **📊 Subscription Tracking**: Track all your active subscriptions in one place
- **💰 Cost Analysis**: Monitor spending patterns and get insights into subscription costs
- **🔔 Smart Notifications**: Get reminded before renewals and payment dates
- **📈 Analytics Dashboard**: Visualize your subscription spending with charts and graphs
- **🎯 Budget Management**: Set spending limits and track against budgets
- **🔄 Renewal Management**: Track renewal dates and manage cancellations

### Advanced Features
- **🤖 Smart Categorization**: Automatically categorize subscriptions by type
- **💡 Cost Optimization**: Get suggestions to reduce subscription costs
- **📱 Multi-Platform Support**: Works seamlessly across Android and iOS
- **🌙 Dark Mode**: Beautiful UI with light and dark theme support
- **🔐 Secure Storage**: Your data is stored securely with encryption
- **📤 Export Data**: Export your subscription data in various formats

## 🏗️ Architecture

This project follows **Clean Architecture** principles with **Feature-First Organization**:

```
lib/
├── core/                          # Shared/common code
│   ├── di/                        # Dependency injection setup
│   ├── error/                     # Error handling and failures
│   ├── theme/                     # App theming and styling
│   ├── usecase/                   # Base use case classes
│   ├── utils/                     # Utility functions and extensions
│   └── widgets/                   # Reusable UI components
├── features/                      # Feature modules
│   ├── general/                   # General app functionality
│   ├── settings/                  # App settings and preferences
│   └── subscriptions/             # Subscription management
└── main.dart                      # Application entry point
```

### State Management
- **flutter_bloc**: For predictable state management
- **Freezed**: For immutable data classes and union types
- **Dartz**: For functional error handling with Either types

### Key Patterns
- **Repository Pattern**: Single source of truth for data
- **Use Case Pattern**: Encapsulates business logic
- **Dependency Injection**: Using GetIt service locator
- **Clean Architecture**: Separation of concerns across layers

## 🚀 Getting Started

### Prerequisites

- **Flutter SDK**: Version 3.0.0 or higher
- **Dart SDK**: Version 2.17.0 or higher
- **Android Studio** or **VS Code** with Flutter extensions
- **Git** for version control

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/wisesub.git
   cd wisesub
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code (if needed)**
   ```bash
   flutter packages pub run build_runner build
   ```

4. **Run the app**
   ```bash
   # For development
   flutter run
   
   # For specific device
   flutter run -d <device_id>
   
   # For release build
   flutter run --release
   ```

### Building for Production

#### Android
```bash
# Generate APK
flutter build apk --release

# Generate App Bundle (recommended for Play Store)
flutter build appbundle --release
```

#### iOS
```bash
# Build for iOS
flutter build ios --release
```

## 🧪 Testing

This project includes comprehensive testing:

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# Run integration tests
flutter drive --target=test_driver/app.dart
```

### Test Structure
- **Unit Tests**: Domain logic, repositories, and blocs
- **Widget Tests**: UI components and interactions
- **Integration Tests**: End-to-end feature testing

## 📦 Dependencies

### Core Dependencies
- `flutter_bloc` - State management
- `freezed` - Code generation for data classes
- `dartz` - Functional programming utilities
- `get_it` - Service locator for dependency injection
- `injectable` - Code generation for dependency injection

### UI & Theming
- `flutter_screenutil` - Screen adaptation
- `google_fonts` - Typography
- `flutter_svg` - SVG asset support

### Data & Storage
- `shared_preferences` - Local preferences storage
- `hive` - Local database
- `dio` - HTTP client for API calls

### Development
- `build_runner` - Code generation
- `flutter_lints` - Linting rules
- `mocktail` - Mocking for tests

## 🎨 Design System

The app follows Material Design 3 principles with:
- **Consistent Color Palette**: Primary, secondary, and semantic colors
- **Typography Scale**: Using Google Fonts with proper hierarchy
- **Component Library**: Reusable UI components
- **Responsive Design**: Adapts to different screen sizes
- **Accessibility**: Supports screen readers and accessibility features

## 🔧 Configuration

### Environment Setup
1. Create environment-specific configuration files
2. Set up API endpoints and keys
3. Configure analytics and crash reporting
4. Set up deep linking schemes

### App Configuration
- Modify `android/app/src/main/AndroidManifest.xml` for Android-specific settings
- Update `ios/Runner/Info.plist` for iOS-specific settings
- Configure app icons and splash screens

## 📱 Platform Support

- **Android**: API level 21+ (Android 5.0+)
- **iOS**: iOS 11.0+
- **Web**: Modern browsers with Flutter web support

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Code Style
- Follow Flutter/Dart style guidelines
- Use `flutter format` to format code
- Run `flutter analyze` to check for issues
- Ensure all tests pass before submitting PR

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🆘 Support

- **Documentation**: Check the [Wiki](../../wiki) for detailed guides
- **Issues**: Report bugs or request features in [Issues](../../issues)
- **Discussions**: Join community discussions in [Discussions](../../discussions)

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Contributors and community members
- Open source packages that make this app possible

---

**Made with ❤️ using Flutter**
