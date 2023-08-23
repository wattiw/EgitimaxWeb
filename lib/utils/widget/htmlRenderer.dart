import 'dart:async';

import 'package:egitimax/pages/template.dart';
import 'package:egitimax/utils/widget/collapseChild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class WebViewPage extends StatelessWidget {
  bool? isDisableCollapseChild=false;
  final Icon? prefixIcon;
   String? showText='';
   String? hideText='';
  final String htmlContent;
  final TextStyle? textStyle;
  final Uri? baseUrl;
  final bool? buildAsync;
  //final Map<String, String>? Function(Element)? customStylesBuilder;
  //final Widget? Function(Element)? customWidgetBuilder;
  final bool? enableCaching;
  final WidgetFactory Function()? factoryBuilder;
  //final Widget? Function(BuildContext, Element, dynamic)? onErrorBuilder;
  //final Widget? Function(BuildContext, Element, double?)? onLoadingBuilder;
  final void Function(ImageMetadata)? onTapImage;
  final FutureOr<bool> Function(String)? onTapUrl;
  final RebuildTriggers? rebuildTriggers;
  final RenderMode renderMode;

   WebViewPage({super.key,
    this.isDisableCollapseChild,
    this.prefixIcon,
     this.showText,
     this.hideText,
    required this.htmlContent,
    this.textStyle,
    this.baseUrl,
    this.buildAsync,
    //this.customStylesBuilder,
    //this.customWidgetBuilder,
    this.enableCaching,
    this.factoryBuilder,
    //this.onErrorBuilder,
    //this.onLoadingBuilder,
    this.onTapImage,
    this.onTapUrl,
    this.rebuildTriggers,
    this.renderMode = RenderMode.column,
  });

  @override
  Widget build(BuildContext context) {
    var data=Align(
      alignment: Alignment.topLeft,
      child: HtmlWidget(
        htmlContent,
        key: key,
        baseUrl: baseUrl,
        buildAsync: buildAsync,
        //customStylesBuilder: customStylesBuilder,
        //customWidgetBuilder: customWidgetBuilder,
        enableCaching: enableCaching,
        factoryBuilder: factoryBuilder,
        //onErrorBuilder: onErrorBuilder,
        //onLoadingBuilder: onLoadingBuilder,
        onTapImage: onTapImage,
        onTapUrl: onTapUrl,
        rebuildTriggers: rebuildTriggers,
        renderMode: renderMode,
        textStyle: textStyle?? Theme.of(context).textTheme.bodyMedium,
      ),
    );

    if(isDisableCollapseChild==true)
      {
        return data;
      }

    return CollapseChild(
      buttonStyle: CollapseButtonStyle(
        textStyle: Theme.of(context).textTheme.titleMedium,
        iconColor: Theme.of(context).iconTheme.color,
        showText: Text(showText??'',style: Theme.of(context).textTheme.titleMedium,) ,
        hideText: Text(hideText??'',style: Theme.of(context).textTheme.titleMedium,) ,
      ),
      prefixIcon: prefixIcon,
      child: data,
    );
  }
}






