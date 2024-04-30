import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sellusapp/core/base/base_auth_model.dart';
import 'package:sellusapp/core/base/view_model_provider.dart';
import 'package:sellusapp/core/services/loading_overlay.dart';
import 'package:sellusapp/state/bloc/authentication/auth_bloc.dart';
import 'package:sellusapp/state/bloc/authentication/auth_bloc_state.dart';

abstract class BaseAuthView<T extends BaseAuthModel> extends StatelessWidget {
  const BaseAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<T>(
        create: viewModel,
        builder: (context, viewModel, child) {
          return BlocListener<AuthBloc, AuthBlocState>(
            listener: (context, state) {
              if (state.exception != null) {
                viewModel.changeContainerText(state.exception.toString());
                viewModel.changeContainerVisibilty(true);
              }
              if (state.loading == true) {
                LoadingOverlay.instance.show(context);
              } else {
                LoadingOverlay.instance.hide();
              }
            },
            child: buildBody(context, viewModel),
          );
        });
  }

  Widget buildBody(
    BuildContext context,
    T viewModel,
  );

  T viewModel(BuildContext context);
}
