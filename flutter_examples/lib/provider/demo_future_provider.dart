import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DemoFutureProvider extends StatelessWidget {
  const DemoFutureProvider({super.key});

  Future<int> getNumber() async {
    await Future.delayed(
      const Duration(seconds: 2),
      () {},
    );
    return 20;
  }

  @override
  Widget build(BuildContext context) {
    return FutureProvider<int>.value(
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
