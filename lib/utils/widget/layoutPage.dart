import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:egitimax/models/language/localeModel.dart';
import 'package:egitimax/utils/widget/deviceInfo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:country_flags/country_flags.dart';

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
    this.styleConvexAppBar,
    this.curveConvexAppBar,
    this.chipBuilderConvexAppBar,
    this.leadingAppBar,
    this.automaticallyImplyLeadingAppBar = true,
    this.titleAppBar,
    this.actionsAppBar,
    this.flexibleSpaceAppBar,
    this.bottomAppBar,
    this.elevationAppBar,
    this.scrolledUnderElevationAppBar,
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
  late LocaleModel localeModel;
  late DeviceType deviceType;

  final Widget? leadingAppBar;
  final bool automaticallyImplyLeadingAppBar;
  final Widget? titleAppBar;
  final List<Widget>? actionsAppBar;
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
  int _selectedTapIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedTapIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.theme = Theme.of(context);
    widget.lang = AppLocalizations.of(context)!;
    widget.localeModel = Provider.of<LocaleModel>(context, listen: false);
    widget.deviceType = DeviceInfo().getDeviceType();

    var logoWidthFactor = (widget.deviceType == DeviceType.web ||
            MediaQuery.of(context).size.width > 500
        ? 3.9
        : 1);

    if (widget.itemsConvexAppBar == null || widget.itemsConvexAppBar!.isEmpty) {
      widget.itemsConvexAppBar = [
        const TabItem(icon: Icons.home, title: 'Home'),
      ];
    }

    if (widget.tapPageItemsConvexAppBar == null ||
        widget.tapPageItemsConvexAppBar!.isEmpty) {
      widget.tapPageItemsConvexAppBar = [Container()];
    }

    return Scaffold(
      appBar: widget.appBarScaffold ?? AppBar(
        leading: widget.leadingAppBar ??
            Builder(
              builder: (BuildContext context) {
                return Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  constraints: BoxConstraints(
                    maxHeight: kToolbarHeight,
                    maxWidth: (kToolbarHeight * logoWidthFactor),
                  ),
                  decoration: BoxDecoration(
                    shape: logoWidthFactor == 1
                        ? BoxShape.rectangle
                        : BoxShape.rectangle,
                    image: DecorationImage(
                      image: AssetImage(logoWidthFactor == 1
                          ? 'assets/images/egitimaxLogo.png'
                          : 'assets/images/egitimaxOld.png'),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                );
              },
            ),
        automaticallyImplyLeading: widget.automaticallyImplyLeadingAppBar,
        title: widget.titleAppBar,
        actions: widget.actionsAppBar,
        flexibleSpace: widget.flexibleSpaceAppBar,
        bottom: widget.bottomAppBar,
        elevation: widget.elevationAppBar ?? 4,
        scrolledUnderElevation:
        widget.scrolledUnderElevationAppBar ?? double.infinity,
        notificationPredicate: widget.notificationPredicateAppBar,
        shadowColor: widget.shadowColorAppBar,
        surfaceTintColor: widget.surfaceTintColorAppBar,
        shape: widget.shapeAppBar,
        backgroundColor: widget.backgroundColorAppBar ??
            widget.theme.colorScheme.inversePrimary,
        foregroundColor: widget.foregroundColorAppBar,
        iconTheme: widget.iconThemeAppBar,
        actionsIconTheme: widget.actionsIconThemeAppBar,
        primary: widget.primaryAppBar,
        centerTitle: widget.centerTitleAppBar ?? false,
        excludeHeaderSemantics: widget.excludeHeaderSemanticsAppBar,
        titleSpacing: widget.titleSpacingAppBar,
        toolbarOpacity: widget.toolbarOpacityAppBar,
        bottomOpacity: widget.bottomOpacityAppBar,
        toolbarHeight: widget.toolbarHeightAppBar ?? kToolbarHeight,
        leadingWidth:
        widget.leadingWidthAppBar ?? (kToolbarHeight * logoWidthFactor),
        toolbarTextStyle: widget.toolbarTextStyleAppBar,
        titleTextStyle: widget.titleTextStyleAppBar,
        systemOverlayStyle: widget.systemOverlayStyleAppBar,
        forceMaterialTransparency:
        widget.forceMaterialTransparencyAppBar ?? false,
        clipBehavior: widget.clipBehaviorAppBar,
      ),
      body: widget.bodyScaffold?? Center(
        child: widget.tapPageItemsConvexAppBar!.elementAt(
            widget.tapPageItemsConvexAppBar!.length ==
                widget.itemsConvexAppBar!.length
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
      endDrawer: widget.endDrawerScaffold,
      onEndDrawerChanged: widget.onEndDrawerChangedScaffold,
      bottomNavigationBar: widget.bottomNavigationBarScaffold??ConvexAppBar(
        items: widget.itemsConvexAppBar!,
        initialActiveIndex: widget.initialActiveIndexConvexAppBar,
        disableDefaultTabController:
        widget.disableDefaultTabControllerConvexAppBar,
        onTap: (index) {
          _onItemTapped(index);
          if (widget.onTapConvexAppBar != null) {
            widget.onTapConvexAppBar!(index);
          }
        },
        onTabNotify: widget.onTabNotifyConvexAppBar,
        controller: widget.controllerConvexAppBar,
        color: widget.colorConvexAppBar,
        activeColor: widget.activeColorConvexAppBar,
        backgroundColor: widget.backgroundColorConvexAppBar ??
            widget.theme.colorScheme.inversePrimary,
        shadowColor: widget.shadowColorConvexAppBar,
        gradient: widget.gradientConvexAppBar,
        height: widget.heightConvexAppBar,
        curveSize: widget.curveSizeConvexAppBar,
        top: widget.topConvexAppBar,
        elevation: widget.elevationConvexAppBar,
        cornerRadius: widget.cornerRadiusConvexAppBar,
        style: widget.styleConvexAppBar,
        curve: widget.curveConvexAppBar,
        chipBuilder: widget.chipBuilderConvexAppBar,
      ),
      bottomSheet: widget.bottomSheetScaffold,
      backgroundColor: widget.backgroundColorScaffold,
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInsetScaffold??true,
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
