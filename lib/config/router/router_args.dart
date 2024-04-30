abstract class RouterArgs {}

class ResetPasswordSendArgs extends RouterArgs {
  ResetPasswordSendArgs(this.email);
  final String email;

  @override
  String toString() {
    return 'ResetPassowrdSendArgs{email$email}';
  }
}
