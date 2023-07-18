import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:country_flags/country_flags.dart';
import 'package:egitimax/models/common/drawerItem.dart';
import 'package:egitimax/models/language/localeModel.dart';
import 'package:egitimax/repositories/appRepository.dart';
import 'package:egitimax/utils/helper/routeManager.dart';
import 'package:egitimax/utils/widget/layoutPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late RouteManager routeManager;
  late AppRepository appRepository;
  late ThemeData theme;
  late AppLocalizations lang;
  late LocaleModel localeModel;

  @override
  void initState() {
    super.initState();
    routeManager = RouteManager();
  }

  @override
  Widget build(BuildContext context) {
    loadComponent();

    var tapPageItemsConvexAppBar = <Widget>[
      const Text(
        'Index 0: Home',
      ),
      const Text(
        'Index 1: Business',
      ),
      const Text(
        'Index 2: Question Page Routing',
      ),
      const Text(
        'Index 3: Settings',
      ),
      const Text(
        'Index 4: Settings',
      ),
    ];
    var itemsConvexAppBar = [
      const TabItem(icon: Icons.home, title: 'Home'),
      const TabItem(icon: Icons.map, title: 'Discovery'),
      const TabItem(icon: Icons.question_mark_outlined, title: 'Question'),
      const TabItem(icon: Icons.message, title: 'Message'),
      const TabItem(icon: Icons.people, title: 'Profile'),
    ];
    var endDrawerScaffold = const Drawer(
      //drawer navigation on scaffold
      child: SafeArea(
        child: Column(
          //column widget
          children: [
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home Page"),
              subtitle: Text("Subtitle menu 1"),
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text("Search Page"),
              subtitle: Text("Subtitle menu 1"),
            ),

            //put more menu items here
          ],
        ),
      ),
    );
    var actionsAppBar = [
      Row(
        children: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              // Ayarlar aksiyonu
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Bildirimler aksiyonu
            },
          ),
          PopupMenuButton<Locale>(
            icon: Center(
              child: CountryFlag.fromCountryCode(
                localeModel.getCountryCodeFromLanguageCode(
                    localeModel.locale.languageCode),
                height: kToolbarHeight / 2,
                width: kToolbarHeight / 2,
                borderRadius: 5,
              ),
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
          Builder(
            builder: (BuildContext context) {
              return Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
              );
            },
          ),
        ],
      ),
    ];

    return LayoutPage(
      actionsAppBar: actionsAppBar,
      endDrawerScaffold: endDrawerScaffold,
      tapPageItemsConvexAppBar: tapPageItemsConvexAppBar,
      itemsConvexAppBar: itemsConvexAppBar,
      titleAppBar: const Text('Home'),
      onTapConvexAppBar: (index) {
        if (index == 0) {
          routeManager.navigateTo('/');
        }
        if (index == 2) {
          routeManager.navigateTo('/QuestionPage');
        }
      },
    );
  }

  void loadComponent() {
    routeManager = RouteManager();
    appRepository = AppRepository();
    theme = Theme.of(context);
    lang = AppLocalizations.of(context)!;
    localeModel = Provider.of<LocaleModel>(context, listen: false);
  }
}
