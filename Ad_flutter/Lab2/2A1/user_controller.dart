import 'user_model.dart';

class UserController {
  final List<User> _users = [
    User(name: 'Ayushi', rollNo: 101),
    User(name: 'Nidhi', rollNo: 102),
    User(name: 'Jiya', rollNo: 103),
    User(name: 'Devanshi', rollNo: 104),
    User(name: 'Yashvi', rollNo: 105),
  ];

  List<User> get users => _users;

  void toggleFavorite(int index) {
    _users[index].toggleFavorite(); // calls model method
  }
}
