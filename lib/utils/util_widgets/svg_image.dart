import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sellusapp/utils/constants/config_constant.dart';

class SvgAssets {
  static Widget image(String path, {double? height, double? width}) {
    return SvgPicture.asset(
      path,
      height: height,
      width: width,
    );
  }

  static Widget icon(
    String path, {
    double? height = ConfigConstant.iconSize2,
    double? width,
    required BuildContext context,
    BoxFit boxFit = BoxFit.scaleDown,
    Color? color,
    EdgeInsets padding = const EdgeInsets.all(0),
  }) {
    return Padding(
      padding: padding,
      child: SvgPicture.asset(
        path,
        fit: boxFit,
        height: height,
        width: width,
        colorFilter: ColorFilter.mode(
          color ?? (Theme.of(context).iconTheme.color!),
          BlendMode.srcIn,
        ),
      ),
    );
  }

  SvgAssets._();
}
