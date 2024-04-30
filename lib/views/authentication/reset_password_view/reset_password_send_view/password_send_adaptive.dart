part of 'password_send_view.dart';

class PasswordSendAdaptive extends StatelessWidget {
  final PasswordSendModel viewModel;
  final ResetPasswordSendArgs args;
  const PasswordSendAdaptive({
    super.key,
    required this.viewModel,
    required this.args,
  });

  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }

  Widget buildBody(
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SlSvgIcon(
          path: Assets.icons.emailSendIcon,
          height: ConfigConstant.objectHeight6,
        ),
        ConfigConstant.sizedBoxH5,
        SlText(
          tr('pages.auth.resetPasswordSend'),
          textType: TextType.headline,
        ),
        ConfigConstant.sizedBoxH2,
        SlText(
          tr('pages.auth.resetPasswordSendText'),
          textType: TextType.hint,
        ),
        GestureDetector(
          onTap: () {
            context.pushReplacement(SlRoutes.resetPassword.path);
          },
          child: SlText(
            tr('pages.auth.changeEmail'),
            fontColor: Theme.of(context).primaryColor,
          ),
        ),
        ConfigConstant.sizedBoxH3,
        errorContainer(),
        ConfigConstant.sizedBoxH5,
        ElevatedButton(
          onPressed: () {
            context.pushReplacement(SlRoutes.signIn.path);
          },
          child: SlText(tr('pages.auth.signIn')),
        ),
        ConfigConstant.sizedBoxH2,
        SlDelayButton(
          onPressed: () {
            context.read<AuthBloc>().add(
                  AuthBlocEventResetPassword(args.email),
                );
          },
          label: tr('pages.auth.resendEmail'),
          timeOutInSeconds: 20,
        ),
        ConfigConstant.sizedBoxH3,
      ],
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
