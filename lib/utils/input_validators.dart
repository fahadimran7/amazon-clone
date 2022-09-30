class InputValidators {
  static bool isValidEmail(email) {
    if (email == null ||
        email.isEmpty ||
        !RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
        ).hasMatch(email)) {
      return false;
    }

    return true;
  }

  static bool isValidPassword(password) {
    if (password == null || password.isEmpty) {
      return false;
    }

    return true;
  }

  static bool isValidFullName(name) {
    if (name == null || name.isEmpty) {
      return false;
    }
    return true;
  }
}
