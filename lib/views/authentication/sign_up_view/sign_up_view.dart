import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:sellusapp/gen/assets.gen.dart';
import 'package:sellusapp/state/bloc/authentication/auth_bloc.dart';
import 'package:sellusapp/state/bloc/authentication/auth_bloc_event.dart';
import 'package:sellusapp/utils/constants/config_constant.dart';
import 'package:sellusapp/utils/util_widgets/auth_footer.dart';
import 'package:sellusapp/utils/util_widgets/auth_scaffold.dart';
import 'package:sellusapp/views/authentication/base_view.dart';
import 'package:sellusapp/views/authentication/sign_up_view/sign_up_model.dart';
import 'package:sellusapp/widgets/sl_error_container.dart';
import 'package:sellusapp/widgets/sl_svg_icon.dart';
import 'package:sellusapp/widgets/sl_text.dart';
import 'package:sellusapp/widgets/sl_text_field.dart';
part 'sign_up_adaptive.dart';

// class SignupView extends StatelessWidget {
//   const SignupView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ViewModelProvider<SignupModel>(
//         create: (context) => SignupModel(),
//         builder: (context, viewModel, child) {
//           return BlocListener<AuthBloc, AuthBlocState>(
//             listener: (context, state) {
//                   if (state.exception != null) {
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
//               child: SignupAdaptive(
//                 viewModel: viewModel,
//               ),
//             ),
//           );
//         });
//   }
// }
class SignupView extends BaseAuthView<SignupModel> {
  const SignupView({super.key});

  @override
  Widget buildBody(BuildContext context,SignupModel viewModel) {
    return AuthScaffold(
        child: SignupAdaptive(
      viewModel: viewModel,
    ));
  }

  @override
  SignupModel viewModel(BuildContext context) {
    return SignupModel();
  }
}
