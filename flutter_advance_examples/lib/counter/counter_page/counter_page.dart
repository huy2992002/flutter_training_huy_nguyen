import 'package:flutter/material.dart';
import 'package:flutter_advance_examples/change_color/change_color_page/change_color_page.dart';
import 'package:flutter_advance_examples/counter/counter_bloc/counter_bloc.dart';
import 'package:flutter_advance_examples/counter/counter_event/counter_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Bloc Page'),
        centerTitle: true,
      ),
      body: BlocBuilder<CounterBloc, int>(
        buildWhen: (previous, current) {
          return previous != current;
        },
        builder: (context, state) {
          return Column(
            children: [
              Text('$state'),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(CounterDecrement());
                    },
                    child: const Text('Decrement'),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(CounterIncrement());
                    },
                    child: const Text('Increment'),
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChangeColorPage(),
                        ));
                  },
                  child: const Text('Change Color'))
            ],
          );
        },
      ),
    );
  }
}
