class Validations {
  static String? validateEmail(String? value) {
    var passNonNullValue = value ?? "";
    RegExp reg = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (passNonNullValue.isEmpty) {
      return 'Please enter your email';
    } else if (!passNonNullValue.contains("@")) {
      return ("Email should contains @");
    } else if (!reg.hasMatch(passNonNullValue)) {
      return ("Email is not valid");
    }
    return null;
  }

  static String? passwordValidation(String? value) {
    var passNonNullValue = value ?? "";
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length <= 6) {
      return ("Password must be more than 6 characters");
    } else if (!regex.hasMatch(passNonNullValue)) {
      return ("Password should contain upper,lower,digit and special character");
    }
    return null;
  }

  static String? requireField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }

    return null;
  }
}
