import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'models/language/localeModel.dart';
import 'pages/home/homePage.dart';
import 'pages/question/question.dart';
import 'utils/helper/routeManager.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final RouteManager routeManager = RouteManager();
    routeManager.addRoute('/', (context) =>  const HomePage());
    routeManager.addRoute('/QuestionPage', (context) =>   const QuestionPage());


    return ChangeNotifierProvider(
      create: (context) => LocaleModel(),
      child: Consumer<LocaleModel>(
        builder: (context, localeModel, child){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: localeModel.locale,
            onGenerateTitle:(context) =>'Egitimax',
            title: 'Egitimax Platform',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor:Colors.blue ),
              useMaterial3: true,
            ),
            initialRoute: '/',
            navigatorKey: routeManager.navigatorKey,
            onGenerateRoute: routeManager.onGenerateRoute,
            routes: routeManager.routes,
          );
        }
      ),
    );
  }
}


