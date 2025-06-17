import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  final Color? backgroundColor;
  final String text;
  final Color? colorText;
  final String? fontFamily;
  final double? fontSize;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? textOverflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? heigth;
  final TextDecoration? textDecoration;
  final double? decorationThickness;
  final double? letterSpacing;
  final Color? decorationColor;

  const TextWidget({
    this.backgroundColor,
    required this.text,
    this.colorText,
    this.fontFamily,
    this.fontSize,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.textOverflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.fontWeight,
    this.fontStyle,
    this.heigth,
    this.textDecoration,
    this.decorationThickness,
    this.letterSpacing,
    super.key,
    this.decorationColor,
  });

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      minFontSize: 8,
      style:
          style ??
          GoogleFonts.inter(
            backgroundColor: backgroundColor,
            letterSpacing: letterSpacing,
            color: colorText ?? Colors.black,
            decorationThickness: decorationThickness,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            height: heigth,
            decoration: textDecoration,
            decorationColor: decorationColor,
          ),
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxLines,
    );
  }
}
