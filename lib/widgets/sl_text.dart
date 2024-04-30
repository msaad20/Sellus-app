
import 'package:flutter/material.dart';

enum TextType {
  normal,
  hint,
  title,
  headline,
}

class SlText extends StatelessWidget {
  final String text;
  final TextType textType;
  double? fontSize;
  Color? fontColor;
  FontWeight? fontWeight;
  String? fontFamily;
  TextOverflow? overflow;
  TextAlign? textAlign;
  int? maxLines;
  bool? softWrap;
  SlText(
    this.text, {
    super.key,
    this.textType = TextType.normal,
    this.fontSize,
    this.fontColor,
    this.fontWeight,
    this.fontFamily,
    this.overflow,
    this.textAlign,
    this.maxLines,
    this.softWrap,
  });
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    switch (textType) {
      case TextType.hint:
        fontSize ??= textTheme.labelMedium!.fontSize;
        fontColor ??= Theme.of(context).hintColor;
        break;
      case TextType.title:
        fontSize ??= textTheme.titleMedium!.fontSize;
        fontWeight ??= FontWeight.bold;
        break;
      case TextType.headline:
        fontSize ??= textTheme.headlineMedium!.fontSize;
        fontWeight ??= FontWeight.bold;
        break;
      case TextType.normal:
        break;
    }

    return Text(
      text,
      softWrap: softWrap,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: TextStyle(
        color: fontColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
      ),
    );
  }
}
