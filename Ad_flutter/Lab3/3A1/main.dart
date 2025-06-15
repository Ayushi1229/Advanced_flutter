import 'package:flutter/material.dart';
import 'package:flutter_lab/Ad_flutter/Lab3/3A1/list_view.dart';
import 'list_controller.dart';
import 'list_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final model = UserModel();
    final controller = UserController(model);

    return MaterialApp(
      title: 'Flutter MVC CRUD',
      debugShowCheckedModeBanner: false,
      home: UserView(controller: controller),
    );
  }
}
