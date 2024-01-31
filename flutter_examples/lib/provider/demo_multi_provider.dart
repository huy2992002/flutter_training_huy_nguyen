import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

class Counter2 with ChangeNotifier {
  int _count = 20;

  int get count => _count;

  void increment() {
    _count = _count + 20;
    notifyListeners();
  }
}

class DemoMultiProvider extends StatelessWidget {
  const DemoMultiProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Counter>(create: (context) => Counter()),
        ChangeNotifierProvider<Counter2>(create: (context) => Counter2()),
      ],
      child: const TestWidget(),
    );
  }
}

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Counter counter = Provider.of<Counter>(context);
    Counter2 counter2 = Provider.of<Counter2>(context);
    return Column(
      children: [
        Text('Counter: ${counter.count}; Counter 2: ${counter2.count}'),
        ElevatedButton(
          onPressed: () {
            counter.increment();
            counter2.increment();
          },
          child: const Text('Increment'),
        ),
      ],
    );
  }
}
