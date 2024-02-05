import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DemoStreamProvider extends StatelessWidget {
  const DemoStreamProvider({super.key});

  Stream<int> getNumber() async* {
    for (int i = 0; i < 5; i++) {
      await Future.delayed(
        const Duration(seconds: 2),
        () {},
      );

      yield i;
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<int>.value(
      value: getNumber(),
      initialData: 0,
      child: Consumer<int>(
        builder: (context, value, child) {
          return Text('$value');
        },
      ),
    );
  }
}
