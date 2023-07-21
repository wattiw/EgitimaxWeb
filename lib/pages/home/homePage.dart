import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:egitimax/utils/constant/appConstants.dart';
import 'package:egitimax/utils/helper/localeManager.dart';
import 'package:egitimax/pages/home/homeHome.dart';
import 'package:egitimax/pages/home/homeMenu.dart';
import 'package:egitimax/pages/home/homeMessages.dart';
import 'package:egitimax/pages/home/homeNetwork.dart';
import 'package:egitimax/pages/home/homeNotifications.dart';
import 'package:egitimax/repositories/appRepository.dart';
import 'package:egitimax/utils/helper/routeManager.dart';
import 'package:egitimax/utils/widget/deviceInfo.dart';
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
  late LocaleManager localeManager;
  late DeviceType deviceType;
  int selectedPageIndex = 0;

  @override
  void initState() {
    super.initState();
    if (AppConstants.homePageDebugPrintActive == 1) {
      debugPrint("HomePage_initState");
    }
    routeManager = RouteManager();
  }

  @override
  Widget build(BuildContext context) {
    if (AppConstants.homePageDebugPrintActive == 1) {
      debugPrint("HomePage_build");
    }
    loadComponent();

    List<Widget> tapPageItemsConvexAppBar = getTapPageItemsConvexAppBar();
    List<TabItem<IconData>> itemsConvexAppBar = getItemsConvexAppBar();
    Drawer drawerScaffold = getDrawerScaffold();
    Widget endDrawerScaffold = getEndDrawerScaffold();
    List<Widget>? actionsAppBar = getActionsAppBar();

    return LayoutPage(
      initialActiveIndexConvexAppBar: selectedPageIndex,
      actionsAppBar: actionsAppBar,
      drawerScaffold: drawerScaffold,
      endDrawerScaffold: endDrawerScaffold,
      tapPageItemsConvexAppBar: tapPageItemsConvexAppBar,
      itemsConvexAppBar: itemsConvexAppBar,
      titleAppBar: Text(
        lang.libPagesHomeHomePage_home,
        style: theme.textTheme.titleMedium,
      ),
      centerTitleAppBar: true,
      onTapConvexAppBar: (index) {
        debugPrint('Selected Index : $index');
        if (index == 0) {
          if (selectedPageIndex != index) {
            //routeManager.navigateAndRemoveUntil('/',arguments:{'route':false});
          }
        } else {
          if (Navigator.canPop(context)) {
            routeManager.goBack(context);
          }
        }
        selectedPageIndex = index;
      },
    );
  }

  void loadComponent() {
    routeManager = RouteManager();
    appRepository = AppRepository();
    theme = Theme.of(context);
    lang = AppLocalizations.of(context)!;
    localeManager = Provider.of<LocaleManager>(context, listen: false);
    deviceType = DeviceInfo(context).getDeviceType();
  }

  List<Widget>? getActionsAppBar() {
    List<Widget>? actionsAppBar = [
      Builder(
        builder: (BuildContext context) {
          return Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: Icon(Icons.menu, size: theme.iconTheme.size),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          );
        },
      ),
    ];
    return actionsAppBar;
  }

  Widget getEndDrawerScaffold() {
    //Mevcut'a eklemek için Column/ListTile şeklinde gönder...
    var drawerScaffold = const Column(children: []);
    return drawerScaffold;
  }

  Drawer getDrawerScaffold() {
    var endDrawerScaffold = Drawer(
      //drawer navigation on scaffold
      child: SafeArea(
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.home, size: theme.iconTheme.size),
              title: Text(
                "Home Page",
                style: theme.textTheme.titleMedium,
              ),
              subtitle: Text(
                "Subtitle menu 1",
                style: theme.textTheme.titleSmall,
              ),
            ),
            ListTile(
              leading: Icon(Icons.search, size: theme.iconTheme.size),
              title: Text(
                "Search Page",
                style: theme.textTheme.titleMedium,
              ),
              subtitle: Text(
                "Subtitle menu 1",
                style: theme.textTheme.titleSmall,
              ),
            ),

            //put more menu items here
          ],
        ),
      ),
    );
    return endDrawerScaffold;
  }

  List<TabItem<IconData>> getItemsConvexAppBar() {
    var itemsConvexAppBar = [
      TabItem(icon: Icons.home, title: lang.libPagesHomeHomePage_home),
      TabItem(
          icon: Icons.connect_without_contact_rounded,
          title: lang.libPagesHomeHomePage_myNetwork),
      TabItem(icon: Icons.menu, title: lang.libPagesHomeHomePage_menu),
      TabItem(
          icon: Icons.notification_add_outlined,
          title: lang.libPagesHomeHomePage_notifications),
      TabItem(
          icon: Icons.message_outlined,
          title: lang.libPagesHomeHomePage_messages),
    ];
    return itemsConvexAppBar;
  }

  List<Widget> getTapPageItemsConvexAppBar() {
    var tapPageItemsConvexAppBar = <Widget>[
      HomeHome(
        title: lang.libPagesHomeHomePage_home,
        routeManager: routeManager,
        appRepository: appRepository,
        theme: theme,
        lang: lang,
        localeManager: localeManager,
        deviceType: deviceType,
      ),
      HomeNetwork(
        title: lang.libPagesHomeHomePage_myNetwork,
        routeManager: routeManager,
        appRepository: appRepository,
        theme: theme,
        lang: lang,
        localeManager: localeManager,
        deviceType: deviceType,
      ),
      HomeMenu(
        title: lang.libPagesHomeHomePage_menu,
        routeManager: routeManager,
        appRepository: appRepository,
        theme: theme,
        lang: lang,
        localeManager: localeManager,
        deviceType: deviceType,
      ),
      HomeNotifications(
        title: lang.libPagesHomeHomePage_notifications,
        routeManager: routeManager,
        appRepository: appRepository,
        theme: theme,
        lang: lang,
        localeManager: localeManager,
        deviceType: deviceType,
      ),
      HomeMessages(
        title: lang.libPagesHomeHomePage_messages,
        routeManager: routeManager,
        appRepository: appRepository,
        theme: theme,
        lang: lang,
        localeManager: localeManager,
        deviceType: deviceType,
      ),
    ];
    return tapPageItemsConvexAppBar;
  }
}
