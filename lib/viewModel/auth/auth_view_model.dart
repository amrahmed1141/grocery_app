import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:eshop_app/models/auth/user_model.dart';
import 'package:eshop_app/services/shared_perefrence.dart';

class AuthViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final SharedPrefHelper _sharedPref = SharedPrefHelper();

  bool _isLoading = false;
  String? _errorMssge;
  User? _user;

  bool get isLoading => _isLoading;
  String? get errorMssge => _errorMssge;
  User? get user => _user;

  AuthViewModel() {
    _init();
  }

  void _init() {
    _auth.authStateChanges().listen((User? user) {
      _user = user;
      notifyListeners();
    });
  }

  Future<UserModel?> register({
    required String name,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      _errorMssge = 'Please fill all fields';
      notifyListeners();
      return null;
    }

    try {
      _isLoading = true;
      _errorMssge = null;
      notifyListeners();

      // 1. Create user in Firebase Auth
      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // 2. Generate random ID
      final String id = _generateRandomId();
      final user = UserModel(id: id, name: name, email: email);

      // 3. Save to Firestore
      await _firestore.collection('users').doc(id).set(user.toMap());

      // 4. Save to SharedPreferences
      await _sharedPref.saveUserId(id);
      await _sharedPref.saveUserName(name);
      await _sharedPref.saveUserEmail(email);

      // 5. Success - reset state
      _isLoading = false;
      notifyListeners();
      return user;

    } on FirebaseAuthException catch (e) {
      _isLoading = false;
      if (e.code == 'weak-password') {
        _errorMssge = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        _errorMssge = 'The email address is already in use.';
      } else {
        _errorMssge = 'An error occurred. Please try again.';
      }
      notifyListeners();
      return null;
    } catch (e) {
      _isLoading = false;
      _errorMssge = 'An unexpected error occurred.';
      notifyListeners();
      return null;
    }
  }
  
      
    Future<UserModel?> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    if (email.isEmpty || password.isEmpty) {
      _errorMssge = 'Please fill in all fields.';
      notifyListeners();
      return null;
    }

    try {
      _isLoading = true;
      _errorMssge = null;
      notifyListeners();

      // 1. Sign in with Firebase Auth
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // 2. Fetch user data from Firestore
      final userDoc = await _firestore.collection('users')
          .where('email', isEqualTo: email)
          .limit(1)
          .get();

      if (userDoc.docs.isEmpty) {
        throw Exception('User data not found');
      }

      final userData = userDoc.docs.first.data();
      final user = UserModel.fromMap(userData);

      // 3. Save to SharedPreferences
      await _sharedPref.saveUserId(user.id);
      await _sharedPref.saveUserName(user.name);
      await _sharedPref.saveUserEmail(user.email);

      // 4. Success - reset state
      _isLoading = false;
      notifyListeners();

      return user;
    } on FirebaseAuthException catch (e) {
      _isLoading = false;
      if (e.code == 'user-not-found') {
        _errorMssge = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        _errorMssge = 'Wrong password provided.';
      } else {
        _errorMssge = 'Login failed. Please try again.';
      }
      notifyListeners();
      return null;
    } catch (e) {
      _isLoading = false;
      _errorMssge = 'An unexpected error occurred.';
      notifyListeners();
      return null;
    }
  }    

  String _generateRandomId() {
    const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random();
    return String.fromCharCodes(
      Iterable.generate(
        10,
        (_) => chars.codeUnitAt(random.nextInt(chars.length)),
      ),
    );
  }
}
