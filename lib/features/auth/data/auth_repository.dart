import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../shared/models/user_model.dart';
import '../../../core/constants/app_constants.dart';

/// Auth state: unauthenticated, loading, authenticated
enum AuthStatus { unauthenticated, loading, authenticated, error }

class AuthState {
  final AuthStatus status;
  final UserModel? user;
  final String? errorMessage;

  const AuthState({
    this.status = AuthStatus.unauthenticated,
    this.user,
    this.errorMessage,
  });

  AuthState copyWith({
    AuthStatus? status,
    UserModel? user,
    String? errorMessage,
  }) => AuthState(
    status: status ?? this.status,
    user: user ?? this.user,
    errorMessage: errorMessage,
  );

  bool get isAuthenticated => status == AuthStatus.authenticated;
}

/// Repository + state notifier for authentication.
/// Currently uses mock login; swap in real API when backend is ready.
class AuthRepository extends StateNotifier<AuthState> {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  AuthRepository() : super(const AuthState());

  /// Attempt login with email and password.
  /// Returns true on success, false on failure.
  Future<bool> login(String email, String password) async {
    state = state.copyWith(status: AuthStatus.loading, errorMessage: null);

    try {
      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 800));

      // Mock validation — accept any non-empty credentials for now
      if (email.isEmpty || password.isEmpty) {
        state = state.copyWith(
          status: AuthStatus.error,
          errorMessage: 'Email and password are required.',
        );
        return false;
      }

      if (password.length < 6) {
        state = state.copyWith(
          status: AuthStatus.error,
          errorMessage: 'Password must be at least 6 characters.',
        );
        return false;
      }

      // Mock user
      final user = UserModel(
        id: 'user_001',
        cnicHash: 'mock_hash',
        phone: '+92 300 1234567',
        email: email,
        displayName: email.split('@').first,
        verified: true,
        createdAt: DateTime.now(),
      );

      // Store mock token
      await _secureStorage.write(
        key: AppConstants.tokenKey,
        value: 'mock_jwt_token_${DateTime.now().millisecondsSinceEpoch}',
      );

      state = state.copyWith(
        status: AuthStatus.authenticated,
        user: user,
      );
      return true;
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.error,
        errorMessage: 'Login failed: $e',
      );
      return false;
    }
  }

  /// Sign up a new user (mock).
  Future<bool> signUp(String email, String password, String displayName) async {
    state = state.copyWith(status: AuthStatus.loading, errorMessage: null);

    try {
      await Future.delayed(const Duration(milliseconds: 800));

      if (email.isEmpty || password.isEmpty || displayName.isEmpty) {
        state = state.copyWith(
          status: AuthStatus.error,
          errorMessage: 'All fields are required.',
        );
        return false;
      }

      final user = UserModel(
        id: 'user_${DateTime.now().millisecondsSinceEpoch}',
        cnicHash: 'mock_hash',
        phone: '+92 300 0000000',
        email: email,
        displayName: displayName,
        verified: false,
        createdAt: DateTime.now(),
      );

      await _secureStorage.write(
        key: AppConstants.tokenKey,
        value: 'mock_jwt_token_${DateTime.now().millisecondsSinceEpoch}',
      );

      state = state.copyWith(
        status: AuthStatus.authenticated,
        user: user,
      );
      return true;
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.error,
        errorMessage: 'Sign up failed: $e',
      );
      return false;
    }
  }

  /// Send password reset email (mock).
  Future<bool> forgotPassword(String email) async {
    state = state.copyWith(status: AuthStatus.loading, errorMessage: null);
    await Future.delayed(const Duration(milliseconds: 800));

    if (email.isEmpty) {
      state = state.copyWith(
        status: AuthStatus.error,
        errorMessage: 'Email is required.',
      );
      return false;
    }

    state = state.copyWith(status: AuthStatus.unauthenticated);
    return true;
  }

  /// Check for existing session on app start.
  Future<void> checkSession() async {
    final token = await _secureStorage.read(key: AppConstants.tokenKey);
    if (token != null && token.isNotEmpty) {
      // In production: validate token with backend
      state = state.copyWith(
        status: AuthStatus.authenticated,
        user: UserModel(
          id: 'user_001',
          cnicHash: 'mock_hash',
          phone: '+92 300 1234567',
          email: 'user@sport0zero.com',
          displayName: 'Player',
          verified: true,
          createdAt: DateTime.now(),
        ),
      );
    }
  }

  /// Log out and clear stored credentials.
  Future<void> logout() async {
    await _secureStorage.delete(key: AppConstants.tokenKey);
    state = const AuthState();
  }

  /// Clear error state.
  void clearError() {
    if (state.status == AuthStatus.error) {
      state = state.copyWith(status: AuthStatus.unauthenticated);
    }
  }
}
