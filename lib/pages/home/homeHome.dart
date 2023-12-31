import 'package:egitimax/models/common/userData.dart';
import 'package:egitimax/models/egitimax/egitimaxEntities.dart';
import 'package:egitimax/pages/login/loginPage.dart';
import 'package:egitimax/repositories/appRepository.dart';
import 'package:egitimax/utils/constant/appConstants.dart';
import 'package:egitimax/utils/helper/localeManager.dart';
import 'package:egitimax/utils/helper/routeManager.dart';
import 'package:egitimax/utils/provider/imager.dart';
import 'package:egitimax/utils/widget/deviceInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeHome extends StatefulWidget {
  HomeHome(
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
  final DeviceTypes deviceType;

  @override
  State<HomeHome> createState() => _HomeHomeState();
}

class _HomeHomeState extends State<HomeHome> {
  late SharedPreferences preferences;
  String currentPageName = 'HomeHome';

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
      debugPrint("HomeHome_initState");
    }
    initializePreferences();
    getx();
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
      debugPrint("HomeHome_build");
    }
    GlobalKey<ScaffoldState> homeHomeKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: homeHomeKey,
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
                  homeHomeKey.currentState?.openEndDrawer();
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
                      child: ChangeNotifierProvider(
                        create: (context) => UserData(),
                      child: LoginPage(),
                      ),
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

  Future<void> getx()
  async {
   // var r1=await widget.appRepository.getUser('info@egitimax.com',BigInt.parse('2'));
    //var r2=await widget.appRepository.getAllTblUserMain();
    //var r3=await widget.appRepository.getTblUserMain(2);

    //TblUserMain tblUserMain=TblUserMain(id: BigInt.parse('0'));
    //tblUserMain.id=BigInt.parse('0');
    //tblUserMain.name='test';
    //tblUserMain.email='ii@i.com';

    //var r4=await widget.appRepository.insertTblUserMain(tblUserMain);
    //r4.name='asdasd';
    //var r7=await widget.appRepository.updateTblUserMain(r4);
    //var r3=await widget.appRepository.deleteTblUserMain(BigInt.parse(r4.id.toString()));

    //var r5=await widget.appRepository.getQuestion(BigInt.parse('31'),'0',BigInt.parse('2'));

    int bekler=0;

  }
}
