import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'database_model.dart';

class UserController with ChangeNotifier {
  List<User> _users = [];

  List<User> get users => _users;

  Future<void> fetchUsers() async {
    _users = await DBHelper().getUsers();
    notifyListeners();
  }

  Future<void> addUser(User user) async {
    await DBHelper().insertUser(user);
    await fetchUsers();
  }

  Future<void> updateUser(User user) async {
    if (user.uid == null) return;
    await DBHelper().updateUser(user);
    await fetchUsers();
  }

  Future<void> deleteUser(int uid) async {
    await DBHelper().deleteUser(uid);
    await fetchUsers();
  }
}
