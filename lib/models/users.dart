class Users {
  int id;
  String email;
  String password;

  Users.empyty() {}
  Users(this.email, this.password);

  String get getEmail {
    return this.email;
  }

  void set setEmail(String email) {
    this.email = email;
  }

  String get getPassword {
    return this.password;
  }

  void set setPassword(String pass) {
    this.password = pass;
  }
}
