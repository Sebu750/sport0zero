import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../shared/models/user_model.dart';

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
  }) =>
      AuthState(
        status: status ?? this.status,
        user: user ?? this.user,
        errorMessage: errorMessage,
      );

  bool get isAuthenticated => status == AuthStatus.authenticated;
}

/// Repository + state notifier for authentication.
/// Uses Firebase Auth for real authentication.
class AuthRepository extends StateNotifier<AuthState> {
  final FirebaseAuth? _auth;
  final FirebaseFirestore? _firestore;

  AuthRepository() 
    : _auth = _tryAuth(),
      _firestore = _tryFirestore(),
      super(const AuthState());

  static FirebaseAuth? _tryAuth() {
    try { return FirebaseAuth.instance; } catch (_) { return null; }
  }

  static FirebaseFirestore? _tryFirestore() {
    try { return FirebaseFirestore.instance; } catch (_) { return null; }
  }

  bool get _firebaseAvailable => _auth != null;

  /// Convert Firebase User + Firestore profile to UserModel
  Future<UserModel> _buildUserModel(User firebaseUser) async {
    // Try to fetch profile from Firestore
    final doc = await _firestore!.collection('profiles').doc(firebaseUser.uid).get();

    if (doc.exists) {
      final data = doc.data()!;
      return UserModel(
        id: firebaseUser.uid,
        cnicHash: data['cnicHash'] as String? ?? '',
        phone: data['phone'] as String? ?? firebaseUser.phoneNumber ?? '',
        email: firebaseUser.email,
        displayName: data['displayName'] as String? ?? firebaseUser.displayName,
        photoUrl: data['photoUrl'] as String? ?? firebaseUser.photoURL,
        verified: data['verified'] as bool? ?? firebaseUser.emailVerified,
        roles: _parseRoles(data['roles']),
        createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? firebaseUser.metadata.creationTime ?? DateTime.now(),
      );
    }

    // Fallback: use Firebase Auth data only
    return UserModel(
      id: firebaseUser.uid,
      cnicHash: '',
      phone: firebaseUser.phoneNumber ?? '',
      email: firebaseUser.email,
      displayName: firebaseUser.displayName,
      photoUrl: firebaseUser.photoURL,
      verified: firebaseUser.emailVerified,
      createdAt: firebaseUser.metadata.creationTime ?? DateTime.now(),
    );
  }

  List<UserRole> _parseRoles(dynamic rolesData) {
    if (rolesData is List) {
      return rolesData.map((r) {
        return switch (r.toString()) {
          'player' => UserRole.player,
          'manager' => UserRole.manager,
          'organizer' => UserRole.organizer,
          'admin' => UserRole.admin,
          _ => UserRole.player,
        };
      }).toList();
    }
    return [UserRole.player];
  }

  /// Attempt login with email and password.
  Future<bool> login(String email, String password) async {
    state = state.copyWith(status: AuthStatus.loading, errorMessage: null);

    try {
      final credential = await _auth!.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        final userModel = await _buildUserModel(credential.user!);
        state = state.copyWith(
          status: AuthStatus.authenticated,
          user: userModel,
        );
        return true;
      }

      state = state.copyWith(
        status: AuthStatus.error,
        errorMessage: 'Login failed. Please try again.',
      );
      return false;
    } on FirebaseAuthException catch (e) {
      final message = switch (e.code) {
        'user-not-found' => 'No account found with this email.',
        'wrong-password' => 'Incorrect password. Please try again.',
        'invalid-email' => 'Please enter a valid email address.',
        'user-disabled' => 'This account has been disabled.',
        'too-many-requests' => 'Too many attempts. Please try again later.',
        'invalid-credential' => 'Invalid email or password.',
        _ => e.message ?? 'Login failed. Please try again.',
      };
      state = state.copyWith(
        status: AuthStatus.error,
        errorMessage: message,
      );
      return false;
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.error,
        errorMessage: 'Login failed: $e',
      );
      return false;
    }
  }

  /// Sign up a new user with Firebase Auth + create Firestore profile.
  Future<bool> signUp(String email, String password, String displayName, {String phone = ''}) async {
    state = state.copyWith(status: AuthStatus.loading, errorMessage: null);

    try {
      final credential = await _auth!.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        // Update display name in Firebase Auth
        await credential.user!.updateDisplayName(displayName);

        // Create profile document in Firestore
        final now = Timestamp.now();
        await _firestore!.collection('profiles').doc(credential.user!.uid).set({
          'displayName': displayName,
          'phone': phone,
          'email': email,
          'cnicHash': '',
          'roles': ['player'],
          'verified': false,
          'photoUrl': '',
          'createdAt': now,
          'updatedAt': now,
        });

        final userModel = UserModel(
          id: credential.user!.uid,
          cnicHash: '',
          phone: phone,
          email: email,
          displayName: displayName,
          verified: false,
          createdAt: now.toDate(),
        );

        state = state.copyWith(
          status: AuthStatus.authenticated,
          user: userModel,
        );
        return true;
      }

      state = state.copyWith(
        status: AuthStatus.error,
        errorMessage: 'Sign up failed. Please try again.',
      );
      return false;
    } on FirebaseAuthException catch (e) {
      final message = switch (e.code) {
        'email-already-in-use' => 'An account already exists with this email.',
        'weak-password' => 'Password is too weak. Use at least 6 characters.',
        'invalid-email' => 'Please enter a valid email address.',
        'operation-not-allowed' => 'Email/password accounts are not enabled.',
        _ => e.message ?? 'Sign up failed. Please try again.',
      };
      state = state.copyWith(
        status: AuthStatus.error,
        errorMessage: message,
      );
      return false;
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.error,
        errorMessage: 'Sign up failed: $e',
      );
      return false;
    }
  }

  /// Send password reset email.
  Future<bool> forgotPassword(String email) async {
    state = state.copyWith(status: AuthStatus.loading, errorMessage: null);

    try {
      await _auth!.sendPasswordResetEmail(email: email);
      state = state.copyWith(status: AuthStatus.unauthenticated);
      return true;
    } on FirebaseAuthException catch (e) {
      final message = switch (e.code) {
        'user-not-found' => 'No account found with this email.',
        'invalid-email' => 'Please enter a valid email address.',
        _ => e.message ?? 'Failed to send reset email.',
      };
      state = state.copyWith(
        status: AuthStatus.error,
        errorMessage: message,
      );
      return false;
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.error,
        errorMessage: 'Failed to send reset email: $e',
      );
      return false;
    }
  }

  /// Check for existing session on app start.
  Future<void> checkSession() async {
    try {
      final firebaseUser = _auth?.currentUser;
      if (firebaseUser != null) {
        try {
          final userModel = await _buildUserModel(firebaseUser);
          state = state.copyWith(
            status: AuthStatus.authenticated,
            user: userModel,
          );
        } catch (e) {
          // If profile fetch fails, still mark as authenticated with basic info
          state = state.copyWith(
            status: AuthStatus.authenticated,
            user: UserModel(
              id: firebaseUser.uid,
              cnicHash: '',
              phone: firebaseUser.phoneNumber ?? '',
              email: firebaseUser.email,
              displayName: firebaseUser.displayName,
              photoUrl: firebaseUser.photoURL,
              verified: firebaseUser.emailVerified,
              createdAt: firebaseUser.metadata.creationTime ?? DateTime.now(),
            ),
          );
        }
      }
    } catch (_) {
      // Firebase not initialized — stay unauthenticated, demo login still works.
    }
  }

  /// Log out and clear auth state.
  Future<void> logout() async {
    // Sign out from Firebase if a real user is signed in; otherwise just clear local state.
    if (_auth?.currentUser != null) {
      await _auth!.signOut();
    }
    state = const AuthState();
  }

  /// Delete the current user's account (Firestore profile + Auth user).
  Future<bool> deleteAccount() async {
    state = state.copyWith(status: AuthStatus.loading, errorMessage: null);

    try {
      final uid = _auth?.currentUser?.uid;
      if (uid == null) {
        state = state.copyWith(
          status: AuthStatus.error,
          errorMessage: 'No user is currently signed in.',
        );
        return false;
      }

      // Delete Firestore profile
      await _firestore!.collection('profiles').doc(uid).delete();

      // Delete Firebase Auth user
      await _auth?.currentUser?.delete();

      state = const AuthState();
      return true;
    } on FirebaseAuthException catch (e) {
      final message = switch (e.code) {
        'requires-recent-login' => 'Please log out and log back in before deleting your account.',
        _ => e.message ?? 'Failed to delete account.',
      };
      state = state.copyWith(
        status: AuthStatus.error,
        errorMessage: message,
      );
      return false;
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.error,
        errorMessage: 'Failed to delete account: $e',
      );
      return false;
    }
  }

  /// Clear error state.
  void clearError() {
    if (state.status == AuthStatus.error) {
      state = state.copyWith(status: AuthStatus.unauthenticated);
    }
  }

  /// Instant demo login — bypasses Firebase completely and sets auth state
  /// with a mock UserModel pre-assigned to the given role.
  /// Use this for web-only local development and role-based dashboard testing.
  void demoLogin(UserRole role) {
    state = state.copyWith(status: AuthStatus.loading, errorMessage: null);

    final demoNames = {
      UserRole.player:    'Haseeb Ahmed',
      UserRole.manager:   'Sara Khan',
      UserRole.organizer: 'Ahmed Raza',
      UserRole.admin:     'Admin User',
    };
    final demoEmails = {
      UserRole.player:    'player@demo.com',
      UserRole.manager:   'manager@demo.com',
      UserRole.organizer: 'organizer@demo.com',
      UserRole.admin:     'admin@demo.com',
    };
    final demoIds = {
      UserRole.player:    'demo_player_001',
      UserRole.manager:   'demo_manager_001',
      UserRole.organizer: 'demo_organizer_001',
      UserRole.admin:     'demo_admin_001',
    };

    final user = UserModel(
      id: demoIds[role]!,
      cnicHash: '',
      phone: '+92 300 0000000',
      email: demoEmails[role],
      displayName: demoNames[role],
      verified: true,
      roles: [role],
      createdAt: DateTime.now(),
    );

    state = AuthState(
      status: AuthStatus.authenticated,
      user: user,
    );
  }
}
