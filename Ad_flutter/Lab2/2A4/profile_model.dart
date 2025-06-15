class ProfileModel {
  String? name;
  String? email;
  String? age;
  String? city;
  String? number;
  String? gender;

  void updateName(String value) => name = value.trim();
  void updateEmail(String value) => email = value.trim();
  void updateAge(String value) => age = value.trim();
  void updateCity(String value) => city = value.trim();
  void updateNumber(String value) => number = value.trim();
  void updateGender(String value) => gender = value.trim();

  bool isValid() {
    return name != null && name!.isNotEmpty &&
        email != null && RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email!) &&
        age != null && int.tryParse(age!) != null &&
        number != null && RegExp(r'^\d{10}$').hasMatch(number!) &&
        city != null && city!.isNotEmpty &&
        gender != null && gender!.isNotEmpty;
  }
}
