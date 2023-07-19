import 'package:country_flags/country_flags.dart';
import 'package:egitimax/models/language/localeModel.dart';
import 'package:egitimax/utils/provider/createDummyImage.dart';
import 'package:egitimax/utils/widget/deviceInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class UserImageDrawerItemProvider {
  UserImageDrawerItemProvider(BuildContext context) {
    theme = Theme.of(context);
    lang = AppLocalizations.of(context)!;
    localeModel = Provider.of<LocaleModel>(context, listen: false);
    deviceType = DeviceInfo().getDeviceType();
  }

  late ThemeData theme;
  late AppLocalizations lang;
  late LocaleModel localeModel;
  late DeviceType deviceType;

  List<ListTile> getUserImageDrawerItems() {
    // Simulate fetching data from a repository

    // Fetch data from the repository
    List<ListTile> data = [
       ListTile(
        leading:   CountryFlag.fromCountryCode(
          localeModel.getCountryCodeFromLanguageCode(
              localeModel.locale.languageCode),
          height: kToolbarHeight / 2,
          width: kToolbarHeight / 2,
          borderRadius: 5,
        ),
        title:  SizedBox(
          width: kToolbarHeight*2,
          child: PopupMenuButton<Locale>(
            icon: Center(
              widthFactor: double.infinity,
              child:Text(localeModel.locale.languageCode.toUpperCase()),
            ),
            onSelected: (Locale selectedLocale) {
              localeModel.changeLocale(selectedLocale);
            },
            itemBuilder: (BuildContext context) {
              return AppLocalizations.supportedLocales.map((Locale locale) {
                return PopupMenuItem<Locale>(
                  value: locale,
                  child: Row(
                    children: [
                      Center(
                        child: CountryFlag.fromCountryCode(
                          localeModel.getCountryCodeFromLanguageCode(
                              locale.languageCode) ??
                              locale.languageCode,
                          height: kToolbarHeight / 2,
                          width: kToolbarHeight,
                          borderRadius: 8,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(locale.languageCode.toUpperCase()),
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
      return createDummyImage(Colors.grey,int.parse(kToolbarHeight.toString()),int.parse(kToolbarHeight.toString()));
    }
  }
}
