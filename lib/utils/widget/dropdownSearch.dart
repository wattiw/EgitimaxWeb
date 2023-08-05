import 'package:egitimax/repositories/appRepository.dart';
import 'package:egitimax/utils/helper/localeManager.dart';
import 'package:egitimax/utils/helper/routeManager.dart';
import 'package:egitimax/utils/widget/deviceInfo.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class DropdownSearchHelper {
  static RouteManager? routeManager;
  static AppRepository? appRepository;
  static ThemeData? theme;
  static AppLocalizations? lang;
  static LocaleManager? localeManager;
  static DeviceType? deviceType;

  static Widget singleSelectionDropdown<T>({
    required BuildContext context,
    Key? key,
    AutovalidateMode? autoValidateMode = AutovalidateMode.disabled,
    String? labelText,
    String? searchBoxLabelText,
    String? hintText,
    bool showSearchBox = false,
    List<T> items = const [],
    double maxWidth = double.infinity,
    Future<List<T>> Function(String)? asyncItems,
    DropDownDecoratorProps? dropdownDecoratorProps,
    ClearButtonProps? clearButtonProps,
    DropdownButtonProps? dropdownButtonProps,
    bool enabled = true,
    bool Function(T, String)? filterFn,
    String Function(T)? itemAsString,
    bool Function(T, T)? compareFn,
    T? selectedItem, // Add selectedItem here for single selection
    PopupPropsMultiSelection<T>? popupProps,
    void Function(T?)? onSaved,
    void Function(T?)? onChanged,
    Future<bool?> Function(T?, T?)?
        onBeforeChange, // Change the parameter types to T?
    Future<bool?> Function()? onBeforePopupOpening, // Remove the parameter
    String? Function(T?)? validator, // Change the parameter type to T?
    Widget Function(BuildContext, T?)?
        dropdownBuilder, // Change the parameter type to T?
  }) {
    loadComponent(context);

    return DropdownSearch<T>(
      key: key,
      autoValidateMode: autoValidateMode,
      items: items,
      asyncItems: asyncItems,
      dropdownDecoratorProps: dropdownDecoratorProps ??
          DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              constraints: BoxConstraints(maxHeight: 40, maxWidth: maxWidth),
              alignLabelWithHint: true,
              filled: true,
              fillColor: Colors.transparent,
              labelText: labelText,
              labelStyle: theme?.textTheme.titleMedium,
              hintText: hintText,
              hintStyle: theme?.textTheme.titleSmall,
              contentPadding: const EdgeInsets.all(8),
              isDense: true,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
                gapPadding: 4, // Reduced gap padding
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(8),
                gapPadding: 4,
              ),
            ),
            baseStyle: theme?.textTheme.bodyMedium,
          ),
      clearButtonProps: clearButtonProps ?? const ClearButtonProps(isVisible: true),
      dropdownButtonProps: dropdownButtonProps ??
          const DropdownButtonProps(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          ),
      enabled: enabled,
      filterFn: filterFn,
      itemAsString: itemAsString,
      compareFn: compareFn,
      selectedItem: selectedItem,
      // Add the selectedItem parameter here
      popupProps: popupProps ??
          PopupProps.menu(
            // Use PopupPropsSingleSelection for single selection
            fit: FlexFit.tight,
            showSearchBox: showSearchBox,
            searchFieldProps: TextFieldProps(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                labelText: searchBoxLabelText,
                labelStyle: theme?.textTheme.titleMedium,
                // Font size set to 10
                contentPadding: const EdgeInsets.all(8),
                isDense: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.white, // Search field background color
              ),
              style: theme?.textTheme.bodyMedium, // Font size set to 10
            ),
          ),
      onSaved: onSaved,
      onChanged: onChanged,
      onBeforeChange: onBeforeChange,
      validator: validator,
      dropdownBuilder: dropdownBuilder,
    );
  }

  static Widget multiSelectionDropdown<T>({
    required BuildContext context,
    Key? key,
    AutovalidateMode? autoValidateMode = AutovalidateMode.disabled,
    String? labelText,
    String? searchBoxLabelText,
    String? hintText,
    bool showSearchBox = false,
    List<T> items = const [],
    double maxWidth = double.infinity,
    Future<List<T>> Function(String)? asyncItems,
    DropDownDecoratorProps? dropdownDecoratorProps,
    ClearButtonProps? clearButtonProps,
    DropdownButtonProps? dropdownButtonProps,
    bool enabled = true,
    bool Function(T, String)? filterFn,
    String Function(T)? itemAsString,
    bool Function(T, T)? compareFn,
    List<T> selectedItems = const [], // Add selectedItems here
    PopupPropsMultiSelection<T>? popupProps,
    void Function(List<T>?)? onSaved,
    void Function(List<T>)? onChanged,
    Future<bool?> Function(List<T>, List<T>)? onBeforeChange,
    Future<bool?> Function(List<T>)? onBeforePopupOpening,
    String? Function(List<T>?)? validator,
    Widget Function(BuildContext, List<T>)? dropdownBuilder,
  }) {
    loadComponent(context);

    return DropdownSearch<T>.multiSelection(
      key: key,
      autoValidateMode: autoValidateMode,
      items: items,
      asyncItems: asyncItems,
      dropdownDecoratorProps: dropdownDecoratorProps ??
          DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              constraints: BoxConstraints(maxHeight: 50, maxWidth: maxWidth),
              alignLabelWithHint: true,
              filled: true,
              fillColor: Colors.transparent,
              labelText: labelText,
              labelStyle: theme?.textTheme.titleMedium,
              hintText: hintText,
              hintStyle: theme?.textTheme.titleSmall,
              contentPadding: const EdgeInsets.all(8),
              isDense: true,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
                gapPadding: 4, // Reduced gap padding
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(8),
                gapPadding: 4,
              ),
            ),
            baseStyle: theme?.textTheme.bodyMedium,
          ),
      clearButtonProps: clearButtonProps ?? const ClearButtonProps(isVisible: true),
      dropdownButtonProps: dropdownButtonProps ??
          const DropdownButtonProps(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          ),
      enabled: enabled,
      filterFn: filterFn,
      itemAsString: itemAsString,
      compareFn: compareFn,
      selectedItems: selectedItems,
      popupProps: popupProps ??
          PopupPropsMultiSelection.menu(
            fit: FlexFit.tight,
            showSelectedItems: T is String ? true : false,
            showSearchBox: showSearchBox,
            searchFieldProps: TextFieldProps(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                labelText: searchBoxLabelText,
                labelStyle: theme?.textTheme.titleMedium,
                // Font size set to 10
                contentPadding: const EdgeInsets.all(8),
                isDense: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.white, // Search field background color
              ),
              style: theme?.textTheme.bodyMedium, // Font size set to 10
            ),
          ),
      onSaved: onSaved,
      onChanged: onChanged,
      onBeforeChange: onBeforeChange,
      onBeforePopupOpening: onBeforePopupOpening,
      validator: validator,
      dropdownBuilder: dropdownBuilder,
    );
  }

  static void loadComponent(BuildContext context) {
    routeManager = RouteManager();
    appRepository = AppRepository();
    theme = Theme.of(context);
    lang = AppLocalizations.of(context)!;
    localeManager = Provider.of<LocaleManager>(context, listen: false);
    deviceType = DeviceInfo().getDeviceType();
  }

  static double getDropdownWidth(BuildContext context, List<String> displayText) {
    var stringWidth = getTextWidth(
        context,
        findLongestText(displayText),
        theme?.textTheme.titleMedium ?? const TextStyle(fontSize: 10),
        localeManager?.locale.languageCode != 'ar'
            ? TextDirection.ltr
            : TextDirection.rtl);

    return stringWidth;
  }

  static double getTextWidth(BuildContext context, String text, TextStyle textStyle, TextDirection td) {
    TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: textStyle),
      textDirection: td,
    );
    textPainter.layout();

    return textPainter.width*3 <200 ? 200 : (textPainter.width*3 >300 ? 300 : textPainter.width*3);
  }

  static String findLongestText(List<String> displayText) {
    if (displayText.isEmpty) {
      return 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
    }
    String longestText = displayText[0];
    for (int i = 1; i < displayText.length; i++) {
      if (displayText[i].length > longestText.length) {
        longestText = displayText[i];
      }
    }

    return longestText;
  }
}
