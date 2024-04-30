import 'package:flutter/material.dart';
import 'package:sellusapp/utils/constants/config_constant.dart';

class SlIconContainer extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPress;
  final Color? color;
  final EdgeInsets? padding;

  const SlIconContainer({
    super.key,
    required this.child,
    this.onPress,
    this.color,
    this.padding = const EdgeInsets.all(ConfigConstant.padding0),
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: color ?? Theme.of(context).cardColor,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).hintColor.withOpacity(.25),
              spreadRadius: 1.0,
              blurRadius: 16.0,
            ),
          ],
          borderRadius: ConfigConstant.circlarRadius2,
        ),
        child: child,
      ),
    );
  }
}
