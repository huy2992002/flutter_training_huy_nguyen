import 'package:flutter/material.dart';
import 'package:flutter_advance_examples/login_form/login_bloc/login_bloc.dart';
import 'package:flutter_advance_examples/login_form/login_bloc/login_event.dart';
import 'package:flutter_advance_examples/login_form/login_bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: BlocConsumer<LoginBloc, LoginState>(
        buildWhen: (previous, current) => previous.loginStatus != current.loginStatus,
        listenWhen: (previous, current) => previous.loginStatus != current.loginStatus,
        listener: (context, state) {
          if (state.loginStatus == LoginStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Login Failure')),
            );
          }
          if (state.loginStatus == LoginStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Login Success')),
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: ListView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 40),
              children: [
                TextFormField(
                  controller: emailController,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: passwordController,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    context.read<LoginBloc>().add(LoginPressed(
                        email: emailController.text,
                        password: passwordController.text));
                  },
                  child: state.loginStatus == LoginStatus.loading
                      ? const SizedBox.square(
                          dimension: 20,
                          child: CircularProgressIndicator(),
                        )
                      : const Text(
                          'Login',
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
