import 'package:flutter/material.dart';
import 'package:flutter_lab/Ad_flutter/Lab3/3A1/list_controller.dart';
import 'list_model.dart';

class UserView extends StatefulWidget {
  final UserController controller;

  const UserView({super.key, required this.controller});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  int? editingIndex;

  void _addOrUpdateUser() {
    final name = nameController.text;
    final age = int.tryParse(ageController.text) ?? 0;

    if (editingIndex == null) {
      widget.controller.createUser(name, age);
    } else {
      widget.controller.updateUser(editingIndex!, name, age);
      editingIndex = null;
    }

    nameController.clear();
    ageController.clear();
    setState(() {});
  }

  void _editUser(int index) {
    final user = widget.controller.getUsers()[index] as User;
    nameController.text = user.name;
    ageController.text = user.age.toString();
    editingIndex = index;
  }

  void _deleteUser(int index) {
    widget.controller.deleteUser(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final users = widget.controller.getUsers();

    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD MVC Example'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Age'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _addOrUpdateUser,
              child: Text(editingIndex == null ? 'Add User' : 'Update User'),
            ),
            const SizedBox(height: 20),
            const Text('User List:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (_, index) {
                  final user = users[index] as User;
                  return Card(
                    child: ListTile(
                      title: Text(user.name),
                      subtitle: Text('Age: ${user.age}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () => _editUser(index),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _deleteUser(index),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
