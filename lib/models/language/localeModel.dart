import 'package:flutter/material.dart';

class LocaleModel extends ChangeNotifier {
  Locale _locale = Locale('en');

  Locale get locale => _locale;

  void changeLocale(Locale newLocale) {
    _locale = newLocale;
    notifyListeners();
  }
}
