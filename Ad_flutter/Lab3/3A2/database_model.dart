class User {
  int? uid;
  String name;
  String city ;
  String gender;

  User({
    this.uid,
    required this.name,
    required this.city,
    required this.gender,
  });

  User.fromMap(Map<String, dynamic> map)
      :
        // uid = map['UID'],
        name = map['NAME'],
        city = map['CITY'],
        gender = map['GENDER'];

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'NAME': name,
      'CITY': city,
      'GENDER': gender,
    };
    if (uid != null) {
      map['UID'] = uid;
    }
    return map;
  }
}