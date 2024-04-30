import 'package:easy_localization/easy_localization.dart';
import 'package:sellusapp/utils/exceptions/firebase_exceptions/firebase_error_code.dart'; // Import GetX for using tr() function

class FirebaseErrorMessage {
  FirebaseErrorMessage._();

  static Exception fromCode(String code) {
    String errorMessage = _getLocalizedErrorMessage(code);
    return Exception(errorMessage);
  }

  static String _getLocalizedErrorMessage(String code) {
    switch (code) {
      case FirebaseErrorCode.userNotFound:
        return tr('errorMessage.userNotFound');
      case FirebaseErrorCode.emailAlreadyInUse:
        return tr('errorMessage.emailAlreadyInUse');
      case FirebaseErrorCode.userDisabled:
        return tr('errorMessage.userDisabled');
      case FirebaseErrorCode.operationNotAllowed:
        return tr('errorMessage.operationNotAllowed');
      case FirebaseErrorCode.tooManyRequests:
        return tr('errorMessage.tooManyRequests');
      case FirebaseErrorCode.popupClosedByUser:
        return tr('errorMessage.popupClosedByUser');
      case FirebaseErrorCode.invalidEmail:
        return tr('errorMessage.invalidEmail');
      case FirebaseErrorCode.weakPassword:
        return tr('errorMessage.weakPassword');
      case FirebaseErrorCode.invalidCredential:
        return tr('errorMessage.invalidCredential');
      case FirebaseErrorCode.accountExistsWithDifferentCredential:
        return tr('errorMessage.accountExistsWithDifferentCredential');
      case FirebaseErrorCode.invalidLoginCredential:
        return tr('errorMessage.userNotFound');
      case FirebaseErrorCode.userMismatch:
        return tr('errorMessage.userMismatch');
      case FirebaseErrorCode.credentialAlreadyInUse:
        return tr('errorMessage.credentialAlreadyInUse');
      case FirebaseErrorCode.networkRequestFailed:
        return tr('errorMessage.networkRequestFailed');
      case FirebaseErrorCode.providerAlreadyLinked:
        return tr('errorMessage.providerAlreadyLinked');
      case FirebaseErrorCode.invalidVerificationCode:
        return tr('errorMessage.invalidVerificationCode');
      case FirebaseErrorCode.invalidVerificationId:
        return tr('errorMessage.invalidVerificationId');
      case FirebaseErrorCode.captchaCheckFailed:
        return tr('errorMessage.captchaCheckFailed');
      case FirebaseErrorCode.appNotAuthorized:
        return tr('errorMessage.appNotAuthorized');
      case FirebaseErrorCode.webStorageUnsupported:
        return tr('errorMessage.webStorageUnsupported');
      case FirebaseErrorCode.missingVerificationCode:
        return tr('errorMessage.missingVerificationCode');
      case FirebaseErrorCode.quotaExceeded:
        return tr('errorMessage.quotaExceeded');
      case FirebaseErrorCode.webContextUnavailable:
        return tr('errorMessage.webContextUnavailable');
      default:
        return code; // Return the code itself if no specific message is found
    }
  }
}
