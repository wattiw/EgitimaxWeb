import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:egitimax/pages/question/questionQuestion.dart';
import 'package:egitimax/pages/question/questionQuestions.dart';
import 'package:egitimax/pages/template.dart';
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
  QuestionPage({super.key, required this.userId, required this.questionId});

  String? currentTitle;

  BigInt userId;
  BigInt questionId;

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  late RouteManager routeManager;
  late AppRepository appRepository;
  late ThemeData theme;
  late AppLocalizations lang;
  late LocaleManager localeManager;
  late DeviceTypes deviceType;
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
          overrideTitle(lang.libPagesQuestionQuestionPage_questionList);
        } else if (index == 2) {
          overrideTitle(lang.libPagesQuestionQuestionPage_question);
        } else if (index == 3) {
          overrideTitle('Data Table');
        } else if (index == 4) {
          if (Navigator.canPop(context)) {
            routeManager.goBack(context);
          }
          overrideTitle(lang.libPagesQuestionQuestionPage_back);
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
    deviceType = DeviceInfo().getDeviceType();
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
              leading: Icon(Icons.add, size: theme.iconTheme.size),
              title: Text(
                "Add Question",
                style: theme.textTheme.titleMedium,
              ),
              subtitle: Text(
                "New question will be added.",
                style: theme.textTheme.titleSmall,
              ),
              onTap: () {
                routeManager.addRoute(
                    '/AddQuestionPage',
                    (context) => QuestionPage(
                          questionId: BigInt.parse('0'),
                          userId: BigInt.parse('1'),
                        ));
                RouteManager().navigateTo('/AddQuestionPage');
              },
            ),
            ListTile(
              leading: Icon(Icons.edit, size: theme.iconTheme.size),
              title: Text(
                "Edit Question",
                style: theme.textTheme.titleMedium,
              ),
              subtitle: Text(
                "Existing question will be edited.",
                style: theme.textTheme.titleSmall,
              ),
              onTap: () {
                routeManager.addRoute(
                    '/EditQuestionPage',
                    (context) => QuestionPage(
                          questionId: BigInt.parse('28'),
                          userId: BigInt.parse('1'),
                        ));
                RouteManager().navigateTo('/EditQuestionPage');
              },
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
          title: lang.libPagesQuestionQuestionPage_questionList),
      TabItem(
          icon: Icons.edit, title: lang.libPagesQuestionQuestionPage_question),
      TabItem(
          icon: Icons.table_chart, title: 'Table'),
      TabItem(
          icon: Icons.arrow_back,
          title: lang.libPagesQuestionQuestionPage_back),
    ];
    return itemsConvexAppBar;
  }

  List<Widget> getTapPageItemsConvexAppBar() {
    var tapPageItemsConvexAppBar = <Widget>[
      Container(),
      QuestionQuestions(
        title: lang.libPagesQuestionQuestionPage_question,
        routeManager: routeManager,
        appRepository: appRepository,
        theme: theme,
        lang: lang,
        localeManager: localeManager,
        deviceType: deviceType,
        userId: widget.userId,
      ),
      QuestionQuestion(
        title: lang.libPagesQuestionQuestionPage_question,
        routeManager: routeManager,
        appRepository: appRepository,
        theme: theme,
        lang: lang,
        localeManager: localeManager,
        deviceType: deviceType,
        userId: widget.userId,
        questionId: widget.questionId,
      ),
      Container(),
      Container()
    ];
    return tapPageItemsConvexAppBar;
  }
}
