import 'package:flutter/material.dart';
import 'package:sellusapp/utils/util_widgets/svg_image.dart';

class SlSvgIcon extends StatelessWidget {
  final String path;
  final VoidCallback? onPress;
  final double? height;

  const SlSvgIcon({
    super.key,
    required this.path,
    this.onPress,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: SvgAssets.icon(
        path,
        context: context,
        height: height,
      ),
    );
  }
}
