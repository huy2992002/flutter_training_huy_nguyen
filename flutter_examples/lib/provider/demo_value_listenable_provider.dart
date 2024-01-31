import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter {
  final ValueNotifier<int> valueNotifier = ValueNotifier(0);
}

class DemoValueListenableProvider extends StatelessWidget {
  const DemoValueListenableProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<Counter>(
      create: (context) => Counter(),
      child: Consumer<Counter>(
        builder: (context, value, child) {
          return ValueListenableProvider<int>.value(
            value: value.valueNotifier,
            child: const Column(
              children: [TestWidget(), TestWidget2()],
            ),
          );
        },
      ),
    );
  }
}

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<int>(
      builder: (context, value, child) => Column(
        children: [
          Text(value.toString()),
        ],
      ),
    );
  }
}

class TestWidget2 extends StatelessWidget {
  const TestWidget2({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            final counter = Provider.of<Counter>(context, listen: false);
            counter.valueNotifier.value++;
          },
          child: const Text('Increment'),
        ),
        const SizedBox(width: 8),
        ElevatedButton(
          onPressed: () {
            final counter = Provider.of<Counter>(context, listen: false);
            counter.valueNotifier.value--;
          },
          child: const Text('Decrement'),
        ),
      ],
    );
  }
}
