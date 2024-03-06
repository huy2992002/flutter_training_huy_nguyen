import 'package:flutter/material.dart';
import 'package:flutter_advance_examples/change_color/change_color_bloc/change_color_bloc.dart';
import 'package:flutter_advance_examples/change_color/change_color_event/change_color_event.dart';
import 'package:flutter_advance_examples/counter/counter_bloc/counter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeColorPage extends StatelessWidget {
  const ChangeColorPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      Colors.red,
      Colors.blue,
      Colors.yellow,
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Color Page'),
        centerTitle: true,
      ),
      body: BlocBuilder<ChangeColorBloc, Color>(
        builder: (context, state) {
          return Column(
            children: [
              Container(
                width: 80,
                height: 80,
                color: state,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  colors.length,
                  (index) => GestureDetector(
                    onTap: () {
                      context
                          .read<ChangeColorBloc>()
                          .add(ChangeColor(colors[index]));
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      color: colors[index],
                    ),
                  ),
                ),
              ),
              Text(
                '${context.read<CounterBloc>().state}'
              ),
            ],
          );
        },
      ),
    );
  }
}
