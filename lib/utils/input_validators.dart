class InputValidators {
  static isValidEmail(email) {
    if (email == null ||
        email.isEmpty ||
        !RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
        ).hasMatch(email)) {
      return false;
    }

    return true;
  }

  static isValidPassword(password) {
    if (password == null || password.isEmpty) {
      return false;
    }

    return true;
  }

  static isValidFullName(name) {
    if (name == null || name.isEmpty) {
      return false;
    }
    return true;
  }
}
