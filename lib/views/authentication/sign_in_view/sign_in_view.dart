import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sellusapp/config/router/router_extension.dart';
import 'package:sellusapp/gen/assets.gen.dart';
import 'package:sellusapp/state/bloc/authentication/auth_bloc.dart';
import 'package:sellusapp/state/bloc/authentication/auth_bloc_event.dart';
import 'package:sellusapp/utils/constants/config_constant.dart';
import 'package:sellusapp/utils/util_widgets/auth_footer.dart';
import 'package:sellusapp/utils/util_widgets/auth_scaffold.dart';
import 'package:sellusapp/views/authentication/base_view.dart';

import 'package:sellusapp/views/authentication/sign_in_view/sign_in_model.dart';
import 'package:sellusapp/widgets/sl_error_container.dart';
import 'package:sellusapp/widgets/sl_svg_icon.dart';
import 'package:sellusapp/widgets/sl_text.dart';
import 'package:sellusapp/widgets/sl_text_field.dart';
part 'sign_in_adaptive.dart';

// class SigninView extends StatelessWidget {
//   const SigninView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ViewModelProvider<SigninModel>(
//         create: (context) => SigninModel(),
//         builder: (context, viewModel, child) {
//           return BlocListener<AuthBloc, AuthBlocState>(
//             listener: (context, state) {
//               if (state is ErrorAuthBlocState) {
//                 viewModel.changeContainerText(state.exception.toString());
//                 viewModel.changeContainerVisibilty(true);
//               }
//               if (state is LoadingAuthBlocState) {
//                 LoadingOverlay.instance.show(context);
//               } else {
//                 LoadingOverlay.instance.hide();
//               }
//               if (state is SignedInAuthBlocState) {
//                 context.go(SlRoutes.home.path);
//               }
//             },
//             child: AuthScaffold(
//               child: SigninAdaptive(
//                 viewModel: viewModel,
//               ),
//             ),
//           );
//         });
//   }
// }

class SigninView extends BaseAuthView<SigninModel> {
  SigninView({super.key});

  @override
  Widget buildBody(BuildContext context,SigninModel viewModel) {
    return AuthScaffold(
      child: SigninAdaptive(
        viewModel: viewModel,
      ),
    );
  }

  @override
  SigninModel viewModel(
    BuildContext context,
  ) =>
      SigninModel();
}
