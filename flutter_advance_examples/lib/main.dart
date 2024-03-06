import 'package:flutter/material.dart';
import 'package:flutter_advance_examples/change_color/change_color_bloc/change_color_bloc.dart';
import 'package:flutter_advance_examples/counter/counter_bloc/counter_bloc.dart';
import 'package:flutter_advance_examples/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<CounterBloc>(
          create: (context) => CounterBloc(),
        ),
        RepositoryProvider<ChangeColorBloc>(
          create: (context) => ChangeColorBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
