import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class SignOutProvider extends ChangeNotifier {
  bool _isSigningOut = false;

  bool get isSigningOut => _isSigningOut;

  Future<void> signOut() async {
    _isSigningOut = true;
    notifyListeners();

    try {
      await FirebaseAuth.instance.signOut();
    } finally {
      _isSigningOut = false;
      notifyListeners();
    }
  }
}
