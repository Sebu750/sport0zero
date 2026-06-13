# Sport0Zero

A cross-platform sports management application built with Flutter. Track live matches, tournaments, standings, and player stats — all from a single codebase targeting Android, iOS, Web, Linux, macOS, and Windows.

## Tech Stack

| Layer | Package | Purpose |
|---|---|---|
| **Framework** | Flutter SDK ^3.12.2 | Cross-platform UI |
| **State Management** | flutter_riverpod + riverpod_annotation | Reactive state with async providers |
| **Routing** | go_router | Declarative navigation with ShellRoute |
| **Networking** | dio | HTTP client with interceptors |
| **Local Storage** | hive, shared_preferences, flutter_secure_storage | Offline caching and secure token storage |
| **UI** | google_fonts, cached_network_image, shimmer, flutter_svg | Typography, image loading, skeleton loaders |
| **Models** | freezed + json_serializable | Immutable models with code generation |
| **Testing** | flutter_test, mocktail | Widget and unit tests |
| **Code Gen** | build_runner, freezed, json_serializable, riverpod_generator | Auto-generated serialization and providers |

## Project Structure

```
lib/
├── core/
│   ├── constants/       # App-wide constants and API config
│   ├── network/         # Dio API client with interceptors
│   ├── router/          # go_router configuration
│   ├── theme/           # Material 3 light/dark theming
│   └── widgets/         # Responsive layout and navigation shell
├── features/
│   ├── auth/            # Login, sign up, forgot password
│   ├── home/            # Live matches, upcoming fixtures, tournaments
│   ├── matches/         # Match lists, domain models (cricket-specific)
│   ├── profile/         # User profile and settings
│   └── standings/       # League tables and standings
├── shared/
│   ├── models/          # Shared models (User, Team, Venue, Sport, Player)
│   └── providers/       # Riverpod providers (theme, auth, matches, standings)
└── main.dart
```

## Getting Started

### Prerequisites

- Flutter SDK 3.12.2 or higher — [Install Flutter](https://docs.flutter.dev/get-started/install)
- Dart SDK (bundled with Flutter)

### Setup

```bash
# Clone the repository
git clone <repo-url>
cd sport0zero

# Install dependencies
flutter pub get
```

## Running the App

### Web (Browser)

```bash
flutter run -d chrome
```

Or for a specific browser:
```bash
flutter run -d web-server   # headless, accessible via localhost URL
flutter run -d edge          # Microsoft Edge
```

### Mobile (Android)

```bash
# Check connected devices
flutter devices

# Run on connected device or emulator
flutter run -d android
```

To launch an Android emulator first:
```bash
# Via Android Studio or command line
flutter emulators --launch <emulator_id>
flutter run
```

### Mobile (iOS)

```bash
# Requires macOS + Xcode
flutter run -d ios
```

### Desktop (Linux)

```bash
flutter run -d linux
```

### Desktop (macOS)

```bash
flutter run -d macos
```

### Desktop (Windows)

```bash
flutter run -d windows
```

### Run on all available devices

```bash
flutter run -d all
```

## Building for Production

```bash
# Web
flutter build web

# Android APK
flutter build apk

# Android App Bundle
flutter build appbundle

# iOS
flutter build ios

# Linux
flutter build linux

# macOS
flutter build macos

# Windows
flutter build windows
```

## Testing

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# Run a specific test file
flutter test test/widget_test.dart
```

## Code Generation

After modifying any `@freezed` or `@JsonSerializable` model:

```bash
dart run build_runner build --delete-conflicting-outputs
```

## Environment Notes

- Mock data is served from `assets/mock/` JSON files — no backend required to run
- API base URL is configured in `lib/core/constants/app_constants.dart`
- Auth guard in the router is currently disabled (commented out) — all screens are accessible without login
- `flutter_secure_storage` stores auth tokens securely on device

