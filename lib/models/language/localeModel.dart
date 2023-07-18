import 'package:egitimax/utils/constant/appConstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocaleModel extends ChangeNotifier {
  Locale _locale = const Locale(AppConstants.languageCodeDefault,AppConstants.languageCountryCodeDefault);

  Locale get locale => _locale;

  static const List<Locale> supportedLocales = [
    Locale('de', 'DE'), // German (Germany)
    Locale('fr', 'FR'), // French (France)
    Locale('tr', 'TR'), // Turkish (Turkey)
    Locale('en', 'US'), // English (United States)
  ];

  String getCountryCodeFromLanguageCode(String languageCode) {
    for (Locale locale in supportedLocales) {
      if (locale.languageCode == languageCode) {
        return locale.countryCode ?? '';
      }
    }
    return '';
  }

  void changeLocale(Locale newLocale) {
    Locale newestLocale=Locale(newLocale.languageCode,getCountryCodeFromLanguageCode(newLocale.languageCode));
    _locale = newestLocale;
    notifyListeners();
  }
}
