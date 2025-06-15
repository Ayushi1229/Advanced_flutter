import 'package:flutter/material.dart';
import 'database_controller.dart';
import 'database_model.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final UserController _controller = UserController();
  late Future<List<User>> _userList;

  final _nameController = TextEditingController();
  final _cityController = TextEditingController();
  final _genderController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _refreshList();
  }

  void _refreshList() {
    setState(() {
      _userList = _controller.fetchUsers();
    });
  }

  void _showForm({User? user}) {
    if (user != null) {
      _nameController.text = user.name;
      _cityController.text = user.city;
      _genderController.text = user.gender;
    } else {
      _nameController.clear();
      _cityController.clear();
      _genderController.clear();
    }

    showDialog(
      context: context,
      builder: (child) => AlertDialog(
        title: Text(user == null ? 'Add User' : 'Edit User'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _cityController,
              decoration: const InputDecoration(labelText: 'City'),
            ),
            TextField(
              controller: _genderController,
              decoration: const InputDecoration(labelText: 'Gender'),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () async {
              final newUser = User(
                uid: user?.uid,
                name: _nameController.text.trim(),
                city: _cityController.text.trim(),
                gender: _genderController.text.trim(),
              );

              if (user == null) {
                await _controller.addUser(newUser);
              } else {
                await _controller.updateUser(newUser);
              }

              _refreshList();
              Navigator.pop(context);
            },
            child: Text(user == null ? 'Add' : 'Update'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User List (CRUD - MVC)')),
      body: FutureBuilder<List<User>>(
        future: _userList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final users = snapshot.data ?? [];

          if (users.isEmpty) {
            return const Center(child: Text('No users found.'));
          }

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (_, index) {
              final user = users[index];
              return ListTile(
                title: Text(user.name),
                subtitle: Text('${user.city} | ${user.gender}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed: () => _showForm(user: user),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () async {
                        await _controller.deleteUser(user.uid!);
                        _refreshList();
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showForm(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
