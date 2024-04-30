// import 'package:sellusapp/core/base/base_view_model.dart';
// import 'package:flutter/material.dart';
// import 'package:sellusapp/utils/helpers/auth_validator.dart';

// class SignupModel extends BaseViewModel {
//   final ValueNotifier<bool> isPasswordVisible = ValueNotifier(false);
//   final ValueNotifier<String?> emailErrorText = ValueNotifier(null);
//   final ValueNotifier<String?> passwordErrorText = ValueNotifier(null);
//   final ValueNotifier<String?> userNameErrorText = ValueNotifier(null);

//   ValueNotifier<bool> showErrorContainer = ValueNotifier(false);
//   ValueNotifier<String> errorContainerMessage = ValueNotifier('');

//   void changeContainerVisibilty() {
//     showErrorContainer.value = !showErrorContainer.value;
//     notifyListeners();
//   }

//   void changeContainerText(String newValue) {
//     errorContainerMessage.value = newValue;
//     notifyListeners();
//   }

//   void changePasswordVisibilty() {
//     isPasswordVisible.value = !isPasswordVisible.value;
//     notifyListeners();
//   }

//   void validate(
//       {required VoidCallback callback,
//       required TextEditingController emailController,
//       required TextEditingController passwordController,
//       required TextEditingController usernameController}) {
//     authValidator(
//       function: callback,
//       passwordErrorHook: passwordErrorText,
//       emailErrorHook: emailErrorText,
//       userNameErrorHook: userNameErrorText,
//       email: emailController,
//       password: passwordController,
//       userName: usernameController,
//     );
//     notifyListeners();
//   }
// }

import 'package:flutter/material.dart';
import 'package:sellusapp/core/base/base_auth_model.dart';
import 'package:sellusapp/utils/helpers/auth_validator.dart';

class SignupModel extends BaseAuthModel {
  void validate({
    required VoidCallback callback,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required TextEditingController usernameController,
  }) {
    authValidator(
      function: callback,
      passwordErrorHook: passwordErrorText,
      emailErrorHook: emailErrorText,
      userNameErrorHook: userNameErrorText,
      email: emailController,
      password: passwordController,
      userName: usernameController,
    );
    notifyListeners();
  }
}
