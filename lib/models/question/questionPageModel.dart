import 'package:egitimax/repositories/appRepository.dart';
import 'package:egitimax/utils/helper/localeManager.dart';
import 'package:egitimax/utils/helper/routeManager.dart';
import 'package:egitimax/utils/widget/deviceInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class QuestionPageModel {
  BuildContext context;
  String? currentTitle;
  late BigInt userId = BigInt.zero;
  late BigInt questionId = BigInt.zero;
  late RouteManager routeManager;
  late AppRepository appRepository;
  late ThemeData theme;
  late AppLocalizations lang;
  late LocaleManager localeManager;
  late DeviceTypes deviceType;
  int? selectedPageIndex;
  int currentPerPage = 10;
  int currentPage = 1;
  List<Map<String, dynamic>>? selectedItems;

  QuestionPageModel({
    required this.context,
  });

  void initializeContextItems() {
    routeManager = RouteManager();
    appRepository = AppRepository();
    theme = Theme.of(context);
    lang = AppLocalizations.of(context)!;
    localeManager = Provider.of<LocaleManager>(context, listen: false);
    deviceType = DeviceInfo().getDeviceType();
  }
}
