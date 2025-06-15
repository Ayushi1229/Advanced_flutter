import 'package:flutter_lab/Ad_flutter/Lab3/3A1/list_model.dart';

class UserController{
  final UserModel model;

  UserController(this.model);

  void createUser(String name,int age) => model.addUser(name, age);

  List<dynamic> getUsers() => model.getAllUsers();

  void updateUser(int index, String name, int age) => model.updateUser(index, name, age);

  void deleteUser(int index) => model.deleteUser(index);
}