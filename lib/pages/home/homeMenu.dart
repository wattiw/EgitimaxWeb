import 'package:egitimax/utils/constant/appConstants.dart';
import 'package:egitimax/utils/helper/routeManager.dart';
import 'package:flutter/material.dart';

class HomeMenu extends StatefulWidget {
  const HomeMenu({super.key, required this.title});
  final String title;

  @override
  State<HomeMenu> createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  final Map<String, String> links = {
    '/QuestionPage':'Question Page'
  };

  @override
  void initState() {
    super.initState();
    if (AppConstants.homePageDebugPrintActive == 1) {
    debugPrint("HomeMenu_initState");
  }
  }

  @override
  Widget build(BuildContext context) {
    if (AppConstants.homePageDebugPrintActive == 1) {
    debugPrint("HomeMenu_build");
  }
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    final accentColor = theme.colorScheme.onPrimary;


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        foregroundColor:Theme.of(context).colorScheme.secondary ,
        shadowColor:Theme.of(context).colorScheme.shadow ,
        surfaceTintColor: Theme.of(context).colorScheme.surface ,
        title: Text(widget.title),
      ),
      body: Center(
        child:Wrap(
          spacing: 16.0,
          runSpacing: 16.0,
          children: RouteManager().routes.entries.map((route) {
            final linkText = links[route.key];
            if (linkText != null) {
              return GestureDetector(
                onTap: () {
                  RouteManager().navigateTo(route.key);
                },
                child: Card(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [primaryColor, accentColor],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        linkText,
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return const SizedBox.shrink(); // Return an empty widget
            }
          }).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){

        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}