import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:country_flags/country_flags.dart';
import 'package:egitimax/models/common/drawerItem.dart';
import 'package:egitimax/models/language/localeModel.dart';
import 'package:egitimax/pages/home/homeHome.dart';
import 'package:egitimax/pages/home/homeMenu.dart';
import 'package:egitimax/pages/home/homeMessages.dart';
import 'package:egitimax/pages/home/homeNetwork.dart';
import 'package:egitimax/pages/home/homeNotifications.dart';
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

    List<Widget> tapPageItemsConvexAppBar = getTapPageItemsConvexAppBar();
    List<TabItem<IconData>> itemsConvexAppBar = getItemsConvexAppBar();
    Drawer drawerScaffold = getDrawerScaffold();
    Widget endDrawerScaffold = getEndDrawerScaffold();
    List<Widget>? actionsAppBar = getActionsAppBar();

    return LayoutPage(
      actionsAppBar: actionsAppBar,
      drawerScaffold: drawerScaffold,
      endDrawerScaffold: endDrawerScaffold,
      tapPageItemsConvexAppBar: tapPageItemsConvexAppBar,
      itemsConvexAppBar: itemsConvexAppBar,
      titleAppBar: const Text('Egitimax'),
      centerTitleAppBar:true,
      onTapConvexAppBar: (index) {
        if (index == 0) {
          routeManager.navigateTo('/');
        }
        if (index == 2) {
          //routeManager.navigateTo('/QuestionPage');
        } else {
          if (Navigator.canPop(context)) {
            routeManager.goBack(context);
          }
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

  List<Widget>? getActionsAppBar() {
    List<Widget>? actionsAppBar = [
      Builder(
        builder: (BuildContext context) {
          return Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: const Icon(Icons.menu),
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
    var endDrawerScaffold = const Drawer(
      //drawer navigation on scaffold
      child: SafeArea(
        child: Column(
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
    return endDrawerScaffold;
  }

  List<TabItem<IconData>> getItemsConvexAppBar() {
    var itemsConvexAppBar = [
      const TabItem(icon: Icons.home, title: 'Home'),
      const TabItem(
          icon: Icons.connect_without_contact_rounded, title: 'My Network'),
      const TabItem(icon: Icons.menu, title: 'Menu'),
      const TabItem(
          icon: Icons.notification_add_outlined, title: 'Notifications'),
      const TabItem(icon: Icons.message_outlined, title: 'Messages'),
    ];
    return itemsConvexAppBar;
  }

  List<Widget> getTapPageItemsConvexAppBar() {
    var tapPageItemsConvexAppBar = <Widget>[
      const HomeHome(
        title: 'Home',
      ),
      const HomeNetwork(
        title: 'Network',
      ),
      const HomeMenu(title: 'Menu',),
      const HomeNotifications(
        title: 'Notifications',
      ),
      const HomeMessages(
        title: 'Messages',
      ),
    ];
    return tapPageItemsConvexAppBar;
  }
}
