import 'package:egitimax/repositories/appRepository.dart';
import 'package:egitimax/utils/constant/appConstants.dart';
import 'package:egitimax/utils/helper/localeManager.dart';
import 'package:egitimax/utils/helper/routeManager.dart';
import 'package:egitimax/utils/provider/imager.dart';
import 'package:egitimax/utils/widget/deviceInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeMessages extends StatefulWidget {
   HomeMessages(
      {super.key,
        required this.title,
        required this.routeManager,
        required this.appRepository,
        required this.theme,
        required this.lang,
        required this.localeManager,
        required this.deviceType});

  String? currentTitle;
  final String title;
  final RouteManager routeManager;
  final AppRepository appRepository;
  final ThemeData theme;
  final AppLocalizations lang;
  final LocaleManager localeManager;
  final DeviceType deviceType;

  @override
  State<HomeMessages> createState() => _HomeMessagesState();
}

class _HomeMessagesState extends State<HomeMessages> {
  late SharedPreferences preferences;
  String currentPageName = 'HomeMessages';

  late ScrollController _scrollController;
  bool floating = false;
  bool pinned = false;
  bool snap = false;
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_toggleVisibility);
    if (AppConstants.homePageDebugPrintActive == 1) {
      debugPrint("HomeMessages_initState");
    }
    initializePreferences();
  }

  void overrideTitle(String newCurrentTitle) {
    setState(() {
      widget.currentTitle= newCurrentTitle;
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_toggleVisibility);
    _scrollController.dispose();
    super.dispose();
  }

  void _toggleVisibility() {
    setState(() {
      isVisible = _scrollController.position.userScrollDirection ==
          ScrollDirection.forward;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (AppConstants.homePageDebugPrintActive == 1) {
      debugPrint("HomeMessages_build");
    }
    GlobalKey<ScaffoldState> homeMessagesKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        key: homeMessagesKey,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Theme.of(context).colorScheme.background,
                foregroundColor: Theme.of(context).colorScheme.secondary,
                shadowColor: Theme.of(context).colorScheme.shadow,
                surfaceTintColor: Theme.of(context).colorScheme.surface,
                actions: [
                  IconButton(
                    icon:
                    Icon(Icons.settings, size: widget.theme.iconTheme.size),
                    onPressed: () {
                      homeMessagesKey.currentState?.openEndDrawer();
                    },
                  ),
                ],
                automaticallyImplyLeading: true,
                pinned: pinned,
                snap: snap,
                floating: floating,
                expandedHeight: kToolbarHeight * 3,
                flexibleSpace: FutureBuilder(
                  future: Future.delayed(const Duration(seconds: 0), () {
                    return Imager.get(AppConstants.appBarLargeLogoPath);
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
                            fit: BoxFit.scaleDown,
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
                                    widget.currentTitle??widget.title,
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
            ];
          },
          body: HomeMessagesBody(
            title: widget.lang.libPagesHomeHomePage_menu,
            routeManager: widget.routeManager,
            appRepository: widget.appRepository,
            theme: widget.theme,
            lang: widget.lang,
            localeManager: widget.localeManager,
            deviceType: widget.deviceType,
            overrideTitle: overrideTitle,
          ),
        ),
        endDrawer: getDrawer());
  }

  Future<void> initializePreferences() async {
    preferences = await SharedPreferences.getInstance();
    if (preferences != null) {
      if (preferences.containsKey('$currentPageName.floating')) {
        floating = preferences.getBool('$currentPageName.floating') ?? false;
      }
      if (preferences.containsKey('$currentPageName.pinned')) {
        floating = preferences.getBool('$currentPageName.pinned') ?? false;
      }
      if (preferences.containsKey('$currentPageName.snap')) {
        floating = preferences.getBool('$currentPageName.snap') ?? false;
      }
      if (preferences.containsKey('$currentPageName.isVisible')) {
        floating = preferences.getBool('$currentPageName.isVisible') ?? false;
      }
      setState(() {});
    }
  }

  Future<void> savePageLayout() async {
    await preferences.clear();
    await preferences.setBool('$currentPageName.floating', floating);
    await preferences.setBool('$currentPageName.pinned', pinned);
    await preferences.setBool('$currentPageName.snap', snap);
    await preferences.setBool('$currentPageName.isVisible', isVisible);
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
                    savePageLayout();
                  },
                ),
              ),
              title: Text(floating ? 'Floating' : 'Disabled Floating'),
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
                    savePageLayout();
                  },
                ),
              ),
              title: Text(pinned ? 'Pinned' : 'Disabled Pinned'),
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
                    savePageLayout();
                  },
                ),
              ),
              title: Text(snap ? 'Snap' : 'Disabled Snap'),
            ),
          ],
        ),
      ),
    );
    return endDrawerScaffold;
  }
}

class HomeMessagesBody extends StatefulWidget {
   HomeMessagesBody(
      {super.key,
        required this.title,
        required this.routeManager,
        required this.appRepository,
        required this.theme,
        required this.lang,
        required this.localeManager,
        required this.deviceType,
      this.overrideTitle});

  final String title;
  final RouteManager routeManager;
  final AppRepository appRepository;
  final ThemeData theme;
  final AppLocalizations lang;
  final LocaleManager localeManager;
  final DeviceType deviceType;
  final void Function(String newCurrentTitle)? overrideTitle;

  @override
  State<HomeMessagesBody> createState() => _HomeMessagesBody();
}

class _HomeMessagesBody extends State<HomeMessagesBody> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> homeMessagesBodyKey = GlobalKey<ScaffoldState>();
    return Center(
      key: homeMessagesBodyKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: _incrementCounter,
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
