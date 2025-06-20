import 'package:flutter/material.dart';

class SearchController with ChangeNotifier {
  final TextEditingController text = TextEditingController();

  String get searchText => text.text;

  void clear() {
    text.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    text.dispose();
    super.dispose();
  }
}