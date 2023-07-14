import 'package:egitimax/models/common/drawerItem.dart';
import 'package:egitimax/models/language/localeModel.dart';
import 'package:egitimax/repositories/appRepository.dart';
import 'package:egitimax/utils/constant/appConstants.dart';
import 'package:egitimax/utils/helper/routeManager.dart';
import 'package:egitimax/utils/widget/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class LayoutPage extends StatefulWidget {
  LayoutPage(
      {Key? key,
      required this.title,
      this.setState,
      this.appBarActions,
      this.appBarBottom,
      this.body,
      this.drawerItems,
      this.floatingActionButton})
      : super(key: key);

  String title = '';
  List<Widget>? appBarActions;
  PreferredSizeWidget? appBarBottom;
  Widget? body = Container();
  Widget? floatingActionButton = Container();
  List<DrawerItem>? drawerItems;
  final void Function(bool)? setState;

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  final RouteManager routeManager = RouteManager();
  final AppRepository appRepository = AppRepository();

  @override
  void initState() {
    super.initState();
  }

  void _changeLanguage(BuildContext context) {
    LocaleModel localeModel = Provider.of<LocaleModel>(context, listen: false);
    const supportedLocales = AppLocalizations.supportedLocales;
    final currentLocale = localeModel.locale;
    final currentIndex = supportedLocales.indexOf(currentLocale);
    final nextIndex = (currentIndex + 1) % supportedLocales.length;
    final nextLocale = supportedLocales[nextIndex];
    localeModel.changeLocale(nextLocale);
  }

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;
    final localeModel = Provider.of<LocaleModel>(context, listen: false);
    var theme = Theme.of(context);

    var appBarActions = [
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: TextButton.icon(
          onPressed: () {
            _changeLanguage(context);
          },
          icon: const Icon(Icons.language_outlined),
          label: Text(
            localeModel.locale.toString().toUpperCase(),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          constraints: const BoxConstraints(
            maxHeight: kToolbarHeight,
            maxWidth: kToolbarHeight * 3.29, // Width matches the maximum height
          ),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/EgitimaxLogo.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    ];
    var floatingActionButtons = Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: FloatingActionButton(
              heroTag: 'message_showMessage_iconText',
              onPressed: () {
                Message.showMessage(
                  context,
                  title: const Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('User Message'),
                    ],
                  ),
                  content: const Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('This is a test message.'),
                    ],
                  ),
                );
              },
              tooltip: lang.message_showMessage_iconText,
              child: const Icon(
                Icons.info,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: FloatingActionButton(
              heroTag: 'message_showInformationalMessage_iconText',
              onPressed: () {
                Message.showInformationalMessage(
                  context,
                  title: const Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('User Message'),
                    ],
                  ),
                  content: const Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('This is a test message.'),
                    ],
                  ),
                );
              },
              tooltip: lang.message_showInformationalMessage_iconText,
              child: const Icon(
                Icons.info,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: FloatingActionButton(
              heroTag: 'message_showWarningMessage_iconText',
              onPressed: () {
                Message.showWarningMessage(
                  context,
                  title: const Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('User Message'),
                    ],
                  ),
                  content: const Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('This is a test message.'),
                    ],
                  ),
                );
              },
              tooltip: lang.message_showWarningMessage_iconText,
              child: const Icon(
                Icons.warning,
                color: Colors.redAccent,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: FloatingActionButton(
              heroTag: 'message_showRequestMessage_iconText',
              onPressed: () {
                Message.showRequestMessage(
                  context,
                  title: const Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('User Message'),
                    ],
                  ),
                  content: const Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('This is a test message.'),
                    ],
                  ),
                );
              },
              tooltip: lang.message_showRequestMessage_iconText,
              child: const Icon(
                Icons.task,
                color: Colors.amber,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: FloatingActionButton(
              heroTag: 'message_showConfirmationMessage_iconText',
              onPressed: () {
                Message.showConfirmationMessage(
                  context,
                  title: const Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('User Message'),
                    ],
                  ),
                  content: const Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('This is a test message.'),
                    ],
                  ),
                );
              },
              tooltip: lang.message_showConfirmationMessage_iconText,
              child: const Icon(
                Icons.checklist_outlined,
                color: Colors.deepPurpleAccent,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: FloatingActionButton(
              heroTag: 'message_showErrorMessage_iconText',
              onPressed: () {
                Message.showErrorMessage(
                  context,
                  title: const Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('User Message'),
                    ],
                  ),
                  content: const Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('This is a test message.'),
                    ],
                  ),
                );
              },
              tooltip: lang.message_showErrorMessage_iconText,
              child: const Icon(
                Icons.error_outline,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
    var drawerItems = [
      DrawerItem(
        leading: const Icon(Icons.translate),
        item:Text( '${lang.changeLanguage} (${Provider.of<LocaleModel>(context, listen: false).locale.toString().toUpperCase()})',),
        onTap: (context) {
          _changeLanguage(context);
        },
      ),
      // Add other DrawerItem objects here
    ];

    if (widget.drawerItems == null) {
      widget.drawerItems = List.empty(growable: true);
      widget.drawerItems!.addAll(drawerItems);
    } else {
      widget.drawerItems!.addAll(drawerItems);
    }

    var drawer = Drawer(
      backgroundColor: theme.colorScheme.inversePrimary,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: theme.primaryColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      lang.drawerTitle,
                      style: theme.textTheme.headlineSmall!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          for (var item in widget.drawerItems!)
            ListTile(
              leading: item.leading,
              title:   item.item,
              onTap: () {
                item.onTap?.call(context);
              },
            ),
        ],
      ),
    );

    Widget floatingActionButtonsRoot;
    if (widget.floatingActionButton != null) {
      if (AppConstants.floatingActionButtonAddToExisting == 1) {
        floatingActionButtonsRoot = Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: FloatingActionButton(
                  heroTag: 'message_showMessage_iconText',
                  onPressed: () {
                    Message.showMessage(
                      context,
                      title: const Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('User Message'),
                        ],
                      ),
                      content: const Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('This is a test message.'),
                        ],
                      ),
                    );
                  },
                  tooltip: lang.message_showMessage_iconText,
                  child: const Icon(
                    Icons.info,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: FloatingActionButton(
                  heroTag: 'message_showInformationalMessage_iconText',
                  onPressed: () {
                    Message.showInformationalMessage(
                      context,
                      title: const Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('User Message'),
                        ],
                      ),
                      content: const Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('This is a test message.'),
                        ],
                      ),
                    );
                  },
                  tooltip: lang.message_showInformationalMessage_iconText,
                  child: const Icon(
                    Icons.info,
                    color: Colors.blue,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: FloatingActionButton(
                  heroTag: 'message_showWarningMessage_iconText',
                  onPressed: () {
                    Message.showWarningMessage(
                      context,
                      title: const Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('User Message'),
                        ],
                      ),
                      content: const Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('This is a test message.'),
                        ],
                      ),
                    );
                  },
                  tooltip: lang.message_showWarningMessage_iconText,
                  child: const Icon(
                    Icons.warning,
                    color: Colors.redAccent,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: FloatingActionButton(
                  heroTag: 'message_showRequestMessage_iconText',
                  onPressed: () {
                    Message.showRequestMessage(
                      context,
                      title: const Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('User Message'),
                        ],
                      ),
                      content: const Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('This is a test message.'),
                        ],
                      ),
                    );
                  },
                  tooltip: lang.message_showRequestMessage_iconText,
                  child: const Icon(
                    Icons.task,
                    color: Colors.amber,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: FloatingActionButton(
                  heroTag: 'message_showConfirmationMessage_iconText',
                  onPressed: () {
                    Message.showConfirmationMessage(
                      context,
                      title: const Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('User Message'),
                        ],
                      ),
                      content: const Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('This is a test message.'),
                        ],
                      ),
                    );
                  },
                  tooltip: lang.message_showConfirmationMessage_iconText,
                  child: const Icon(
                    Icons.checklist_outlined,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: FloatingActionButton(
                  heroTag: 'message_showErrorMessage_iconText',
                  onPressed: () {
                    Message.showErrorMessage(
                      context,
                      title: const Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('User Message'),
                        ],
                      ),
                      content: const Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('This is a test message.'),
                        ],
                      ),
                    );
                  },
                  tooltip: lang.message_showErrorMessage_iconText,
                  child: const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                  ),
                ),
              ),
              widget.floatingActionButton ?? Container()
            ],
          ),
        );
      } else {
        floatingActionButtonsRoot = widget.floatingActionButton ?? Container();
      }
    } else {
      floatingActionButtonsRoot = floatingActionButtons;
    }

    List<Widget> appBarActionsRoot = List.empty(growable: true);
    if (widget.appBarActions != null) {
      if (AppConstants.appBarActionsAddToExisting == 1) {
        appBarActionsRoot.addAll(appBarActions);
        appBarActionsRoot.add(Padding(
          padding: const EdgeInsets.all(5.0),
          child: TextButton.icon(
            onPressed: () {
              _changeLanguage(context);
            },
            icon: const Icon(Icons.language_outlined),
            label: Text(
              localeModel.locale.toString().toUpperCase(),
            ),
          ),
        ));
        appBarActionsRoot.add(Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            constraints: const BoxConstraints(
              maxHeight: kToolbarHeight,
              maxWidth:
                  kToolbarHeight * 3.29, // Width matches the maximum height
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/EgitimaxLogo.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ));
      } else {
        appBarActionsRoot = widget.appBarActions ?? [];
      }
    } else {
      appBarActionsRoot = appBarActions;
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: theme.colorScheme.inversePrimary,
          title: Text(widget.title),
          actions: appBarActionsRoot,
          bottom: widget.appBarBottom,
        ),
        body: widget.body ?? Container(),
        floatingActionButton: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: floatingActionButtonsRoot,
            ))),
        drawer: drawer);
  }
}
