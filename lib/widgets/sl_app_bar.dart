import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sellusapp/gen/assets.gen.dart';
import 'package:sellusapp/utils/constants/config_constant.dart';
import 'package:sellusapp/widgets/sl_svg_icon.dart';

class SlAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final List<Widget>? actions;
  final Widget? title;
  final bool centerTitle;
  final double? height;
  final bool showBackButton;
  final double? elevation;
  final Color? backgroundColor;
  const SlAppBar({
    super.key,
    this.leading,
    this.actions,
    this.title,
    this.centerTitle = false,
    this.height,
    this.showBackButton = true,
    this.backgroundColor,
    this.elevation,
  });

  factory SlAppBar.auth(BuildContext context) {
    return SlAppBar(
      leading: SlSvgIcon(
        path: Assets.icons.arrowSmallLeft,
        onPress: () {
          context.pop();
        },
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      actions: actions,
      title: title,
      centerTitle: centerTitle,
      toolbarHeight: height,
      automaticallyImplyLeading: showBackButton,
      backgroundColor: backgroundColor,
      elevation: elevation,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(
        ConfigConstant.objectHeight3,
      );
}
