import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:egitimax/models/quiz/quizPageModel.dart';
import 'package:egitimax/pages/question/questionQuestion.dart';
import 'package:egitimax/pages/question/questionQuestions.dart';
import 'package:egitimax/pages/quiz/quiz.dart';
import 'package:egitimax/pages/quiz/quizs.dart';
import 'package:egitimax/utils/constant/appConstants.dart';
import 'package:egitimax/utils/helper/routeManager.dart';
import 'package:egitimax/utils/widget/layoutPage.dart';
import 'package:flutter/material.dart';


class QuizPage extends StatefulWidget {
  QuizPage({super.key,this.mo});
  QuizPageModel? mo;
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late QuizPageModel mo;
  @override
  void initState() {
    super.initState();
    if (AppConstants.quizPageDebugPrintActive == 1) {
      debugPrint("QuizPage_initState");
    }

    if(widget.mo!=null)
    {
      mo=widget.mo!;
    }else{
      mo=QuizPageModel(context: context);
      mo.selectedPageIndex=1;
    }


  }

  void overrideTitle(String newCurrentTitle) {
    setState(() {
      mo.currentTitle = newCurrentTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (AppConstants.quizPageDebugPrintActive == 1) {
      debugPrint("QuizPage_build");
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
        mo.currentTitle ?? 'Sınavlar',
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
          overrideTitle('Sınavlar');
        } else if (index == 2) {
          overrideTitle('Sınav');
        } else if (index == 3) {
          if (Navigator.canPop(context)) {
            mo.routeManager.goBack(context);
          }
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
                "Sınav Ekle",
                style: mo.theme.textTheme.titleMedium,
              ),
              subtitle: Text(
                "New quiz will be added.",
                style: mo.theme.textTheme.titleSmall,
              ),
              onTap: () {
                mo.routeManager.addRoute(
                    '/AddQuizPage',
                        (context) => QuizPage());
                RouteManager().navigateTo('/AddQuizPage');
              },
            ),
            ListTile(
              leading: Icon(Icons.edit, size: mo.theme.iconTheme.size),
              title: Text(
                "Edit Quiz",
                style: mo.theme.textTheme.titleMedium,
              ),
              subtitle: Text(
                "Existing qiz will be edited.",
                style: mo.theme.textTheme.titleSmall,
              ),
              onTap: () {
                mo.routeManager.addRoute(
                    '/EditQuizPage',
                        (context) => QuizPage());
                RouteManager().navigateTo('/EditQuizPage');
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
      const TabItem(
          icon: Icons.library_books_outlined,
          title: 'Sınav Listesi'),
      TabItem(
        icon:mo.questionId>BigInt.zero ? Icons.edit_note_sharp : Icons.add, title: 'Sınav',),
      const TabItem(
          icon: Icons.arrow_back,
          title: 'Geri'),
    ];
    return itemsConvexAppBar;
  }

  List<Widget> getTapPageItemsConvexAppBar() {
    var tapPageItemsConvexAppBar = <Widget>[
      Container(),
      Quizs(mo:mo),
      Quiz(mo:mo),
      Container()
    ];
    return tapPageItemsConvexAppBar;
  }
}

