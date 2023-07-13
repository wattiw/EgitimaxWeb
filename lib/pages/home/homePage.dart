import 'package:egitimax/models/language/localeModel.dart';
import 'package:egitimax/utils/configuration/routeManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final RouteManager routeManager = RouteManager();
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _changeLanguage() {
    LocaleModel localeModel = Provider.of<LocaleModel>(context, listen: false);
    const supportedLocales = AppLocalizations.supportedLocales;
    final currentLocale = localeModel.locale;

    // Find the index of the current locale in the supported locales list
    final currentIndex = supportedLocales.indexOf(currentLocale);

    // Calculate the index of the next language
    final nextIndex = (currentIndex + 1) % supportedLocales.length;

    // Get the next supported locale
    final nextLocale = supportedLocales[nextIndex];

    localeModel.changeLocale(nextLocale);
  }

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;
    var theme = Theme.of(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(lang.homePage),
          actions: [
            TextButton.icon(
              onPressed: () {
                _changeLanguage();
              },
              icon: const Icon(Icons.language_outlined),
              label:Text(
                Provider.of<LocaleModel>(context, listen: false).locale.toString().toUpperCase(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                constraints: const BoxConstraints(
                  maxHeight: kToolbarHeight,
                  maxWidth:
                      kToolbarHeight * 3.29, // Width matches the maximum height
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
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'increment',
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Center(
                child: Text(
                  'Settings',
                  style: theme.textTheme.headlineMedium,
                ),
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  const Icon(Icons.translate),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: Text(
                      'Change Language (${Provider.of<LocaleModel>(context, listen: false).locale.toString()})',
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
              onTap: () {
                _changeLanguage();
              },
            )
          ],
        ),
      ),
    );
  }
}
