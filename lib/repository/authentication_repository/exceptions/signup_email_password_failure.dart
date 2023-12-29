class SignUpWithEmailAndPasswordFailure {
  final String message;

  const SignUpWithEmailAndPasswordFailure(
      [this.message = "ผิดพลาด ไม่ทราบสาเหตุ"]);

  factory SignUpWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure('โปรดใส่รหัสผ่านที่ มีความปลอดภัย');
      case 'email-already-in-use':
        return SignUpWithEmailAndPasswordFailure('อีเมล นี้ถูกใช้แล้ว');
      case 'invalid-email':
        return SignUpWithEmailAndPasswordFailure('รูปแบบ อีเมลไม่ถูกต้อง');
      case 'User-disabled':
        return SignUpWithEmailAndPasswordFailure('โปรดใส่รหัสผ่านที่ มีความปลอดภัย');
      case 'operation-not-allowed':
        return SignUpWithEmailAndPasswordFailure('ไม่อนุญาตให้ดำเนินการ โปรดติดต่อ ผู้ดูแล');
      default:
        return SignUpWithEmailAndPasswordFailure();
    }
  }
}
