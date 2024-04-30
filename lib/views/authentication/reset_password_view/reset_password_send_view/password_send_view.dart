import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sellusapp/config/router/router_args.dart';
import 'package:sellusapp/config/router/router_extension.dart';
import 'package:sellusapp/gen/assets.gen.dart';
import 'package:sellusapp/state/bloc/authentication/auth_bloc.dart';
import 'package:sellusapp/state/bloc/authentication/auth_bloc_event.dart';
import 'package:sellusapp/utils/constants/config_constant.dart';
import 'package:sellusapp/utils/util_widgets/auth_scaffold.dart';
import 'package:sellusapp/views/authentication/base_view.dart';
import 'package:sellusapp/views/authentication/reset_password_view/reset_password_send_view/password_send_model.dart';

import 'package:sellusapp/widgets/sl_delay_button.dart';
import 'package:sellusapp/widgets/sl_error_container.dart';
import 'package:sellusapp/widgets/sl_svg_icon.dart';
import 'package:sellusapp/widgets/sl_text.dart';

part 'password_send_adaptive.dart';

// class ResetPasswordSendView extends StatelessWidget {
//   final ResetPasswordSendArgs args;
//   const ResetPasswordSendView({
//     super.key,
//     required this.args,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ViewModelProvider<PasswordSendModel>(
//         create: (context) => PasswordSendModel(),
//         builder: (context, viewModel, child) {
//           return BlocListener<AuthBloc, AuthBlocState>(
//             listener: (context, state) {
//                      if (state.exception != null) {
//                 viewModel.changeContainerText(state.exception.toString());
//                 viewModel.changeContainerVisibilty(true);
//               }
//               if (state.loading == true) {
//                 LoadingOverlay.instance.show(context);
//               } else {
//                 LoadingOverlay.instance.hide();
//               }
//             },
//             child: AuthScaffold(
//               child: PasswordSendAdaptive(
//                 args: args,
//                 viewModel: viewModel,
//               ),
//             ),
//           );
//         });
//   }
// }

class ResetPasswordSendView extends BaseAuthView<PasswordSendModel> {
  final ResetPasswordSendArgs args;
  const ResetPasswordSendView({
    super.key,
    required this.args,
  });
@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return super.build(context);
  }
  @override
  Widget buildBody(BuildContext context, PasswordSendModel viewModel) {
    return AuthScaffold(
      child: PasswordSendAdaptive(
        args: args,
        viewModel: viewModel,
      ),
    );
  }

  @override
  PasswordSendModel viewModel(BuildContext context) => PasswordSendModel();
}
