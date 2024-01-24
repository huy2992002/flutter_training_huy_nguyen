import 'package:flutter/material.dart';
import 'package:flutter_examples/interactivity/validator.dart';

class InteractivityPage extends StatelessWidget {
  const InteractivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Column(
        children: [
          // Gesture (onTap , longPress, verticalDrag,....)
          // Input (TextField)

          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              hintText: 'Email',
              border: OutlineInputBorder(),
            ),
            validator: Validator.validatorEmail,
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          const SizedBox(height: 40),
          TextFormField(
            controller: passwordController,
            decoration: const InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
            validator: Validator.validatorPassword,
            obscureText: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              if (!formKey.currentState!.validate()) return;
              final SnackBar snackBar;
              if (emailController.text == userLogin.email &&
                  passwordController.text == userLogin.password) {
                snackBar = const SnackBar(
                  content: Text('Login Success'),
                );
              } else {
                snackBar = const SnackBar(
                  content: Text('Login Failed'),
                );
              }
                ScaffoldMessenger.of(context).showSnackBar(snackBar);

            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}

class UserModel {
  UserModel(this.email, this.password);

  String email;
  String password;
}

UserModel userLogin = UserModel('huy@gmail.com', '123456');
