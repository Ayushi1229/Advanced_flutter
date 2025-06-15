import 'signup_model.dart';

class SignupController {
  final SignupModel model = SignupModel();

  void updateName(String value) => model.name = value;
  void updateEmail(String value) => model.email = value;
  void updatePassword(String value) => model.password = value;
  void updateConfirmPassword(String value) => model.confirmPassword = value;

  String? validateName(String value) => model.validateName(value);
  String? validateEmail(String value) => model.validateEmail(value);
  String? validatePassword(String value) => model.validatePassword(value);
  String? validateConfirmPassword(String value) =>
      model.validateConfirmPassword(value);

  bool validateForm() => model.isFormValid();
}
