import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sellusapp/utils/constants/app_constants.dart';

authValidator({
  required final VoidCallback function,
  final TextEditingController? email,
  final TextEditingController? password,
  final TextEditingController? userName,
  final ValueNotifier<String?>? emailErrorHook,
  final ValueNotifier<String?>? passwordErrorHook,
  final ValueNotifier<String?>? userNameErrorHook,
}) {

  final emailErrorValidator =
      validateEmail(email?.value.text);
  final passwordErrorValidator =
      validatePassword(password?.value.text);
  final userNameErrorValidator =
      validateUsername( userName?.value.text);
  //check if validator have catched any error or not
  if (emailErrorValidator == null &&
      passwordErrorValidator == null &&
      userNameErrorValidator == null) {
    //checks if hook is provided, if provider then make its value null else do nothing.
    emailErrorHook == null ? null : emailErrorHook!.value = null;
    passwordErrorHook == null ? null : passwordErrorHook!.value = null;
    userNameErrorHook == null ? null : userNameErrorHook!.value = null;
    function();
  } else {
    // if an error  is catched by validator then assign it to the hooks
    emailErrorHook == null ? null : emailErrorHook!.value = emailErrorValidator;
    passwordErrorHook == null
        ? null
        : passwordErrorHook!.value = passwordErrorValidator;
    userNameErrorHook == null
        ? null
        : userNameErrorHook!.value = userNameErrorValidator;
 }
}

String? validateEmail(String? email) {
  RegExp regex = RegExp(AppConstants.emailPattern);
  if (email == null) {
    return null;
  } else if (email.isEmpty) {
    return tr('field.fillField');
  } else if (!regex.hasMatch(email)) {
    return tr('field.invalidEmail');
  } else {
    return null; // Return null for a valid email
  }
}

String? validatePassword(String? password) {
  if (password == null) {
    return null;
  } else if (password.isEmpty) {
    return tr('field.fillField');
  } else if (password.length < 6) {
    return tr('authValidator.passwordLengthError');
  } else {
    return null;
  }
}

String? validateUsername(String? username) {
  if (username == null) {
    return null;
  } else if (username.isEmpty) {
    return tr('field.fillField');
  } else if (username.length < 3 || username.length > 20) {
    return tr('authValidator.usernameLengthError');
  } else {
    return null; // Return null for a valid username
  }
}
