import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'profile_controller.dart';
import 'profile_view.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({super.key});

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final ProfileController _controller = ProfileController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Enter Profile Details')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                onChanged: _controller.updateName,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Enter name';
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                onChanged: _controller.updateEmail,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Enter email';
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) return 'Invalid email';
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Age'),
                onChanged: _controller.updateAge,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Enter age';
                  if (int.tryParse(value) == null) return 'Age must be a number';
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'City'),
                onChanged: _controller.updateCity,
                validator: (value) =>
                value == null || value.isEmpty ? 'Enter city' : null,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                maxLength: 10,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                ],
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  counterText: '', // hides character counter below
                ),
                onChanged: _controller.updateNumber,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Enter phone number';
                  if (!RegExp(r'^\d{10}$').hasMatch(value)) return 'Must be exactly 10 digits';
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Gender'),
                onChanged: _controller.updateGender,
                validator: (value) =>
                value == null || value.isEmpty ? 'Enter Gender' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProfileCard(profile: _controller.getProfile()),
                      ),
                    );
                  }
                },
                child: const Text('Show Profile Card'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
