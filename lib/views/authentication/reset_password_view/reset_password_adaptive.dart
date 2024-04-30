part of 'reset_password_view.dart';

class ResetPasswordAdaptive extends HookWidget {
  final ResetPasswordModel viewModel;
  const ResetPasswordAdaptive({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    return buildBody(
      context,
      emailController,
      passwordController,
    );
  }

  Widget buildBody(
    BuildContext context,
    TextEditingController emailController,
    TextEditingController passwordController,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SlText(
          tr('pages.auth.resetPassword'),
          textType: TextType.headline,
        ),
        ConfigConstant.sizedBoxH1,
        SlText(
          tr('pages.auth.resetPasswordText'),
          textType: TextType.hint,
        ),
        ConfigConstant.sizedBoxH2,
        errorContainer(),
        ConfigConstant.sizedBoxH2,
        emailField(context, emailController),
        ConfigConstant.sizedBoxH4,
        resetPasswordButton(
          context,
          emailController: emailController,
        ),
        ConfigConstant.sizedBoxH3,
      ],
    );
  }

  Widget emailField(
    BuildContext context,
    TextEditingController controller,
  ) {
    return SlTextField(
      textController: controller,
      hintText: tr('field.email'),
      errorText: viewModel.emailErrorText.value,
      leadingIcon: SlSvgIcon(
        path: Assets.icons.user,
      ),
    );
  }

  Widget resetPasswordButton(
    BuildContext context, {
    required TextEditingController emailController,
  }) {
    return ElevatedButton(
      onPressed: () {
        viewModel.validate(
          callback: () {
            context.read<AuthBloc>().add(
                  AuthBlocEventResetPassword(emailController.text),
                );
          },
          emailController: emailController,
        );
      },
      child: Text(
        tr('pages.auth.resetPassword'),
      ),
    );
  }

  Widget errorContainer() {
    return SlErrorContainer(
      errorMessage: viewModel.errorContainerMessage.value,
      onClose: () => viewModel.changeContainerVisibilty(false),
      showContainer: viewModel.showErrorContainer.value,
    );
  }
}
