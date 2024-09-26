import 'package:flutter/material.dart';

class Searchstate extends ChangeNotifier{
  bool _isSearchBarVisible = false;
  bool get isSearchBarVisible => _isSearchBarVisible;
  void toggleSearchBar(){
    _isSearchBarVisible = !_isSearchBarVisible;
    notifyListeners();
  }
}