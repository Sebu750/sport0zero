import '../../shared/models/user_model.dart';

class AppConstants {
  AppConstants._();

  // App
  static const String appName = 'Sport0Zero';
  static const String appVersion = '1.0.0';

  // API (replace with actual base URL)
  static const String apiBaseUrl = 'https://api.sport0zero.com/v1';

  // Sports API (placeholder - use API-Sports or SportRadar)
  static const String sportsApiBaseUrl = 'https://v3.football.api-sports.io';
  static const String sportsApiKey = ''; // Add your API key

  // Hive boxes
  static const String userBox = 'user_box';
  static const String settingsBox = 'settings_box';
  static const String cacheBox = 'cache_box';

  // Storage keys
  static const String tokenKey = 'auth_token';
  static const String userKey = 'current_user';
  static const String themeKey = 'theme_mode';

  // Demo accounts for role-based login (Firebase + demo password)
  static const Map<UserRole, ({String email, String password, String label})> demoAccounts = {
    UserRole.player:    (email: 'player@demo.com',    password: 'demo1234', label: 'Demo Player'),
    UserRole.manager:   (email: 'manager@demo.com',   password: 'demo1234', label: 'Demo Manager'),
    UserRole.organizer: (email: 'organizer@demo.com', password: 'demo1234', label: 'Demo Organizer'),
    UserRole.admin:     (email: 'admin@demo.com',     password: 'demo1234', label: 'Demo Admin'),
  };
}
