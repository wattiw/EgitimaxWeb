import 'package:egitimax/models/common/drawerItem.dart';
import 'package:egitimax/models/egitimax/egitimaxEntities.dart';
import 'package:egitimax/models/language/localeModel.dart';
import 'package:egitimax/repositories/appRepository.dart';
import 'package:egitimax/utils/helper/api.dart';
import 'package:egitimax/utils/helper/routeManager.dart';
import 'package:egitimax/utils/widget/customAppBar.dart';
import 'package:egitimax/utils/widget/customDrawer.dart';
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
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    AppRepository appRepository=AppRepository();
    var lang = AppLocalizations.of(context)!;
    var theme = Theme.of(context);

    return Scaffold(
      appBar:CustomAppBar(title: lang.homePage),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<List<WeatherForecast>>(
              future: appRepository.getWeather(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: snapshot.data!.map((forecast) {
                      return Column(
                        children: [
                          Text(forecast.date.toString()),
                          Text(forecast.temperatureC.toString()),
                          Text(forecast.temperatureF.toString()),
                          Text(forecast.summary ?? ''),
                          // Add additional widgets or formatting as needed
                        ],
                      );
                    }).toList(),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'emptyButton',
        onPressed: (){
          setState(() {

          });
        },
        tooltip: 'Call Service',
        child: const Icon(Icons.data_object),
      ),
      drawer: CustomDrawer(
        title: 'Settings',
        drawerItems: [
          DrawerItem(
            leading: const Icon(Icons.translate),
            itemTitle: 'Change Language (${ Provider.of<LocaleModel>(context, listen: false).locale.toString().toUpperCase()})',
            onTap: (context) {
              _changeLanguage();
            },
          ),
          // Add other DrawerItem objects here
        ],
      ),
    );
  }

  void _changeLanguage() {
    LocaleModel localeModel = Provider.of<LocaleModel>(context, listen: false);
    const supportedLocales = AppLocalizations.supportedLocales;
    final currentLocale = localeModel.locale;
    final currentIndex = supportedLocales.indexOf(currentLocale);
    final nextIndex = (currentIndex + 1) % supportedLocales.length;
    final nextLocale = supportedLocales[nextIndex];
    localeModel.changeLocale(nextLocale);
  }
}


