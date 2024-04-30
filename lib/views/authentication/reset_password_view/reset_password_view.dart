import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:sellusapp/config/router/router_args.dart';
import 'package:sellusapp/config/router/router_extension.dart';
import 'package:sellusapp/gen/assets.gen.dart';
import 'package:sellusapp/state/bloc/authentication/auth_bloc.dart';
import 'package:sellusapp/state/bloc/authentication/auth_bloc_event.dart';
import 'package:sellusapp/state/bloc/authentication/auth_bloc_state.dart';

import 'package:sellusapp/utils/constants/config_constant.dart';
import 'package:sellusapp/utils/util_widgets/auth_scaffold.dart';
import 'package:sellusapp/views/authentication/base_view.dart';
import 'package:sellusapp/views/authentication/reset_password_view/reset_password_model.dart';
import 'package:sellusapp/views/authentication/reset_password_view/reset_password_send_view/password_send_view.dart';
import 'package:sellusapp/widgets/sl_app_bar.dart';
import 'package:sellusapp/widgets/sl_error_container.dart';
import 'package:sellusapp/widgets/sl_svg_icon.dart';
import 'package:sellusapp/widgets/sl_text.dart';
import 'package:sellusapp/widgets/sl_text_field.dart';
part 'reset_password_adaptive.dart';

// class ResetPasswordView extends StatelessWidget {
//   const ResetPasswordView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ViewModelProvider<ResetPasswordModel>(
//         create: (context) => ResetPasswordModel(),
//         builder: (context, viewModel, child) {
//           return BlocListener<AuthBloc, AuthBlocState>(
//             listener: (context, state) {
//                 if (state.exception != null) {
//                 viewModel.changeContainerText(state.exception.toString());
//                 viewModel.changeContainerVisibilty(true);
//               }
//               if (state.loading == true) {
//                 LoadingOverlay.instance.show(context);
//               } else {
//                 LoadingOverlay.instance.hide();
//               }
//               if (state is ResetEmailSendState) {
//                 context.pushReplacement(SlRoutes.resetPasswordEmailSend.path,
//                     extra: ResetPasswordSendArgs(
//                       state.email,
//                     ));
//               }
//             },
//             child: AuthScaffold(
//               appbar: SlAppBar.auth(context),
//               child: ResetPasswordAdaptive(
//                 viewModel: viewModel,
//               ),
//             ),
//           );
//         });
//   }
// }

class ResetPasswordView extends BaseAuthView<ResetPasswordModel> {
  const ResetPasswordView({super.key});

  @override
  Widget buildBody(
    BuildContext context,
    ResetPasswordModel viewModel,
  ) {
    return BlocListener<AuthBloc, AuthBlocState>(
        listener: (context, state) {
          if (state is ResetEmailSendPageState) {
            context.pushReplacement(
              SlRoutes.resetPasswordEmailSend.path,
              extra: ResetPasswordSendArgs(state.email),
            );
          }
        },
        child: AuthScaffold(
         
          child: ResetPasswordAdaptive(
            viewModel: viewModel,
          ),
        ));
  }

  @override
  ResetPasswordModel viewModel(BuildContext context) {
    return ResetPasswordModel();
  }
}
