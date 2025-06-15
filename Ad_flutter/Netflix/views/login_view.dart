import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/login_controller.dart';
import '../models/app_state_model.dart';
import '../models/login_model.dart';

class LoginView extends StatelessWidget {
  final LoginController controller;

  const LoginView({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background Image (netflix.png)
          Positioned.fill(
            child: Image.asset(
              'assets/images/netflix.png',
              fit: BoxFit.cover,
              colorBlendMode: BlendMode.darken,
              color: Colors.black.withOpacity(0.7),
            ),
          ),

          // Header - NETFLIX text
          const Positioned(
            top: 40,
            left: 20,
            child: Text(
              'NETFLIX',
              style: TextStyle(
                color: Colors.red,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Login Form Container
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Consumer<LoginModel>(
                builder: (context, loginModel, child) {
                  return Container(
                    padding: const EdgeInsets.all(32.0),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          onChanged: controller.model.updateEmailOrPhone, // Call model method directly
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromRGBO(62, 59, 59, 0.9),
                            hintText: 'Email or phone number',
                            hintStyle: const TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          onChanged: controller.model.updatePassword, // Call model method directly
                          obscureText: true,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromRGBO(62, 59, 59, 0.9),
                            hintText: 'Password',
                            hintStyle: const TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: loginModel.isLoading
                                ? null // Disable button while loading
                                : () async {
                              final appStateModel = Provider.of<AppStateModel>(context, listen: false);
                              bool success = await loginModel.performLogin();
                              if (success) {
                                appStateModel.setAuthState(AppAuthState.loggedIn);
                                Navigator.pushReplacementNamed(context, '/whoswatching');
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(loginModel.errorMessage ?? 'Login failed')),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: loginModel.isLoading
                                ? const CircularProgressIndicator(color: Colors.white)
                                : const Text(
                              'Sign In',
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: loginModel.rememberMe,
                                  onChanged: (bool? newValue) {
                                    loginModel.updateRememberMe(newValue ?? false); // Safely convert to non-nullable bool
                                  },
                                  activeColor: Colors.grey,
                                  checkColor: Colors.black,
                                ),
                                const Text(
                                  'Remember Me',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            TextButton(
                              onPressed: () {
                                // Handle Need Help?
                              },
                              child: const Text(
                                'Need Help?',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        Row(
                          children: [
                            const Text(
                              'New to Netflix?',
                              style: TextStyle(color: Colors.grey),
                            ),
                            TextButton(
                              onPressed: () {
                                // Handle Sign Up Now
                              },
                              child: const Text(
                                'Sign Up Now',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'This page is protected by Google reCAPTCHA to ensure you\'re not a bot.',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: () {
                              // Handle Learn More.
                            },
                            child: const Text(
                              'Learn More.',
                              style: TextStyle(color: Colors.blue, fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),

          // Footer (simplified for Flutter)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.black.withOpacity(0.8),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Questions? Call 000-800-919-1694',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(onPressed: () {}, child: const Text('FAQ', style: TextStyle(color: Colors.grey))),
                      TextButton(onPressed: () {}, child: const Text('Help Center', style: TextStyle(color: Colors.grey))),
                      TextButton(onPressed: () {}, child: const Text('Terms Of Use', style: TextStyle(color: Colors.grey))),
                      TextButton(onPressed: () {}, child: const Text('Privacy', style: TextStyle(color: Colors.grey))),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(onPressed: () {}, child: const Text('Cookie Preferences', style: TextStyle(color: Colors.grey))),
                      TextButton(onPressed: () {}, child: const Text('Corporate Information', style: TextStyle(color: Colors.grey))),
                      // Spacer to align with other links
                      SizedBox(width: MediaQuery.of(context).size.width / 8),
                    ],
                  ),
                  const SizedBox(height: 20),
                  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: 'English', // This would ideally be managed by a state in the model
                      icon: const Icon(Icons.language, color: Colors.grey),
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                      dropdownColor: Colors.black87,
                      onChanged: (String? newValue) {
                        // Handle language change
                      },
                      items: <String>['English', 'Hindi', 'Spanish']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}