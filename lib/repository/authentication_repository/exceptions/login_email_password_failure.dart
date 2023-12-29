class LogInWithEmailAndPasswordFailure {
  final String message;

  const LogInWithEmailAndPasswordFailure(
      [this.message = "ผิดพลาด ไม่ทราบสาเหตุ"]);

  factory LogInWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'wrong-password':
        return const LogInWithEmailAndPasswordFailure('รหัสผ่านไม่ถูกต้อง');
      case 'user-not-found':
        return LogInWithEmailAndPasswordFailure('ไม่พบผู้ใช้หรือ อีเมล');
      case 'invalid-email':
        return LogInWithEmailAndPasswordFailure('อีเมลไม่ถูกต้อง');
      case 'User-disabled':
        return LogInWithEmailAndPasswordFailure(
            'โปรดใส่รหัสผ่านที่ มีความปลอดภัย');
      case 'operation-not-allowed':
        return LogInWithEmailAndPasswordFailure(
            'ไม่อนุญาตให้ดำเนินการ โปรดติดต่อ ผู้ดูแล');
      default:
        return LogInWithEmailAndPasswordFailure();
    }
  }

  static fromCode(String code) {}
}
