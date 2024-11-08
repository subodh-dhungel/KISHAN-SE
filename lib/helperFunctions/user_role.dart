import 'package:flutter/foundation.dart';

class UserRole extends ChangeNotifier{
  bool _isFarmer = false;

  bool get isFarmer => _isFarmer;

  void toggleIsFarmer() {
    _isFarmer = !_isFarmer;
    notifyListeners();
  }
}
