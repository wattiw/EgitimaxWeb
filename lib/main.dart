import 'package:egitimax/pages/question/questionPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'utils/helper/localeManager.dart';
import 'pages/home/homePage.dart';
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
    routeManager.addRoute('/', (context) => HomePage());
    routeManager.addRoute('/QuestionPage', (context) => QuestionPage(questionId: BigInt.parse('0'),userId: BigInt.parse('1'),));

    return ChangeNotifierProvider(
      create: (context) => LocaleManager(),
      child: Consumer<LocaleManager>(builder: (context, localeManager, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: localeManager.locale,
          onGenerateTitle: (context) => 'Egitimax',
          title: 'Egitimax Platform',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(55, 91, 145, 1)),
            useMaterial3: true,
            textTheme: const TextTheme(
              titleLarge: TextStyle(fontSize: 12),
              titleMedium: TextStyle(fontSize: 10),
              titleSmall: TextStyle(fontSize: 8),
              bodyLarge: TextStyle(fontSize: 12),
              bodyMedium: TextStyle(fontSize: 10),
              bodySmall: TextStyle(fontSize: 8),
            ),
            iconTheme: const IconThemeData(
              size:20,
              color:  Color.fromRGBO(55, 91, 145, 1)
            ),
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary
            ),
          ),
          initialRoute: '/',
          navigatorKey: routeManager.navigatorKey,
          onGenerateRoute: routeManager.onGenerateRoute,
          routes: routeManager.routes,
        );
      }),
    );
  }

  static TextTheme _createScaledTextTheme(TextTheme? baseTextTheme) {
    const double scaleFactor = 0.5; // Adjust this factor to control the scaling

    return baseTextTheme?.copyWith(
          displayLarge: baseTextTheme.displayLarge?.copyWith(
              fontSize: _calculateFontSize(
                  baseTextTheme.displayLarge?.fontSize, scaleFactor)),
          displayMedium: baseTextTheme.displayMedium?.copyWith(
              fontSize: _calculateFontSize(
                  baseTextTheme.displayMedium?.fontSize, scaleFactor)),
          displaySmall: baseTextTheme.displaySmall?.copyWith(
              fontSize: _calculateFontSize(
                  baseTextTheme.displaySmall?.fontSize, scaleFactor)),
          headlineLarge: baseTextTheme.headlineLarge?.copyWith(
              fontSize: _calculateFontSize(
                  baseTextTheme.headlineLarge?.fontSize, scaleFactor)),
          headlineMedium: baseTextTheme.headlineMedium?.copyWith(
              fontSize: _calculateFontSize(
                  baseTextTheme.headlineMedium?.fontSize, scaleFactor)),
          headlineSmall: baseTextTheme.headlineSmall?.copyWith(
              fontSize: _calculateFontSize(
                  baseTextTheme.headlineSmall?.fontSize, scaleFactor)),
          titleLarge: baseTextTheme.titleLarge?.copyWith(
              fontSize: _calculateFontSize(
                  baseTextTheme.titleLarge?.fontSize, scaleFactor)),
          titleMedium: baseTextTheme.titleMedium?.copyWith(
              fontSize: _calculateFontSize(
                  baseTextTheme.titleMedium?.fontSize, scaleFactor)),
          titleSmall: baseTextTheme.titleSmall?.copyWith(
              fontSize: _calculateFontSize(
                  baseTextTheme.titleSmall?.fontSize, scaleFactor)),
          bodyLarge: baseTextTheme.bodyLarge?.copyWith(
              fontSize: _calculateFontSize(
                  baseTextTheme.bodyLarge?.fontSize, scaleFactor)),
          bodyMedium: baseTextTheme.bodyMedium?.copyWith(
              fontSize: _calculateFontSize(
                  baseTextTheme.bodyMedium?.fontSize, scaleFactor)),
          bodySmall: baseTextTheme.bodySmall?.copyWith(
              fontSize: _calculateFontSize(
                  baseTextTheme.bodySmall?.fontSize, scaleFactor)),
          labelLarge: baseTextTheme.labelLarge?.copyWith(
              fontSize: _calculateFontSize(
                  baseTextTheme.labelLarge?.fontSize, scaleFactor)),
          labelMedium: baseTextTheme.labelMedium?.copyWith(
              fontSize: _calculateFontSize(
                  baseTextTheme.labelMedium?.fontSize, scaleFactor)),
          labelSmall: baseTextTheme.labelSmall?.copyWith(
              fontSize: _calculateFontSize(
                  baseTextTheme.labelSmall?.fontSize, scaleFactor)),
        ) ??
        baseTextTheme!;
  }

  static double? _calculateFontSize(double? fontSize, double scaleFactor) {
    if (fontSize == null) return null;
    final double scaledFontSize = fontSize * scaleFactor;
    return scaledFontSize < 0.5 ? 0.5 : scaledFontSize;
  }
}
