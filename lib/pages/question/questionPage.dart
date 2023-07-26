import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:egitimax/pages/question/questionQuestion.dart';
import 'package:egitimax/utils/constant/appConstants.dart';
import 'package:egitimax/utils/helper/localeManager.dart';
import 'package:egitimax/repositories/appRepository.dart';
import 'package:egitimax/utils/helper/routeManager.dart';
import 'package:egitimax/utils/widget/deviceInfo.dart';
import 'package:egitimax/utils/widget/layoutPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class QuestionPage extends StatefulWidget {
  QuestionPage({super.key});

  String? currentTitle;

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  late RouteManager routeManager;
  late AppRepository appRepository;
  late ThemeData theme;
  late AppLocalizations lang;
  late LocaleManager localeManager;
  late DeviceType deviceType;
  int selectedPageIndex = 1;

  @override
  void initState() {
    super.initState();
    if (AppConstants.questionPageDebugPrintActive == 1) {
      debugPrint("QuestionPage_initState");
    }
  }

  void overrideTitle(String newCurrentTitle) {
    setState(() {
      widget.currentTitle = newCurrentTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (AppConstants.questionPageDebugPrintActive == 1) {
      debugPrint("QuestionPage_build");
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
        widget.currentTitle ?? lang.libPagesQuestionQuestionPage_questionPage,
        style: theme.textTheme.titleMedium,
      ),
      centerTitleAppBar: true,
      onTapConvexAppBar: (index) {
        debugPrint('Selected Index : $index');
        if (index == 0) {
          if (selectedPageIndex != index) {
            routeManager
                .navigateAndRemoveUntil('/', arguments: {'route': false});
          }
          overrideTitle(lang.libPagesHomeHomePage_home);
        } else if (index == 1) {
          overrideTitle(lang.libPagesQuestionQuestionPage_question);
        } else if (index == 2) {
          if (Navigator.canPop(context)) {
            routeManager.goBack(context);
          }
          overrideTitle(lang.libPagesQuestionQuestionPage_back);
        } else if (index == 3) {
        } else if (index == 4) {
        } else {}

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
                "Soru Page",
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
                "Test Page",
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
          icon: Icons.question_mark_outlined,
          title: lang.libPagesQuestionQuestionPage_question),
      TabItem(
          icon: Icons.arrow_back,
          title: lang.libPagesQuestionQuestionPage_back),
    ];
    return itemsConvexAppBar;
  }

  List<Widget> getTapPageItemsConvexAppBar() {
    var tapPageItemsConvexAppBar = <Widget>[
      Container(),
      QuestionQuestion(
        title: lang.libPagesQuestionQuestionPage_question,
        routeManager: routeManager,
        appRepository: appRepository,
        theme: theme,
        lang: lang,
        localeManager: localeManager,
        deviceType: deviceType,
      ),
      Container()
    ];
    return tapPageItemsConvexAppBar;
  }
}
