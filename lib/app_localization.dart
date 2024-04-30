import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:flutter/material.dart';
import 'package:sellusapp/utils/constants/app_constants.dart';

class AppLocalization extends StatelessWidget {
  final Widget child;
  const AppLocalization({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: AppConstants.supportedLocales,
      fallbackLocale: AppConstants.fallbackLocale,
      assetLoader: const YamlAssetLoader(),
      path: 'assets/translations',
      child: child,
    );
  }
}
