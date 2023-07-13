import 'package:egitimax/models/language/localeModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;

  @override
  final Size preferredSize;

  const CustomAppBar({Key? key,required this.title})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  void _changeLanguage(BuildContext context) {
    LocaleModel localeModel = Provider.of<LocaleModel>(context, listen: false);
    const supportedLocales = AppLocalizations.supportedLocales;
    final currentLocale = localeModel.locale;
    final currentIndex = supportedLocales.indexOf(currentLocale);
    final nextIndex = (currentIndex + 1) % supportedLocales.length;
    final nextLocale = supportedLocales[nextIndex];
    localeModel.changeLocale(nextLocale);
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final localeModel = Provider.of<LocaleModel>(context, listen: false);

    return AppBar(
      backgroundColor: theme.colorScheme.inversePrimary,
      title: Text(widget.title),
      actions: [
        TextButton.icon(
          onPressed: () {
            _changeLanguage(context);
          },
          icon: const Icon(Icons.language_outlined),
          label: Text(
            localeModel.locale.toString().toUpperCase(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            constraints: const BoxConstraints(
              maxHeight: kToolbarHeight,
              maxWidth: kToolbarHeight * 3.29, // Width matches the maximum height
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/EgitimaxLogo.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
