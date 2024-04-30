

import 'package:flutter/material.dart';
import 'package:sellusapp/core/base/base_auth_model.dart';
import 'package:sellusapp/utils/helpers/auth_validator.dart';

class ResetPasswordModel extends BaseAuthModel {
  bool isDisabled = false;
  void validate({
    required void Function() callback,
    required TextEditingController emailController,
  }) {
    authValidator(
      function: callback,
      emailErrorHook: emailErrorText,
      email: emailController,
    );
    notifyListeners();
  }

}
