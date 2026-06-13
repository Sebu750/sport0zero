import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/constants/app_constants.dart';
import 'shared/providers/app_providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize SharedPreferences
  final prefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
      ],
      child: const Sport0ZeroApp(),
    ),
  );
}

class Sport0ZeroApp extends ConsumerWidget {
  const Sport0ZeroApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch to rebuild on theme change; read notifier for Flutter ThemeMode
    ref.watch(themeProvider);

    return MaterialApp.router(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ref.read(themeProvider.notifier).themeMode,
      routerConfig: appRouter,
    );
  }
}
