import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:egitimax/models/question/questionPageModel.dart';
import 'package:egitimax/pages/question/questionQuestion.dart';
import 'package:egitimax/pages/question/questionQuestions.dart';
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
  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  late QuestionPageModel mo;
  @override
  void initState() {
    super.initState();
    if (AppConstants.questionPageDebugPrintActive == 1) {
      debugPrint("QuestionPage_initState");
    }
    mo=QuestionPageModel(context: context);
    mo.userId=BigInt.parse('1');
    mo.questionId=BigInt.parse('28');
    mo.selectedPageIndex=1;
  }

  void overrideTitle(String newCurrentTitle) {
    setState(() {
      mo.currentTitle = newCurrentTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (AppConstants.questionPageDebugPrintActive == 1) {
      debugPrint("QuestionPage_build");
    }
    mo.initializeContextItems();
    List<Widget> tapPageItemsConvexAppBar = getTapPageItemsConvexAppBar();
    List<TabItem<IconData>> itemsConvexAppBar = getItemsConvexAppBar();
    Drawer drawerScaffold = getDrawerScaffold();
    Widget endDrawerScaffold = getEndDrawerScaffold();
    List<Widget>? actionsAppBar = getActionsAppBar();

    return LayoutPage(
      initialActiveIndexConvexAppBar: mo.selectedPageIndex,
      actionsAppBar: actionsAppBar,
      drawerScaffold: drawerScaffold,
      endDrawerScaffold: endDrawerScaffold,
      tapPageItemsConvexAppBar: tapPageItemsConvexAppBar,
      itemsConvexAppBar: itemsConvexAppBar,
      titleAppBar: Text(
        mo.currentTitle ?? mo.lang.libPagesQuestionQuestionPage_questionPage,
        style:  mo.theme.textTheme.titleMedium,
      ),
      centerTitleAppBar: true,
      onTapConvexAppBar: (index) {
        debugPrint('Selected Index : $index');
        if (index == 0) {
          if (mo.selectedPageIndex != index) {
            mo.routeManager
                .navigateAndRemoveUntil('/', arguments: {'route': false});
          }
          overrideTitle(mo.lang.libPagesHomeHomePage_home);
        } else if (index == 1) {
          overrideTitle(mo.lang.libPagesQuestionQuestionPage_questionList);
        } else if (index == 2) {
          overrideTitle(mo.lang.libPagesQuestionQuestionPage_question);
        } else if (index == 3) {
          if (Navigator.canPop(context)) {
            mo.routeManager.goBack(context);
          }
          overrideTitle(mo.lang.libPagesQuestionQuestionPage_back);
        } else if (index == 4) {

        } else {}

        mo.selectedPageIndex = index;
      },
    );
  }

  
  List<Widget>? getActionsAppBar() {
    List<Widget>? actionsAppBar = [
      Builder(
        builder: (BuildContext context) {
          return Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: Icon(Icons.menu, size: mo.theme.iconTheme.size),
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
              leading: Icon(Icons.add, size: mo.theme.iconTheme.size),
              title: Text(
                "Add Question",
                style: mo.theme.textTheme.titleMedium,
              ),
              subtitle: Text(
                "New question will be added.",
                style: mo.theme.textTheme.titleSmall,
              ),
              onTap: () {
                mo.routeManager.addRoute(
                    '/AddQuestionPage',
                    (context) => QuestionPage());
                RouteManager().navigateTo('/AddQuestionPage');
              },
            ),
            ListTile(
              leading: Icon(Icons.edit, size: mo.theme.iconTheme.size),
              title: Text(
                "Edit Question",
                style: mo.theme.textTheme.titleMedium,
              ),
              subtitle: Text(
                "Existing question will be edited.",
                style: mo.theme.textTheme.titleSmall,
              ),
              onTap: () {
                mo.routeManager.addRoute(
                    '/EditQuestionPage',
                    (context) => QuestionPage());
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
      TabItem(icon: Icons.home, title: mo.lang.libPagesHomeHomePage_home),
      TabItem(
          icon: Icons.question_mark_outlined,
          title: mo.lang.libPagesQuestionQuestionPage_questionList),
      TabItem(
          icon: Icons.edit_note, title: mo.lang.libPagesQuestionQuestionPage_question,),
      TabItem(
          icon: Icons.arrow_back,
          title: mo.lang.libPagesQuestionQuestionPage_back),
    ];
    return itemsConvexAppBar;
  }

  List<Widget> getTapPageItemsConvexAppBar() {
    var tapPageItemsConvexAppBar = <Widget>[
      Container(),
      QuestionQuestions(mo:mo),
      QuestionQuestion(mo:mo),
      Container()
    ];
    return tapPageItemsConvexAppBar;
  }
}

