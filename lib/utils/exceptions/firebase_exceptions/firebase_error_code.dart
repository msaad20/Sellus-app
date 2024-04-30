class FirebaseErrorCode{
  static const String emailAlreadyInUse = 'email-already-in-use';
  static const String userNotFound = 'user-not-found';
  static const String wrongPassword = 'wrong-password';
  static const String popupClosedByUser = 'popup-closed-by-user';
  static const String invalidEmail = 'invalid-email';
  static const String userDisabled = 'user-disabled';
  static const String operationNotAllowed = 'operation-not-allowed';
  static const String tooManyRequests = 'too-many-requests';
  static const String weakPassword = 'weak-password';
  static const String invalidCredential = 'invalid-credential';
  static const String invalidLoginCredential = 'invalid-login-credential';
  static const String accountExistsWithDifferentCredential =
      'account-exists-with-different-credential';
  static const String userMismatch = 'user-mismatch';
  static const String credentialAlreadyInUse = 'credential-already-in-use';
  static const String providerAlreadyLinked = 'provider-already-linked';
  static const String invalidVerificationCode = 'invalid-verification-code';
  static const String invalidVerificationId = 'invalid-verification-id';
  static const String captchaCheckFailed = 'captcha-check-failed';
  static const String appNotAuthorized = 'app-not-authorized';
  static const String webStorageUnsupported = 'web-storage-unsupported';
  static const String missingVerificationCode = 'missing-verification-code';
  static const String quotaExceeded = 'quota-exceeded';
  static const String webContextUnavailable = 'web-context-unavailable';
  static const String networkRequestFailed = 'network-request-failed';
  const FirebaseErrorCode._();
  
}