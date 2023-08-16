import 'package:egitimax/models/question/questionPageModel.dart';
import 'package:egitimax/pages/question/questionList.dart';
import 'package:egitimax/utils/constant/appConstants.dart';

import 'package:egitimax/utils/provider/imager.dart';
import 'package:flutter/material.dart';

class QuestionQuestions extends StatefulWidget {
  QuestionQuestions(
      {super.key,
      required this.mo});

  QuestionPageModel mo;

  @override
  State<QuestionQuestions> createState() => _QuestionQuestionsState();
}

class _QuestionQuestionsState extends State<QuestionQuestions> {
  bool floating = false;
  bool pinned = false;
  bool snap = false;



  @override
  void initState() {
    super.initState();

    if (AppConstants.questionPageDebugPrintActive == 1) {
      debugPrint("QuestionQuestions_initState");
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (AppConstants.questionPageDebugPrintActive == 1) {
      debugPrint("QuestionQuestions_build");
    }
    GlobalKey<ScaffoldState> questionQuestionsKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: questionQuestionsKey,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: widget.mo.theme.colorScheme.background,
            foregroundColor: widget.mo.theme.colorScheme.secondary,
            shadowColor: widget.mo.theme.colorScheme.shadow,
            surfaceTintColor: widget.mo.theme.colorScheme.surface,
            actions: [
              IconButton(
                icon: Icon(Icons.settings, size: widget.mo.theme.iconTheme.size),
                onPressed: () {
                  questionQuestionsKey.currentState?.openEndDrawer();
                },
              ),
            ],
            automaticallyImplyLeading: false,
            pinned: pinned,
            snap: snap,
            floating: floating,
            expandedHeight: kToolbarHeight * 3,
            flexibleSpace: FutureBuilder(
              future: Future.delayed(const Duration(seconds: 0), () {
                return Imager.get(
                    'https://www.shutterstock.com/image-illustration/infinite-question-marks-one-out-260nw-761999845.jpg');
              }),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text('Error loading image'),
                  );
                } else {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: snapshot.data!,
                        fit: BoxFit.cover,
                      ),
                      color: widget.mo.theme.colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                widget.mo.currentTitle ?? '',
                                style: widget.mo.theme.textTheme.titleMedium,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(5.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width,
                        minHeight: MediaQuery.of(context).size.height,
                      ),
                      child: getBody(),
                    ),
                  );
                },
                childCount: 1,
              ),
            ),
          ),
        ],
      ),
      endDrawer: getDrawer(),
    );
  }

  Widget getBody() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: QuestionList(
        currentPage: widget.mo.currentPage,
        currentPerPage: widget.mo.currentPerPage,
        selectedItems: widget.mo.selectedItems ?? [],
        onChangedSelectedItems: (newSelectedItems) {
          widget.mo.selectedItems = newSelectedItems;
          dynamic questionId = newSelectedItems.isNotEmpty ? newSelectedItems[0]["Id"] : BigInt.zero;
          widget.mo.questionId=questionId;
        },
        settings: (int newCurrentPerPage, int newCurrentPage) {
          widget.mo.currentPerPage = newCurrentPerPage;
          widget.mo.currentPage = newCurrentPage;
        },
        userId: BigInt.parse(widget.mo.userId.toString()),
      ),
    );
  }

  Drawer getDrawer() {
    double transformScale = double.parse(widget.mo.theme.iconTheme.size != null &&
            widget.mo.theme.iconTheme.size != 0
        ? (widget.mo.theme.iconTheme.size! / (widget.mo.theme.iconTheme.size! * 1.5))
            .toString()
        : 1.toString());
    var endDrawerScaffold = Drawer(
      width: double.infinity,
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.close, size: widget.mo.theme.iconTheme.size),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            ListTile(
              titleTextStyle: widget.mo.theme.textTheme.titleMedium,
              subtitleTextStyle: widget.mo.theme.textTheme.titleSmall,
              leading: Transform.scale(
                scale: transformScale,
                child: Switch(
                  value: floating,
                  onChanged: (value) {
                    setState(() {
                      snap = value;
                      floating = value;
                    });
                  },
                ),
              ),
              title:
                  Text('Floating', style: widget.mo.theme.textTheme.titleMedium),
            ),
            ListTile(
              titleTextStyle: widget.mo.theme.textTheme.titleMedium,
              subtitleTextStyle: widget.mo.theme.textTheme.titleSmall,
              leading: Transform.scale(
                scale: transformScale,
                child: Switch(
                  value: pinned,
                  onChanged: (value) {
                    setState(() {
                      pinned = value;
                    });
                  },
                ),
              ),
              title: Text('Pinned', style: widget.mo.theme.textTheme.titleMedium),
            ),
            ListTile(
              titleTextStyle: widget.mo.theme.textTheme.titleMedium,
              subtitleTextStyle: widget.mo.theme.textTheme.titleSmall,
              leading: Transform.scale(
                scale: transformScale,
                child: Switch(
                  value: snap,
                  onChanged: (value) {
                    setState(() {
                      floating = value;
                      snap = value;
                    });
                  },
                ),
              ),
              title: Text('Snap', style: widget.mo.theme.textTheme.titleMedium),
            ),
            const Divider(),
          ],
        ),
      ),
    );
    return endDrawerScaffold;
  }
}
