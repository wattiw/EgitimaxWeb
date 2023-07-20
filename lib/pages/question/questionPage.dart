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
  const QuestionPage({super.key});

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
  int selectedPageIndex=1;

  @override
  void initState() {
    super.initState();
    if (AppConstants.questionPageDebugPrintActive == 1) {
      debugPrint("QuestionPage_initState");
    }
    routeManager = RouteManager();
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
      titleAppBar: Text(lang.libPagesQuestionQuestionPage_questionPage),
      centerTitleAppBar: true,
      onTapConvexAppBar: (index) {
        debugPrint('Selected Index : $index');
        if (index == 0) {
          if (selectedPageIndex != index) {
            routeManager.navigateAndRemoveUntil('/',arguments:{'route':false});
          }
        } else if (index == 1) {

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
              title: Text("Soru Page"),
              subtitle: Text("Subtitle menu 1"),
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text("Test Page"),
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
      TabItem(icon: Icons.home, title: lang.libPagesHomeHomePage_home),
      TabItem(icon: Icons.question_mark_outlined, title: lang.libPagesQuestionQuestionPage_question),
      TabItem(icon: Icons.arrow_back, title: lang.libPagesQuestionQuestionPage_back),
    ];
    return itemsConvexAppBar;
  }

  List<Widget> getTapPageItemsConvexAppBar() {
    var tapPageItemsConvexAppBar = <Widget>[
      Container(),
      QuestionQuestion(
        title: lang.libPagesQuestionQuestionPage_question,
      ),
      Container()
    ];
    return tapPageItemsConvexAppBar;
  }
}
