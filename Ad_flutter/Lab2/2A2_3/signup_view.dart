import 'package:flutter/material.dart';
import 'package:flutter_lab/Ad_flutter/Lab2/2A2_3/signup_controller.dart';
import 'package:flutter_lab/Lab4/lab4_1.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _formKey = GlobalKey<FormState>();
  final SignupController _controller = SignupController();
  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignUpView'),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Name'),
                  onChanged: _controller.updateName,
                  validator: (value)=>
                            _controller.validateName(value ?? ''),
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Email'),
                  onChanged: _controller.updateEmail,
                  validator: (value)=>
                              _controller.validateEmail(value ?? ''),
                ),
                TextFormField(
                  obscureText: !_passwordVisible, // Hide password when _passwordVisible is false
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                  onChanged: _controller.updatePassword,
                  validator: (value) => _controller.validatePassword(value ?? ''),
                ),

                TextFormField(
                  obscureText: !_passwordVisible,
                  decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _passwordVisible ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: (){
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      )
                  ),
                  onChanged: _controller.updateConfirmPassword,
                  validator: (value) => _controller.validateConfirmPassword(value ?? ''),
                ),
                const SizedBox(height: 20,),
                ElevatedButton(
                    onPressed: (){
                      if(_formKey.currentState!.validate()){
                        final valid = _controller.validateForm();
                        if(valid){
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("SignUp Successfully Done!"))
                          );
                        }
                      }
                    }, child: const Text('Signup')
                )
              ],
          )
        )
      ),
    );
  }
}
