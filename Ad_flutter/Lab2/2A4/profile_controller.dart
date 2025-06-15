import 'profile_model.dart';

class ProfileController {
  final ProfileModel model = ProfileModel();

  void updateName(String value) => model.updateName(value);
  void updateEmail(String value) => model.updateEmail(value);
  void updateAge(String value) => model.updateAge(value);
  void updateCity(String value) => model.updateCity(value);
  void updateNumber(String value) => model.updateNumber(value);
  void updateGender(String value) => model.updateGender(value);

  bool isProfileValid() => model.isValid();

  ProfileModel getProfile() => model;
}
