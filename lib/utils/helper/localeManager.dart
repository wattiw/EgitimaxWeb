import 'package:egitimax/utils/constant/appConstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocaleManager extends ChangeNotifier {
  Locale _locale = const Locale(AppConstants.languageCodeDefault, AppConstants.languageCountryCodeDefault);
  Locale get locale => _locale;
  String get countryCode => getCountryCodeFromLanguageCode(locale.languageCode);
  String get countryName => getCountryNameFromLanguageCode(locale.languageCode);

  static const List<Locale> supportedLocales = [
    Locale('de', 'DE'), // German (Germany)
    Locale('fr', 'FR'), // French (France)
    Locale('tr', 'TR'), // Turkish (Turkey)
    Locale('en', 'US'), // English (United States)
    Locale('az', 'AZ'), // Azarbaycan (Azerbaycan)
    Locale('ar', 'SA'), // Arabian (Arabian)
  ];

  Map<String, String> countryNames = {
    'de': 'Deutsch',
    'fr': 'Français',
    'tr': 'Türkçe',
    'en': 'English',
    'az': 'Azərbaycanca',
    'ar': 'العربية'
  };

  String getCountryCodeFromLanguageCode(String languageCode) {
    for (Locale locale in supportedLocales) {
      if (locale.languageCode == languageCode) {
        return locale.countryCode ?? '';
      }
    }
    return '';
  }

  String getCountryNameFromLanguageCode(String languageCode) {
    for (Locale locale in supportedLocales) {
      if (locale.languageCode == languageCode) {
        return countryNames[locale.languageCode ] ?? '';
      }
    }
    return '';
  }

  void changeLocale(Locale newLocale) {
    Locale newestLocale = Locale(newLocale.languageCode,
        getCountryCodeFromLanguageCode(newLocale.languageCode));
    _locale = newestLocale;
    notifyListeners();
  }
}
