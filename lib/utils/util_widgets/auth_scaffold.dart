import 'package:flutter/material.dart';
import 'package:sellusapp/utils/constants/config_constant.dart';

class AuthScaffold extends StatelessWidget {
  final Widget child;
  final PreferredSizeWidget? appbar;
  const AuthScaffold({
    super.key,
    required this.child,
    this.appbar
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: Center(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: ConfigConstant.layoutPadding,
              constraints: const BoxConstraints(
                maxWidth: ConfigConstant.screenMaxWidth,
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
