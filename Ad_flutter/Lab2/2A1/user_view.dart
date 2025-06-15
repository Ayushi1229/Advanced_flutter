import 'package:flutter/material.dart';
import 'user_controller.dart';
import 'user_model.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  final UserController _controller = UserController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite || Unfavourite"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: _controller.users.length,
        itemBuilder: (context, index) {
          User user = _controller.users[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 4,
            child: ListTile(
              title: Text(user.name,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("Roll No: ${user.rollNo}"),
              trailing: IconButton(
                onPressed: () {
                  setState(() {
                    _controller.toggleFavorite(index);
                  });
                },
                icon: Icon(
                  user.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: user.isFavorite ? Colors.cyan : Colors.grey,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
