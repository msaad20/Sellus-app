import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sellusapp/core/base/base_auth_model.dart';
import 'package:sellusapp/utils/helpers/auth_validator.dart';

class SigninModel extends BaseAuthModel {
  void validate({
    required VoidCallback callback,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  }) {
    authValidator(
      function: callback,
      passwordErrorHook: passwordErrorText,
      emailErrorHook: emailErrorText,
      email: emailController,
      password: passwordController,
    );
    notifyListeners();
  }
}
