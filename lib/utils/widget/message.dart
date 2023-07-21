import 'package:egitimax/utils/helper/localeManager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Message {
  static Future<String?> showMessage(
    BuildContext context, {
    Widget? icon,
    EdgeInsetsGeometry? iconPadding,
    Color? iconColor,
    Widget? title,
    EdgeInsetsGeometry? titlePadding,
    TextStyle? titleTextStyle,
    Widget? content,
    EdgeInsetsGeometry? contentPadding,
    TextStyle? contentTextStyle,
    List<Widget>? actions,
    EdgeInsetsGeometry? actionsPadding,
    MainAxisAlignment? actionsAlignment,
    OverflowBarAlignment? actionsOverflowAlignment,
    VerticalDirection? actionsOverflowDirection,
    double? actionsOverflowButtonSpacing,
    EdgeInsetsGeometry? buttonPadding,
    Color? backgroundColor,
    double? elevation,
    Color? shadowColor,
    Color? surfaceTintColor,
    String? semanticLabel,
    EdgeInsets insetPadding = EdgeInsets.zero,
    Clip clipBehavior = Clip.none,
    ShapeBorder? shape,
    AlignmentGeometry? alignment,
    bool scrollable = false,
  }) {
    var lang = AppLocalizations.of(context)!;
    final localeManager = Provider.of<LocaleManager>(context, listen: false);
    var theme = Theme.of(context);

    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: icon ??
               Row(
                children: [
                   Icon(
                    Icons.info,
                    color: Colors.black,
                      size:theme.iconTheme.size
                  ),
                  const SizedBox(width: 5.0),
                  Text(lang.libUtilsWidgetMessage_general,style:theme.textTheme.titleMedium,),
                ],
              ),
          iconPadding: iconPadding,
          iconColor: iconColor,
          title: title,
          titlePadding: titlePadding,
          titleTextStyle: titleTextStyle,
          content: content,
          contentPadding: contentPadding,
          contentTextStyle: contentTextStyle,
          actions: actions ??
              [
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child:  Icon(Icons.cancel_outlined ,size:theme.iconTheme.size),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child:  Icon(Icons.check_circle_outline,size:theme.iconTheme.size),
                ),
              ],
          actionsPadding: actionsPadding,
          actionsAlignment: actionsAlignment,
          actionsOverflowAlignment: actionsOverflowAlignment,
          actionsOverflowDirection: actionsOverflowDirection,
          actionsOverflowButtonSpacing: actionsOverflowButtonSpacing,
          buttonPadding: buttonPadding,
          backgroundColor: backgroundColor,
          elevation: elevation,
          shadowColor: shadowColor,
          surfaceTintColor: surfaceTintColor,
          semanticLabel: semanticLabel,
          insetPadding: insetPadding,
          clipBehavior: clipBehavior,
          shape: shape,
          alignment: alignment,
          scrollable: scrollable,
        );
      },
    );
  }

  static Future<String?> showInformationalMessage(
    BuildContext context, {
    Widget? icon,
    EdgeInsetsGeometry? iconPadding,
    Color? iconColor,
    Widget? title,
    EdgeInsetsGeometry? titlePadding,
    TextStyle? titleTextStyle,
    Widget? content,
    EdgeInsetsGeometry? contentPadding,
    TextStyle? contentTextStyle,
    List<Widget>? actions,
    EdgeInsetsGeometry? actionsPadding,
    MainAxisAlignment? actionsAlignment,
    OverflowBarAlignment? actionsOverflowAlignment,
    VerticalDirection? actionsOverflowDirection,
    double? actionsOverflowButtonSpacing,
    EdgeInsetsGeometry? buttonPadding,
    Color? backgroundColor,
    double? elevation,
    Color? shadowColor,
    Color? surfaceTintColor,
    String? semanticLabel,
    EdgeInsets insetPadding = EdgeInsets.zero,
    Clip clipBehavior = Clip.none,
    ShapeBorder? shape,
    AlignmentGeometry? alignment,
    bool scrollable = false,
  }) {

    var lang = AppLocalizations.of(context)!;
    final localeModel = Provider.of<LocaleManager>(context, listen: false);
    var theme = Theme.of(context);

    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: icon ??
               Row(
                children: [
                   Icon(
                    Icons.info,
                    color: Colors.blue,size:theme.iconTheme.size
                  ),
                  const SizedBox(width: 5.0),
                  Text(lang.libUtilsWidgetMessage_information,style:theme.textTheme.titleMedium,),
                ],
              ),
          iconPadding: iconPadding,
          iconColor: iconColor,
          title: title,
          titlePadding: titlePadding,
          titleTextStyle: titleTextStyle,
          content: content,
          contentPadding: contentPadding,
          contentTextStyle: contentTextStyle,
          actions: actions ??
              [
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child:  Icon(Icons.cancel_outlined,size:theme.iconTheme.size),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child:  Icon(Icons.check_circle_outline,size:theme.iconTheme.size),
                ),
              ],
          actionsPadding: actionsPadding,
          actionsAlignment: actionsAlignment,
          actionsOverflowAlignment: actionsOverflowAlignment,
          actionsOverflowDirection: actionsOverflowDirection,
          actionsOverflowButtonSpacing: actionsOverflowButtonSpacing,
          buttonPadding: buttonPadding,
          backgroundColor: backgroundColor,
          elevation: elevation,
          shadowColor: shadowColor,
          surfaceTintColor: surfaceTintColor,
          semanticLabel: semanticLabel,
          insetPadding: insetPadding,
          clipBehavior: clipBehavior,
          shape: shape,
          alignment: alignment,
          scrollable: scrollable,
        );
      },
    );
  }

  static Future<String?> showWarningMessage(
    BuildContext context, {
    Widget? icon,
    EdgeInsetsGeometry? iconPadding,
    Color? iconColor,
    Widget? title,
    EdgeInsetsGeometry? titlePadding,
    TextStyle? titleTextStyle,
    Widget? content,
    EdgeInsetsGeometry? contentPadding,
    TextStyle? contentTextStyle,
    List<Widget>? actions,
    EdgeInsetsGeometry? actionsPadding,
    MainAxisAlignment? actionsAlignment,
    OverflowBarAlignment? actionsOverflowAlignment,
    VerticalDirection? actionsOverflowDirection,
    double? actionsOverflowButtonSpacing,
    EdgeInsetsGeometry? buttonPadding,
    Color? backgroundColor,
    double? elevation,
    Color? shadowColor,
    Color? surfaceTintColor,
    String? semanticLabel,
    EdgeInsets insetPadding = EdgeInsets.zero,
    Clip clipBehavior = Clip.none,
    ShapeBorder? shape,
    AlignmentGeometry? alignment,
    bool scrollable = false,
  }) {
    var lang = AppLocalizations.of(context)!;
    final localeModel = Provider.of<LocaleManager>(context, listen: false);
    var theme = Theme.of(context);

    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: icon ??
               Row(
                children: [
                   Icon(
                    Icons.warning,
                    color: Colors.redAccent,size:theme.iconTheme.size
                  ),
                  const SizedBox(width: 5.0),
                  Text(lang.libUtilsWidgetMessage_warning,style:theme.textTheme.titleMedium,),
                ],
              ),
          iconPadding: iconPadding,
          iconColor: iconColor,
          title: title,
          titlePadding: titlePadding,
          titleTextStyle: titleTextStyle,
          content: content,
          contentPadding: contentPadding,
          contentTextStyle: contentTextStyle,
          actions: actions ??
              [
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child:  Icon(Icons.cancel_outlined,size:theme.iconTheme.size),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child:  Icon(Icons.check_circle_outline,size:theme.iconTheme.size),
                ),
              ],
          actionsPadding: actionsPadding,
          actionsAlignment: actionsAlignment,
          actionsOverflowAlignment: actionsOverflowAlignment,
          actionsOverflowDirection: actionsOverflowDirection,
          actionsOverflowButtonSpacing: actionsOverflowButtonSpacing,
          buttonPadding: buttonPadding,
          backgroundColor: backgroundColor,
          elevation: elevation,
          shadowColor: shadowColor,
          surfaceTintColor: surfaceTintColor,
          semanticLabel: semanticLabel,
          insetPadding: insetPadding,
          clipBehavior: clipBehavior,
          shape: shape,
          alignment: alignment,
          scrollable: scrollable,
        );
      },
    );
  }

  static Future<String?> showConfirmationMessage(
    BuildContext context, {
    Widget? icon,
    EdgeInsetsGeometry? iconPadding,
    Color? iconColor,
    Widget? title,
    EdgeInsetsGeometry? titlePadding,
    TextStyle? titleTextStyle,
    Widget? content,
    EdgeInsetsGeometry? contentPadding,
    TextStyle? contentTextStyle,
    List<Widget>? actions,
    EdgeInsetsGeometry? actionsPadding,
    MainAxisAlignment? actionsAlignment,
    OverflowBarAlignment? actionsOverflowAlignment,
    VerticalDirection? actionsOverflowDirection,
    double? actionsOverflowButtonSpacing,
    EdgeInsetsGeometry? buttonPadding,
    Color? backgroundColor,
    double? elevation,
    Color? shadowColor,
    Color? surfaceTintColor,
    String? semanticLabel,
    EdgeInsets insetPadding = EdgeInsets.zero,
    Clip clipBehavior = Clip.none,
    ShapeBorder? shape,
    AlignmentGeometry? alignment,
    bool scrollable = false,
  }) {

    var lang = AppLocalizations.of(context)!;
    final localeModel = Provider.of<LocaleManager>(context, listen: false);
    var theme = Theme.of(context);

    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: icon ??
               Row(
                children: [
                   Icon(
                    Icons.checklist_outlined,
                    color: Colors.deepPurpleAccent,size:theme.iconTheme.size
                  ),
                  const SizedBox(width: 5.0),
                  Text(lang.libUtilsWidgetMessage_confirmation,style:theme.textTheme.titleMedium,),
                ],
              ),
          iconPadding: iconPadding,
          iconColor: iconColor,
          title: title,
          titlePadding: titlePadding,
          titleTextStyle: titleTextStyle,
          content: content,
          contentPadding: contentPadding,
          contentTextStyle: contentTextStyle,
          actions: actions ??
              [
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child:  Icon(Icons.cancel_outlined,size:theme.iconTheme.size),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child:  Icon(Icons.check_circle_outline,size:theme.iconTheme.size),
                ),
              ],
          actionsPadding: actionsPadding,
          actionsAlignment: actionsAlignment,
          actionsOverflowAlignment: actionsOverflowAlignment,
          actionsOverflowDirection: actionsOverflowDirection,
          actionsOverflowButtonSpacing: actionsOverflowButtonSpacing,
          buttonPadding: buttonPadding,
          backgroundColor: backgroundColor,
          elevation: elevation,
          shadowColor: shadowColor,
          surfaceTintColor: surfaceTintColor,
          semanticLabel: semanticLabel,
          insetPadding: insetPadding,
          clipBehavior: clipBehavior,
          shape: shape,
          alignment: alignment,
          scrollable: scrollable,
        );
      },
    );
  }

  static Future<String?> showRequestMessage(
    BuildContext context, {
    Widget? icon,
    EdgeInsetsGeometry? iconPadding,
    Color? iconColor,
    Widget? title,
    EdgeInsetsGeometry? titlePadding,
    TextStyle? titleTextStyle,
    Widget? content,
    EdgeInsetsGeometry? contentPadding,
    TextStyle? contentTextStyle,
    List<Widget>? actions,
    EdgeInsetsGeometry? actionsPadding,
    MainAxisAlignment? actionsAlignment,
    OverflowBarAlignment? actionsOverflowAlignment,
    VerticalDirection? actionsOverflowDirection,
    double? actionsOverflowButtonSpacing,
    EdgeInsetsGeometry? buttonPadding,
    Color? backgroundColor,
    double? elevation,
    Color? shadowColor,
    Color? surfaceTintColor,
    String? semanticLabel,
    EdgeInsets insetPadding = EdgeInsets.zero,
    Clip clipBehavior = Clip.none,
    ShapeBorder? shape,
    AlignmentGeometry? alignment,
    bool scrollable = false,
  }) {

    var lang = AppLocalizations.of(context)!;
    final localeModel = Provider.of<LocaleManager>(context, listen: false);
    var theme = Theme.of(context);

    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: icon ??
               Row(
                children: [
                   Icon(
                    Icons.task,
                    color: Colors.amber,size:theme.iconTheme.size
                  ),
                  const SizedBox(width: 5.0),
                  Text(lang.libUtilsWidgetMessage_request,style:theme.textTheme.titleMedium,),
                ],
              ),
          iconPadding: iconPadding,
          iconColor: iconColor,
          title: title,
          titlePadding: titlePadding,
          titleTextStyle: titleTextStyle,
          content: content,
          contentPadding: contentPadding,
          contentTextStyle: contentTextStyle,
          actions: actions ??
              [
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child:  Icon(Icons.cancel_outlined,size:theme.iconTheme.size),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child:  Icon(Icons.check_circle_outline,size:theme.iconTheme.size),
                ),
              ],
          actionsPadding: actionsPadding,
          actionsAlignment: actionsAlignment,
          actionsOverflowAlignment: actionsOverflowAlignment,
          actionsOverflowDirection: actionsOverflowDirection,
          actionsOverflowButtonSpacing: actionsOverflowButtonSpacing,
          buttonPadding: buttonPadding,
          backgroundColor: backgroundColor,
          elevation: elevation,
          shadowColor: shadowColor,
          surfaceTintColor: surfaceTintColor,
          semanticLabel: semanticLabel,
          insetPadding: insetPadding,
          clipBehavior: clipBehavior,
          shape: shape,
          alignment: alignment,
          scrollable: scrollable,
        );
      },
    );
  }

  static Future<String?> showErrorMessage(
    BuildContext context, {
    Widget? icon,
    EdgeInsetsGeometry? iconPadding,
    Color? iconColor,
    Widget? title,
    EdgeInsetsGeometry? titlePadding,
    TextStyle? titleTextStyle,
    Widget? content,
    EdgeInsetsGeometry? contentPadding,
    TextStyle? contentTextStyle,
    List<Widget>? actions,
    EdgeInsetsGeometry? actionsPadding,
    MainAxisAlignment? actionsAlignment,
    OverflowBarAlignment? actionsOverflowAlignment,
    VerticalDirection? actionsOverflowDirection,
    double? actionsOverflowButtonSpacing,
    EdgeInsetsGeometry? buttonPadding,
    Color? backgroundColor,
    double? elevation,
    Color? shadowColor,
    Color? surfaceTintColor,
    String? semanticLabel,
    EdgeInsets insetPadding = EdgeInsets.zero,
    Clip clipBehavior = Clip.none,
    ShapeBorder? shape,
    AlignmentGeometry? alignment,
    bool scrollable = false,
  }) {

    var lang = AppLocalizations.of(context)!;
    final localeModel = Provider.of<LocaleManager>(context, listen: false);
    var theme = Theme.of(context);

    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: icon ??
               Row(
                children: [
                   Icon(
                    Icons.error_outline,
                    color: Colors.red,size:theme.iconTheme.size
                  ),
                  const SizedBox(width: 5.0),
                  Text(lang.libUtilsWidgetMessage_error,style:theme.textTheme.titleMedium,),
                ],
              ),
          iconPadding: iconPadding,
          iconColor: iconColor,
          title: title,
          titlePadding: titlePadding,
          titleTextStyle: titleTextStyle,
          content: content,
          contentPadding: contentPadding,
          contentTextStyle: contentTextStyle,
          actions: actions ??
              [
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child:  Icon(Icons.cancel_outlined,size:theme.iconTheme.size),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child:  Icon(Icons.check_circle_outline,size:theme.iconTheme.size),
                ),
              ],
          actionsPadding: actionsPadding,
          actionsAlignment: actionsAlignment,
          actionsOverflowAlignment: actionsOverflowAlignment,
          actionsOverflowDirection: actionsOverflowDirection,
          actionsOverflowButtonSpacing: actionsOverflowButtonSpacing,
          buttonPadding: buttonPadding,
          backgroundColor: backgroundColor,
          elevation: elevation,
          shadowColor: shadowColor,
          surfaceTintColor: surfaceTintColor,
          semanticLabel: semanticLabel,
          insetPadding: insetPadding,
          clipBehavior: clipBehavior,
          shape: shape,
          alignment: alignment,
          scrollable: scrollable,
        );
      },
    );
  }
}
