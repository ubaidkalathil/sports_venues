// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';

class TextWidget extends StatelessWidget {
  String? data;
  double fontSize;
  FontWeight? fontWeight;
  StrutStyle? strutStyle;
  Color? color;
  Color? backgroundColor;
  TextAlign? textAlign;
  TextDirection? textDirection;
  Locale? locale;
  bool? softWrap;
  double? textScaleFactor;
  TextScaler? textScaler;
  int? maxLines;
  String? semanticsLabel;
  TextWidthBasis? textWidthBasis;
  TextHeightBehavior? textHeightBehavior;
  Color? selectionColor;
  TextOverflow overflow;
  TextDecoration? decoration;
  Color? decorationColor;
  EdgeInsetsGeometry padding;
  bool isPriceTag;

  TextWidget(
    this.data, {
    super.key,
    this.fontSize = 14,
    this.fontWeight,
    this.strutStyle,
    this.color,
    this.backgroundColor,
    this.textAlign,
    this.textDirection,
    this.overflow = TextOverflow.ellipsis,
    this.locale,
    this.softWrap,
    this.textScaleFactor,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    this.decoration,
    this.decorationColor,
    this.isPriceTag = false,
    this.padding = const EdgeInsets.all(0.0),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        " ${data!}",
        overflow: TextOverflow.ellipsis,
        maxLines: maxLines,
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        locale: locale,
        softWrap: softWrap,
        textScaleFactor: textScaleFactor,
        textScaler: textScaler,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
        selectionColor: selectionColor,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          decoration: decoration,
          decorationColor: decorationColor,
          color: color,
        ),
      ),
    );
  }
}
