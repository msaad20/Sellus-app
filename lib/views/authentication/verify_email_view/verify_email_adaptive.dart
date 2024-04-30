part of 'verify_email_view.dart';

class VerifyEmailAdaptive extends StatelessWidget {
  final VerifyEmailModel viewModel;
  const VerifyEmailAdaptive({
    super.key,
    required this.viewModel,
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
          tr('pages.auth.verifyEmail'),
          textType: TextType.headline,
        ),
        ConfigConstant.sizedBoxH2,
        SlText(
          tr('pages.auth.verifyEmailDescription'),
          textType: TextType.hint,
        ),
        GestureDetector(
          onTap: () {
            context.read<AuthBloc>().add(const AuthBlocEventDeleteUser());
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
            context.read<AuthBloc>().add(
                  const AuthBlocEventIsEmailVerified(),
                );
          },
          child: SlText(tr('pages.auth.emailVerified')),
        ),
        ConfigConstant.sizedBoxH2,
        SlDelayButton(
          onPressed: () {
            context.read<AuthBloc>().add(
                  const AuthBlocEventSendVerifyEmail(),
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
