import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sellusapp/gen/assets.gen.dart';
import 'package:sellusapp/state/bloc/authentication/auth_bloc.dart';
import 'package:sellusapp/state/bloc/authentication/auth_bloc_event.dart';

import 'package:sellusapp/utils/constants/config_constant.dart';
import 'package:sellusapp/utils/util_widgets/auth_scaffold.dart';
import 'package:sellusapp/views/authentication/base_view.dart';
import 'package:sellusapp/views/authentication/verify_email_view/verify_email_model.dart';
import 'package:sellusapp/widgets/sl_delay_button.dart';
import 'package:sellusapp/widgets/sl_error_container.dart';
import 'package:sellusapp/widgets/sl_svg_icon.dart';
import 'package:sellusapp/widgets/sl_text.dart';
part 'verify_email_adaptive.dart';

// class VerifyEmailView extends StatelessWidget {
//   const VerifyEmailView({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ViewModelProvider<VerifyEmailModel>(
//         create: (context) => VerifyEmailModel(),
//         builder: (context, viewModel, child) {
//           return BlocListener<AuthBloc, AuthBlocState>(
//             listener: (context, state) {
//                     if (state.exception != null) {
//                 viewModel.changeContainerText(state.exception.toString());
//                 viewModel.changeContainerVisibilty(true);
//               }
//               if (state.loading == true) {
//                 LoadingOverlay.instance.show(context);
//               } else {
//                 LoadingOverlay.instance.hide();
//               }
//               if (state is SignedOutAuthBlocState) {
//                 context.pushReplacement(SlRoutes.signUp.path);
//               }
//             },
//             child: AuthScaffold(
//               child: VerifyEmailAdaptive(
//                 viewModel: viewModel,
//               ),
//             ),
//           );
//         });
//   }
// }

class VerifyEmailView extends BaseAuthView<VerifyEmailModel>{
  const VerifyEmailView({super.key});

  @override
  Widget buildBody(BuildContext context,VerifyEmailModel viewModel,) {
    return AuthScaffold(child: VerifyEmailAdaptive(viewModel: viewModel,),);
  }

  @override
  VerifyEmailModel viewModel(BuildContext context) {
   return VerifyEmailModel();
  }

}
