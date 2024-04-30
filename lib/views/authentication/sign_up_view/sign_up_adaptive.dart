part of 'sign_up_view.dart';

class SignupAdaptive extends HookWidget {
  final SignupModel viewModel;
  const SignupAdaptive({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final userNameController = useTextEditingController();
    return buildBody(
      context,
      emailController,
      passwordController,
      userNameController,
    );
  }

  Widget buildBody(
    BuildContext context,
    TextEditingController emailController,
    TextEditingController passwordController,
    TextEditingController userNameController,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SlText(
          tr('pages.auth.register'),
          textType: TextType.headline,
        ),
        ConfigConstant.sizedBoxH2,
        errorContainer(),
        ConfigConstant.sizedBoxH2,
        userNameTextField(
          context,
          userNameController,
        ),
        ConfigConstant.sizedBoxH1,
        emailField(context, emailController),
        ConfigConstant.sizedBoxH1,
        passwordField(
          context,
          passwordController,
        ),
        ConfigConstant.sizedBoxH3,
        signUpButton(
          context,
          emailController: emailController,
          passwordController: passwordController,
          usernameController: userNameController,
        ),
        ConfigConstant.sizedBoxH2,
        const AuthFooter(
          isSignupPage: true,
        ),
      ],
    );
  }

  SlTextField userNameTextField(
    BuildContext context,
    TextEditingController userNameController,
  ) {
    return SlTextField(
      textController: userNameController,
      hintText: tr('field.username'),
      errorText: viewModel.userNameErrorText.value,
      leadingIcon: SlSvgIcon(
        path: Assets.icons.user,
      ),
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
        path: Assets.icons.envelope,
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

  Widget signUpButton(
    BuildContext context, {
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required TextEditingController usernameController,
  }) {
    return ElevatedButton(
      onPressed: () {
        viewModel.validate(
          callback: () {
            context.read<AuthBloc>().add(AuthBlocEventSignup(
                  emailController.text,
                  passwordController.text,
                  usernameController.text,
                ));
          },
          emailController: emailController,
          passwordController: passwordController,
          usernameController: usernameController,
        );
      },
      child: Text(
        tr('pages.auth.register'),
      ),
    );
  }

  Widget errorContainer() {
    return SlErrorContainer(
      errorMessage: viewModel.errorContainerMessage.value,
      onClose: ()=>viewModel.changeContainerVisibilty(false),
      showContainer: viewModel.showErrorContainer.value,
    );
  }
}
