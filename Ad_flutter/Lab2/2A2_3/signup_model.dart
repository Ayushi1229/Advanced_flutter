class SignupModel {
  String? name;
  String? email;
  String? password;
  String? confirmPassword;

  String? validateName(String? value) {
    if (value == null || value.isEmpty) return 'Name is required';
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Email is required';
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Password is required';
    if (value.length < 6) return 'Password must be at least 6 characters';
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value != password) return 'Passwords do not match';
    return null;
  }

  bool isFormValid() {
    return validateName(name) == null &&
        validateEmail(email) == null &&
        validatePassword(password) == null &&
        validateConfirmPassword(confirmPassword) == null;
  }
}
