import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class User {
  User(this.name, this.age);

  String name;
  int age;
}

class DemoBasicProvider extends StatelessWidget {
  const DemoBasicProvider({super.key});

  @override
  Widget build(BuildContext context) {
    User user = User('Huy', 21);
    return Provider<User>.value(
      value: user,
      child: const Column(
        children: [
          ConsumerWidget(),
          WithoutConsumerWidget(),
        ],
      ),
    );
  }
}

class ConsumerWidget extends StatelessWidget {
  const ConsumerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<User>(
      builder: (context, value, child) => Text(value.name),
    );
  }
}

class WithoutConsumerWidget extends StatelessWidget {
  const WithoutConsumerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Text(user.name);
  }
}
