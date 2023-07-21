import 'package:country_flags/country_flags.dart';
import 'package:egitimax/utils/helper/localeManager.dart';
import 'package:egitimax/utils/provider/imager.dart';
import 'package:egitimax/utils/widget/deviceInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class UserImageDrawerItemProvider {
  UserImageDrawerItemProvider(BuildContext context) {
    theme = Theme.of(context);
    lang = AppLocalizations.of(context)!;
    localeManager = Provider.of<LocaleManager>(context, listen: false);
    deviceType = DeviceInfo(context).getDeviceType();
  }

  late ThemeData theme;
  late AppLocalizations lang;
  late LocaleManager localeManager;
  late DeviceType deviceType;

  List<ListTile> getUserImageDrawerItems() {
    // Simulate fetching data from a repository

    // Fetch data from the repository
    List<ListTile> data = [
       ListTile(
        leading: CountryFlag.fromCountryCode(
          localeManager.getCountryCodeFromLanguageCode(
              localeManager.locale.languageCode),
          height: kToolbarHeight / 2,
          width: kToolbarHeight / 2,
          borderRadius: 5,
        ),
        title:  SizedBox(
          width: kToolbarHeight*2,
          child: PopupMenuButton<Locale>(
            icon: Center(
              widthFactor: double.infinity,
              child:  Text(localeManager.getCountryNameFromLanguageCode(localeManager.locale.languageCode),style: theme.textTheme.bodyMedium,),
            ),
            onSelected: (Locale selectedLocale) {
              localeManager.changeLocale(selectedLocale);
            },
            itemBuilder: (BuildContext context) {
              return AppLocalizations.supportedLocales.map((Locale locale) {
                return PopupMenuItem<Locale>(
                  value: locale,
                  child: Row(
                    children: [
                      Center(
                        child: CountryFlag.fromCountryCode(
                          localeManager.getCountryCodeFromLanguageCode(
                              locale.languageCode) ??
                              locale.languageCode,
                          height: kToolbarHeight / 2,
                          width: kToolbarHeight,
                          borderRadius: 8,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(localeManager.getCountryNameFromLanguageCode(locale.languageCode),style: theme.textTheme.bodyMedium,),
                    ],
                  ),
                );
              }).toList();
            },
          ),
        ),
      ),
    ];

    return data;
  }

  static ImageProvider<Object> getUserImage<T>(T imagePath) {
    if (imagePath is String) {
      if (imagePath.startsWith('http') || imagePath.startsWith('https')) {
        return NetworkImage(imagePath);
      } else {
        return AssetImage(imagePath);
      }
    } else if (imagePath is ImageProvider<Object>) {
      return imagePath;
    } else {
      return Imager.createDummyImage(Colors.grey,int.parse(kToolbarHeight.toString()),int.parse(kToolbarHeight.toString()));
    }
  }
}
