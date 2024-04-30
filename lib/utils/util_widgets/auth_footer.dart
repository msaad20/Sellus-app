import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sellusapp/config/router/router_extension.dart';
import 'package:sellusapp/gen/assets.gen.dart';
import 'package:sellusapp/state/bloc/authentication/auth_bloc.dart';
import 'package:sellusapp/state/bloc/authentication/auth_bloc_event.dart';
import 'package:sellusapp/state/bloc/authentication/auth_bloc_state.dart';
import 'package:sellusapp/utils/constants/config_constant.dart';
import 'package:sellusapp/utils/util_widgets/svg_image.dart';
import 'package:sellusapp/widgets/sl_icon_container.dart';
import 'package:sellusapp/widgets/sl_text.dart';

class AuthFooter extends StatelessWidget {
  final bool isSignupPage;
  const AuthFooter({
    super.key,
    this.isSignupPage = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthBlocState>(
      builder: (context, state) {
        return Column(
          children: [
            ConfigConstant.sizedBoxH5,
            SlText(
              tr('pages.auth.signInWith'),
              textAlign: TextAlign.center,
            ),
            ConfigConstant.sizedBoxH2,
            googleSignin(() async {}),
            ConfigConstant.sizedBoxH5,
            changePageButton(() async {
              if (isSignupPage) {
                context.read<AuthBloc>().add(
                    AuthBlocEventAuthNavigation(route: SlRoutes.signIn.path,));
              } else {
                context.read<AuthBloc>().add(
                    AuthBlocEventAuthNavigation(route: SlRoutes.signUp.path),);
              }
            }),
          ],
        );
      },
    );
  }

  Widget googleSignin(VoidCallback onPress) {
    return SlIconContainer(
      onPress: onPress,
      child: SvgAssets.image(
        Assets.icons.icons8Google,
        height: ConfigConstant.iconSize3,
      ),
    );
  }

  Widget changePageButton(VoidCallback onPress) {
    return Wrap(
      runAlignment: WrapAlignment.center,
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      //      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SlText(
          isSignupPage
              ? tr('pages.auth.haveAnAccount')
              : tr('pages.auth.dontHaveAnAccount'),
        ),
        TextButton(
            onPressed: onPress,
            child: SlText(
              isSignupPage
                  ? tr('pages.auth.signIn')
                  : tr('pages.auth.createAccount'),
            ))
      ],
    );
  }
}
