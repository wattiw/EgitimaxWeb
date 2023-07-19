import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class AppConstants {
  //Api
  static  String apiBaseUrl = 'http://138.68.82.103:9090/';
  static  String apiUsername = 'info@egitimax.com';
  static  String apiPassword = 'password';
  static  int apiDebugPrintExceptionActive = 1;
  static  int apiDebugPrintActive = 1;
  //Language
  static const String languageCodeDefault = 'tr';
  static const String languageCountryCodeDefault = 'TR';

  //Layout
  static  int floatingActionButtonAddToExisting = 1;
  static  int appBarActionsAddToExisting = 1;
  static  String appBarSmallLogoPath= 'https://media.licdn.com/dms/image/D4D0BAQFkB1OOfWU6Bg/company-logo_200_200/0/1665299041364?e=2147483647&v=beta&t=L5eVXqByti-aEzZvoSSvQcYhQ4fzpn1p2EgR-XU_iG8';
  static  String appBarLargeLogoPath = 'assets/images/egitimaxOld.png';
  static  String appBarUserImagePath = 'assets/images/Salih.jpeg';
  static  double appBarLogoRatio = 3.9;
  static  double appBarLogoMargin = 3;
  static  double appBarUserImageMargin = 3;
  static  double appBarLogoSizeCorrectionFactor = 0.1;
  static  double appBarUserImageSizeCorrectionFactor = 0.6;
  static  double appBarMobilScreenWidthLimitSize = 500;
  static const TabStyle? convexAppBarStyle = null;
  static  double convexAppBarStyleActiveIconSize = 25;
  static  double convexAppBarStyleActiveIconMargin = 10;
  static  double convexAppBarStyleIconSize = 20;
  static  double convexAppBarStyleFontSize = 12;
  static  int appBarKeepRootActions = 1;
  static  int appBarReverseRootActions = 0;
  static  int scaffoldKeepRootDrawer = 1;
  static  int scaffoldReverseRootDrawer = 0;


}