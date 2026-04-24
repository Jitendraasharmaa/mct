import 'dart:async';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class InternetProvider extends ChangeNotifier {
  bool _isConnected = true;
  bool _isLoading = true;

  bool get isConnected => _isConnected;

  bool get isLoading => _isLoading;

  StreamSubscription<InternetStatus>? _subscription;

  InternetProvider() {
    _init();
  }

  Future<void> _init() async {
    try {
      _isConnected = await InternetConnection().hasInternetAccess;
    } catch (e) {
      _isConnected = false;
    }

    _isLoading = false;
    notifyListeners();

    _subscription = InternetConnection().onStatusChange.listen((status) {
      _isConnected = status == InternetStatus.connected;
      notifyListeners();
    });
  }

  Future<void> retry() async {
    _isLoading = true;
    notifyListeners();

    await _init();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
