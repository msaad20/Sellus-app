import 'package:flutter/material.dart';
import 'package:sellusapp/core/base/base_view_model.dart';

abstract class BaseAuthModel extends BaseViewModel{
    final ValueNotifier<bool> isPasswordVisible = ValueNotifier(false);
  final ValueNotifier<String?> emailErrorText = ValueNotifier(null);
  final ValueNotifier<String?> passwordErrorText = ValueNotifier(null);
  final ValueNotifier<String?> userNameErrorText = ValueNotifier(null);

  ValueNotifier<bool> showErrorContainer = ValueNotifier(false);
  ValueNotifier<String> errorContainerMessage = ValueNotifier('');

  void changeContainerVisibilty(bool newValue) {
    showErrorContainer.value = newValue;
    notifyListeners();
  }

  void changeContainerText(String newValue) {
    errorContainerMessage.value = newValue;
    notifyListeners();
  }

  void changePasswordVisibilty() {
    isPasswordVisible.value = !isPasswordVisible.value;
    notifyListeners();
  }
}