import 'package:egitimax/pages/question/questionList.dart';
import 'package:egitimax/repositories/appRepository.dart';
import 'package:egitimax/utils/constant/appConstants.dart';
import 'package:egitimax/utils/helper/localeManager.dart';
import 'package:egitimax/utils/helper/routeManager.dart';

import 'package:egitimax/utils/provider/imager.dart';
import 'package:egitimax/utils/widget/deviceInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:responsive_table/responsive_table.dart';

class QuestionQuestions extends StatefulWidget {
  QuestionQuestions(
      {super.key,
      required this.title,
      required this.routeManager,
      required this.appRepository,
      required this.theme,
      required this.lang,
      required this.localeManager,
      required this.deviceType,
      required this.userId});

  String? currentTitle;
  final String title;
  final RouteManager routeManager;
  final AppRepository appRepository;
  final ThemeData theme;
  final AppLocalizations lang;
  final LocaleManager localeManager;
  final DeviceTypes deviceType;
  BigInt userId;

  @override
  State<QuestionQuestions> createState() => _QuestionQuestionsState();
}

class _QuestionQuestionsState extends State<QuestionQuestions> {
  bool floating = false;
  bool pinned = false;
  bool snap = false;

  late List<DatatableHeader> headers;
  late List<Map<String, dynamic>> source;
  late List<Map<String, dynamic>> selecteds;
  late bool showSelect;
  late List<Widget> footers;
  late String sortColumn;
  late bool sortAscending;
  late bool isLoading;
  late bool autoHeight;
  late Widget title;
  late List<Widget> actions;
  bool isSearch = false;

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
            backgroundColor: Theme.of(context).colorScheme.background,
            foregroundColor: Theme.of(context).colorScheme.secondary,
            shadowColor: Theme.of(context).colorScheme.shadow,
            surfaceTintColor: Theme.of(context).colorScheme.surface,
            actions: [
              IconButton(
                icon: Icon(Icons.settings, size: widget.theme.iconTheme.size),
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
                      color: widget.theme.colorScheme.primaryContainer,
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
                                widget.currentTitle ?? widget.title,
                                style: widget.theme.textTheme.titleMedium,
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
        userId: BigInt.parse(widget.userId.toString()),
      ),
    );
  }

  Drawer getDrawer() {
    double transformScale = double.parse(widget.theme.iconTheme.size != null &&
            widget.theme.iconTheme.size != 0
        ? (widget.theme.iconTheme.size! / (widget.theme.iconTheme.size! * 1.5))
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
                  icon: Icon(Icons.close, size: widget.theme.iconTheme.size),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            ListTile(
              titleTextStyle: widget.theme.textTheme.titleMedium,
              subtitleTextStyle: widget.theme.textTheme.titleSmall,
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
                  Text('Floating', style: widget.theme.textTheme.titleMedium),
            ),
            ListTile(
              titleTextStyle: widget.theme.textTheme.titleMedium,
              subtitleTextStyle: widget.theme.textTheme.titleSmall,
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
              title: Text('Pinned', style: widget.theme.textTheme.titleMedium),
            ),
            ListTile(
              titleTextStyle: widget.theme.textTheme.titleMedium,
              subtitleTextStyle: widget.theme.textTheme.titleSmall,
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
              title: Text('Snap', style: widget.theme.textTheme.titleMedium),
            ),
            const Divider(),
          ],
        ),
      ),
    );
    return endDrawerScaffold;
  }
}
