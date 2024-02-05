import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    if (count > 0) {
      _count--;
    }
    notifyListeners();
  }
}

class DemoChangeNotifierProvider extends StatelessWidget {
  const DemoChangeNotifierProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Counter(),
      child: const TestWidget(),
    );
  }
}

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Counter counter = Provider.of<Counter>(context);
    return Column(
      children: [
        Text('${counter.count}'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                counter.decrement();
                // Provider.of<Counter>(context).decrement();
              },
              child: const Text('Decrement'),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {
                counter.increment();
                // Provider.of<Counter>(context).increment();
              },
              child: const Text('Increment'),
            ),
          ],
        ),
      ],
    );
  }
}
