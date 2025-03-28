import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:umbc_lost_found_mobile/models/user_model.dart';
import 'package:umbc_lost_found_mobile/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  UserModel? _user;
  bool _isLoading = false;

  UserModel? get user => _user;
  bool get isLoading => _isLoading;
  bool get isAuthenticated => _user != null;

  // Sign up
  Future<void> signUp({
    required String email,
    required String password,
    required String username,
  }) async {
    _setLoading(true);
    try {
      final userCredential = await _authService.signUp(
        email: email,
        password: password,
      );

      // TODO: Create user in backend
      // For now, create a basic user model
      _user = UserModel(
        id: userCredential.user!.uid,
        email: email,
        username: username,
        firebaseUid: userCredential.user!.uid,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  // Sign in
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    _setLoading(true);
    try {
      final userCredential = await _authService.signIn(
        email: email,
        password: password,
      );

      // TODO: Fetch user from backend
      // For now, create a basic user model
      _user = UserModel(
        id: userCredential.user!.uid,
        email: email,
        username: email.split('@')[0], // Temporary username
        firebaseUid: userCredential.user!.uid,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  // Sign out
  Future<void> signOut() async {
    _setLoading(true);
    try {
      await _authService.signOut();
      _user = null;
      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  // Reset password
  Future<void> resetPassword(String email) async {
    _setLoading(true);
    try {
      await _authService.resetPassword(email);
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
