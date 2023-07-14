import 'package:egitimax/utils/constant/appConstants.dart';
import 'package:flutter/material.dart';

class LocaleModel extends ChangeNotifier {
  Locale _locale = const Locale(AppConstants.languageDefault);

  Locale get locale => _locale;

  void changeLocale(Locale newLocale) {
    _locale = newLocale;
    notifyListeners();
  }
}
