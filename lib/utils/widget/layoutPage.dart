import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:egitimax/utils/helper/localeManager.dart';
import 'package:egitimax/pages/home/homePage.dart';
import 'package:egitimax/utils/constant/appConstants.dart';
import 'package:egitimax/utils/provider/logoImageProvider.dart';
import 'package:egitimax/utils/provider/userImageDrawerItemProvider.dart';
import 'package:egitimax/utils/widget/deviceInfo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class LayoutPage extends StatefulWidget {
  LayoutPage({
    Key? key,
    this.tapPageItemsConvexAppBar,
    this.itemsConvexAppBar,
    this.initialActiveIndexConvexAppBar,
    this.disableDefaultTabControllerConvexAppBar,
    this.onTapConvexAppBar,
    this.onTabNotifyConvexAppBar,
    this.controllerConvexAppBar,
    this.colorConvexAppBar,
    this.activeColorConvexAppBar,
    this.backgroundColorConvexAppBar,
    this.shadowColorConvexAppBar,
    this.gradientConvexAppBar,
    this.heightConvexAppBar,
    this.curveSizeConvexAppBar,
    this.topConvexAppBar,
    this.elevationConvexAppBar,
    this.cornerRadiusConvexAppBar,
    this.styleConvexAppBar = AppConstants.convexAppBarStyle,
    this.curveConvexAppBar,
    this.chipBuilderConvexAppBar,
    this.leadingAppBar,
    this.automaticallyImplyLeadingAppBar = true,
    this.titleAppBar,
    this.actionsAppBar,
    this.flexibleSpaceAppBar,
    this.bottomAppBar,
    this.elevationAppBar = 4,
    this.scrolledUnderElevationAppBar=0.0,
    this.notificationPredicateAppBar = defaultScrollNotificationPredicate,
    this.shadowColorAppBar,
    this.surfaceTintColorAppBar,
    this.shapeAppBar,
    this.backgroundColorAppBar,
    this.foregroundColorAppBar,
    this.iconThemeAppBar,
    this.actionsIconThemeAppBar,
    this.primaryAppBar = true,
    this.centerTitleAppBar,
    this.excludeHeaderSemanticsAppBar = false,
    this.titleSpacingAppBar,
    this.toolbarOpacityAppBar = 1.0,
    this.bottomOpacityAppBar = 1.0,
    this.toolbarHeightAppBar,
    this.leadingWidthAppBar,
    this.toolbarTextStyleAppBar,
    this.titleTextStyleAppBar,
    this.systemOverlayStyleAppBar,
    this.forceMaterialTransparencyAppBar = false,
    this.clipBehaviorAppBar,
    this.appBarScaffold,
    this.bodyScaffold,
    this.floatingActionButtonScaffold,
    this.floatingActionButtonLocationScaffold,
    this.floatingActionButtonAnimatorScaffold,
    this.persistentFooterButtonsScaffold,
    this.persistentFooterAlignmentScaffold = AlignmentDirectional.centerEnd,
    this.drawerScaffold,
    this.onDrawerChangedScaffold,
    this.endDrawerScaffold,
    this.onEndDrawerChangedScaffold,
    this.bottomNavigationBarScaffold,
    this.bottomSheetScaffold,
    this.backgroundColorScaffold,
    this.resizeToAvoidBottomInsetScaffold,
    this.primaryScaffold = true,
    this.drawerDragStartBehaviorScaffold = DragStartBehavior.start,
    this.extendBodyScaffold = false,
    this.extendBodyBehindAppBarScaffold = false,
    this.drawerScrimColorScaffold,
    this.drawerEdgeDragWidthScaffold,
    this.drawerEnableOpenDragGestureScaffold = true,
    this.endDrawerEnableOpenDragGestureScaffold = true,
    this.restorationIdScaffold,
  }) : super(key: key);

  late ThemeData theme;
  late AppLocalizations lang;
  late LocaleManager localeManager;
  late DeviceType deviceType;

  final Widget? leadingAppBar;
  final bool automaticallyImplyLeadingAppBar;
  final Widget? titleAppBar;
  List<Widget>? actionsAppBar;
  final Widget? flexibleSpaceAppBar;
  final PreferredSizeWidget? bottomAppBar;
  final double? elevationAppBar;
  final double? scrolledUnderElevationAppBar;
  final bool Function(ScrollNotification) notificationPredicateAppBar;
  final Color? shadowColorAppBar;
  final Color? surfaceTintColorAppBar;
  final ShapeBorder? shapeAppBar;
  final Color? backgroundColorAppBar;
  final Color? foregroundColorAppBar;
  final IconThemeData? iconThemeAppBar;
  final IconThemeData? actionsIconThemeAppBar;
  final bool primaryAppBar;
  final bool? centerTitleAppBar;
  final bool excludeHeaderSemanticsAppBar;
  final double? titleSpacingAppBar;
  final double toolbarOpacityAppBar;
  final double bottomOpacityAppBar;
  final double? toolbarHeightAppBar;
  final double? leadingWidthAppBar;
  final TextStyle? toolbarTextStyleAppBar;
  final TextStyle? titleTextStyleAppBar;
  final SystemUiOverlayStyle? systemOverlayStyleAppBar;
  final bool forceMaterialTransparencyAppBar;
  final Clip? clipBehaviorAppBar;

  List<Widget>? tapPageItemsConvexAppBar;
  List<TabItem<dynamic>>? itemsConvexAppBar;
  final int? initialActiveIndexConvexAppBar;
  final bool? disableDefaultTabControllerConvexAppBar;
  final void Function(int)? onTapConvexAppBar;
  final bool Function(int)? onTabNotifyConvexAppBar;
  final TabController? controllerConvexAppBar;
  final Color? colorConvexAppBar;
  final Color? activeColorConvexAppBar;
  final Color? backgroundColorConvexAppBar;
  final Color? shadowColorConvexAppBar;
  final Gradient? gradientConvexAppBar;
  final double? heightConvexAppBar;
  final double? curveSizeConvexAppBar;
  final double? topConvexAppBar;
  final double? elevationConvexAppBar;
  final double? cornerRadiusConvexAppBar;
  final TabStyle? styleConvexAppBar;
  final Curve? curveConvexAppBar;
  final ChipBuilder? chipBuilderConvexAppBar;

  PreferredSizeWidget? appBarScaffold;
  Widget? bodyScaffold;
  Widget? floatingActionButtonScaffold;
  FloatingActionButtonLocation? floatingActionButtonLocationScaffold;
  FloatingActionButtonAnimator? floatingActionButtonAnimatorScaffold;
  List<Widget>? persistentFooterButtonsScaffold;
  AlignmentDirectional persistentFooterAlignmentScaffold;
  Widget? drawerScaffold;
  void Function(bool)? onDrawerChangedScaffold;
  Widget? endDrawerScaffold;
  void Function(bool)? onEndDrawerChangedScaffold;
  Widget? bottomNavigationBarScaffold;
  Widget? bottomSheetScaffold;
  Color? backgroundColorScaffold;
  bool? resizeToAvoidBottomInsetScaffold;
  bool primaryScaffold;
  DragStartBehavior drawerDragStartBehaviorScaffold;
  bool extendBodyScaffold;

  bool extendBodyBehindAppBarScaffold;
  Color? drawerScrimColorScaffold;
  double? drawerEdgeDragWidthScaffold;
  bool drawerEnableOpenDragGestureScaffold;

  bool endDrawerEnableOpenDragGestureScaffold;

  String? restorationIdScaffold;

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  List<Widget>? tapPageItemsConvexAppBar;
  List<TabItem<dynamic>>? itemsConvexAppBar;
  List<Widget>? actionsAppBar;
  Widget? endDrawerScaffold;

  int _selectedTapIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedTapIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedTapIndex=widget.initialActiveIndexConvexAppBar??0;
  }

  @override
  Widget build(BuildContext context) {
    widget.theme = Theme.of(context);
    widget.lang = AppLocalizations.of(context)!;
    widget.localeManager = Provider.of<LocaleManager>(context, listen: false);
    widget.deviceType = DeviceInfo(context).getDeviceType();

    var logoWidthFactor = (widget.deviceType == DeviceType.web &&
            MediaQuery.of(context).size.width >
                AppConstants.appBarMobilScreenWidthLimitSize
        ? AppConstants.appBarLogoRatio
        : 1);

    if (widget.itemsConvexAppBar == null || widget.itemsConvexAppBar!.isEmpty) {
      itemsConvexAppBar = [
         TabItem(icon: Icons.arrow_back, title: widget.lang.libUtilsWidgetLayoutPage_back),
      ];
    }

    if (widget.tapPageItemsConvexAppBar == null ||
        widget.tapPageItemsConvexAppBar!.isEmpty) {
      tapPageItemsConvexAppBar = [Container()];
    }

    var userImageContainer = Builder(
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {
            Scaffold.of(context).openEndDrawer();
          },
          child: Opacity(
            opacity: 0.8,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(AppConstants.appBarUserImageMargin),
              constraints:  BoxConstraints(
                maxHeight: kToolbarHeight*AppConstants.appBarUserImageSizeCorrectionFactor ??1,
                maxWidth: kToolbarHeight*AppConstants.appBarUserImageSizeCorrectionFactor ??1,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.theme.colorScheme.primary,
              ),
              padding: const EdgeInsets.all(1.0),
              child: CircleAvatar(
                radius: 75,
                backgroundImage: UserImageDrawerItemProvider.getUserImage(
                    AppConstants.appBarUserImagePath),
              ),
            ),
          ),
        );
      },
    );
    var logoContainer = Builder(
      builder: (BuildContext context) {
        return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
            child: Opacity(
              opacity: 1,
              child: Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.all(AppConstants.appBarLogoMargin),
                constraints: BoxConstraints(
                  maxHeight: kToolbarHeight*AppConstants.appBarLogoSizeCorrectionFactor ??1,
                  maxWidth: (kToolbarHeight * logoWidthFactor)*AppConstants.appBarLogoSizeCorrectionFactor ??1,
                ),
                decoration: BoxDecoration(
                  shape: logoWidthFactor == 1
                      ? BoxShape.rectangle
                      : BoxShape.rectangle,
                  image: DecorationImage(
                    image: LogoImageProvider.getLogoImage(logoWidthFactor == 1
                        ? AppConstants.appBarSmallLogoPath
                        : AppConstants.appBarLargeLogoPath),
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ));
      },
    );

    if (widget.actionsAppBar == null || widget.actionsAppBar!.isEmpty) {
      if (AppConstants.appBarKeepRootActions == 1) {
        actionsAppBar = [userImageContainer];
      }
    } else {
      actionsAppBar = List<Widget>.empty(growable: true);
      for (var element in widget.actionsAppBar!) {
        if (element is Widget) {
          actionsAppBar!.add(element);
        }
      }
      if (AppConstants.appBarKeepRootActions == 1) {
        actionsAppBar!.add(userImageContainer);
      }
    }
    if (AppConstants.appBarReverseRootActions == 1 &&
        actionsAppBar != null &&
        actionsAppBar!.isNotEmpty) {
      var newActionsAppBar = actionsAppBar!.reversed.toList();

      actionsAppBar = newActionsAppBar;
    }



    List<ListTile> userImageDrawerListTileItems = List.empty(growable: true);
    UserImageDrawerItemProvider userImageDrawerItemProvider =
        UserImageDrawerItemProvider(context);
    userImageDrawerListTileItems = AppConstants.scaffoldKeepRootDrawer == 1
        ? (userImageDrawerItemProvider.getUserImageDrawerItems() ??
            List<ListTile>.empty(growable: true))
        : List<ListTile>.empty(growable: true);

    if (widget.endDrawerScaffold != null) {
      if (widget.endDrawerScaffold! is Column) {
        Column existingListTilesContainer = (widget.endDrawerScaffold! as Column);

        List<ListTile> incomingListTiles = List.empty(growable: true);
        if (existingListTilesContainer.children.isNotEmpty) {
          existingListTilesContainer.children!.forEach((listTile) {
            if (listTile! is ListTile) {
              incomingListTiles.add((listTile as ListTile));
            }
          });
        }

        if (incomingListTiles.isNotEmpty) {
          userImageDrawerListTileItems.addAll(incomingListTiles);
        }
      }
    }

    if (AppConstants.scaffoldReverseRootDrawer == 1 &&
        userImageDrawerListTileItems != null &&
        userImageDrawerListTileItems!.isNotEmpty) {
      var newUserImageDrawerListTileItems =
          userImageDrawerListTileItems!.reversed.toList();

      userImageDrawerListTileItems = newUserImageDrawerListTileItems;
    }

    var userImageDrawer = Drawer(
      child: SafeArea(
        child: Column(
          children: userImageDrawerListTileItems,
        ),
      ),
    );

    if (widget.endDrawerScaffold is! Drawer) {
      widget.endDrawerScaffold = userImageDrawer;
    }

    endDrawerScaffold = userImageDrawer;


    return Scaffold(
      appBar: widget.appBarScaffold ??
          AppBar(
            leading: widget.leadingAppBar ?? logoContainer,
            automaticallyImplyLeading: widget.automaticallyImplyLeadingAppBar,
            title: widget.titleAppBar,
            actions: actionsAppBar,
            flexibleSpace: widget.flexibleSpaceAppBar,
            bottom: widget.bottomAppBar,
            elevation:
                widget.elevationAppBar == null || widget.elevationAppBar! < 0
                    ? 0
                    : widget.elevationAppBar,
            scrolledUnderElevation:
                widget.scrolledUnderElevationAppBar ?? double.infinity,
            notificationPredicate: widget.notificationPredicateAppBar,
            shadowColor:
                widget.shadowColorAppBar ?? widget.theme.colorScheme.shadow,
            surfaceTintColor: widget.surfaceTintColorAppBar ??
                widget.theme.colorScheme.surface,
            shape: widget.shapeAppBar,
            backgroundColor: widget.backgroundColorAppBar ??
                widget.theme.colorScheme.background,
            foregroundColor: widget.foregroundColorAppBar ??
                widget.theme.colorScheme.secondary,
            iconTheme: widget.iconThemeAppBar,
            actionsIconTheme: widget.actionsIconThemeAppBar,
            primary: widget.primaryAppBar,
            centerTitle: widget.centerTitleAppBar ?? false,
            excludeHeaderSemantics: widget.excludeHeaderSemanticsAppBar,
            titleSpacing: widget.titleSpacingAppBar ?? 0,
            toolbarOpacity: widget.toolbarOpacityAppBar,
            bottomOpacity: widget.bottomOpacityAppBar,
            toolbarHeight: widget.toolbarHeightAppBar ?? kToolbarHeight,
            leadingWidth: widget.leadingWidthAppBar ?? kToolbarHeight*logoWidthFactor,
            toolbarTextStyle: widget.toolbarTextStyleAppBar,
            titleTextStyle: widget.titleTextStyleAppBar,
            systemOverlayStyle: widget.systemOverlayStyleAppBar,
            forceMaterialTransparency:
                widget.forceMaterialTransparencyAppBar ?? false,
            clipBehavior: widget.clipBehaviorAppBar,
          ),
      body: widget.bodyScaffold ??
          Center(
            child: (widget.tapPageItemsConvexAppBar ??
                    tapPageItemsConvexAppBar)!
                .elementAt((widget.tapPageItemsConvexAppBar ??
                                tapPageItemsConvexAppBar)!
                            .length ==
                        (widget.itemsConvexAppBar ?? itemsConvexAppBar)!.length
                    ? _selectedTapIndex
                    : 0),
          ),
      floatingActionButton: widget.floatingActionButtonScaffold,
      floatingActionButtonLocation: widget.floatingActionButtonLocationScaffold,
      floatingActionButtonAnimator: widget.floatingActionButtonAnimatorScaffold,
      persistentFooterButtons: widget.persistentFooterButtonsScaffold,
      persistentFooterAlignment: widget.persistentFooterAlignmentScaffold,
      drawer: widget.drawerScaffold,
      onDrawerChanged: widget.onDrawerChangedScaffold,
      endDrawer: widget.endDrawerScaffold ?? endDrawerScaffold,
      onEndDrawerChanged: widget.onEndDrawerChangedScaffold,
      bottomNavigationBar: widget.bottomNavigationBarScaffold ??
          StyleProvider(
            style: Style(),
            child: ConvexAppBar(
              items: widget.itemsConvexAppBar ?? itemsConvexAppBar!,
              initialActiveIndex: widget.initialActiveIndexConvexAppBar,
              disableDefaultTabController:
                  widget.disableDefaultTabControllerConvexAppBar,
              onTap: (index) {
                _onItemTapped(index);
                if (widget.onTapConvexAppBar != null) {
                  if (widget.itemsConvexAppBar == null ||
                      widget.itemsConvexAppBar!.isEmpty) {
                    if (index == 0) {
                      widget.onTapConvexAppBar!(
                          -1); // Hiç bir item yoksa goback olması için
                    } else {
                      widget.onTapConvexAppBar!(index);
                    }
                  } else {
                    widget.onTapConvexAppBar!(index);
                  }
                }
              },
              onTabNotify: widget.onTabNotifyConvexAppBar,
              controller: widget.controllerConvexAppBar,
              color:
                  widget.colorConvexAppBar ?? widget.theme.colorScheme.primary,
              activeColor: widget.activeColorConvexAppBar ??
                  widget.theme.colorScheme.secondary,
              backgroundColor: widget.backgroundColorConvexAppBar ??
                  widget.theme.colorScheme.surface,
              shadowColor: widget.shadowColorConvexAppBar ??
                  widget.theme.colorScheme.shadow,
              gradient: widget.gradientConvexAppBar,
              height: widget.heightConvexAppBar ?? kToolbarHeight,
              curveSize: widget.curveSizeConvexAppBar,
              top: widget.topConvexAppBar,
              elevation: widget.elevationConvexAppBar,
              cornerRadius: widget.cornerRadiusConvexAppBar,
              style: widget.styleConvexAppBar,
              curve: widget.curveConvexAppBar,
              chipBuilder: widget.chipBuilderConvexAppBar,
            ),
          ),
      bottomSheet: widget.bottomSheetScaffold,
      backgroundColor: widget.backgroundColorScaffold,
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInsetScaffold ?? true,
      primary: widget.primaryScaffold,
      drawerDragStartBehavior: widget.drawerDragStartBehaviorScaffold,
      extendBody: widget.extendBodyScaffold,
      extendBodyBehindAppBar: widget.extendBodyBehindAppBarScaffold,
      drawerScrimColor: widget.drawerScrimColorScaffold,
      drawerEdgeDragWidth: widget.drawerEdgeDragWidthScaffold,
      drawerEnableOpenDragGesture: widget.drawerEnableOpenDragGestureScaffold,
      endDrawerEnableOpenDragGesture:
          widget.endDrawerEnableOpenDragGestureScaffold,
      restorationId: widget.restorationIdScaffold,
    );
  }
}

class Style extends StyleHook {
  @override
  double get activeIconSize => AppConstants.convexAppBarStyleActiveIconSize;

  @override
  double get activeIconMargin => AppConstants.convexAppBarStyleActiveIconMargin;

  @override
  double get iconSize => AppConstants.convexAppBarStyleIconSize;

  @override
  TextStyle textStyle(Color color, String? fontFamily) {
    return TextStyle(
        fontSize: AppConstants.convexAppBarStyleFontSize, color: color);
  }
}
