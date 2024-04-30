part of 'sign_in_view.dart';

class SigninAdaptive extends HookWidget {
  final SigninModel viewModel;
  const SigninAdaptive({super.key, required this.viewModel});

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
          tr('pages.auth.signIn'),
          textType: TextType.headline,
        ),
        ConfigConstant.sizedBoxH2,
        errorContainer(),
        ConfigConstant.sizedBoxH2,
        emailField(context, emailController),
        ConfigConstant.sizedBoxH1,
        passwordField(
          context,
          passwordController,
        ),
        forgotPasswordButton(
          context,
        ),
        ConfigConstant.sizedBoxH3,
        signInButton(
          context,
          emailController: emailController,
          passwordController: passwordController,
        ),
        ConfigConstant.sizedBoxH2,
        const AuthFooter(
          isSignupPage: false,
        ),
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

  Widget passwordField(
    BuildContext context,
    TextEditingController controller,
  ) {
    final bool passwordVisible = viewModel.isPasswordVisible.value;
    return SlTextField(
        textController: controller,
        hintText: tr('field.password'),
        isObsecure: passwordVisible,
        errorText: viewModel.passwordErrorText.value,
        leadingIcon: SlSvgIcon(
          path: Assets.icons.lock,
        ),
        trailingIcon: SlSvgIcon(
          path: passwordVisible ? Assets.icons.eyeCrossed : Assets.icons.eye,
          onPress: viewModel.changePasswordVisibilty,
        ));
  }

  Widget forgotPasswordButton(
    BuildContext context,
  ) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          context.read<AuthBloc>().add(
              AuthBlocEventAuthNavigation(route: SlRoutes.resetPassword.path));
        },
        child: SlText(tr('pages.auth.forgotPassword')),
      ),
    );
  }

  Widget signInButton(
    BuildContext context, {
    required TextEditingController emailController,
    required TextEditingController passwordController,
  }) {
    return ElevatedButton(
      onPressed: () {
        viewModel.validate(
          callback: () {
            context.read<AuthBloc>().add(AuthBlocEventSignin(
                  emailController.text,
                  passwordController.text,
                ));
          },
          emailController: emailController,
          passwordController: passwordController,
        );
      },
      child: Text(
        tr('pages.auth.login'),
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
