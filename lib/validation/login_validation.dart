class LoginValidationMixin {
  String validateEmail(String mail) {
    if (mail.length < 3) {
      return "Lütfen en az 3 karakter giriniz";
    }
  }

  String validatePassword(String pass) {
    if (pass.length < 3) {
      return "Lütfen en az 3 karakter giriniz";
    }
  }
}
