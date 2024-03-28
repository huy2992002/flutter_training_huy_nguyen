import 'package:flutter/material.dart';
import 'package:flutter_advance_examples/change_color/change_color_bloc/change_color_bloc.dart';
import 'package:flutter_advance_examples/change_color/change_color_event/change_color_event.dart';
import 'package:flutter_advance_examples/counter/counter_bloc/counter_bloc.dart';
import 'package:flutter_advance_examples/home_page.dart';
import 'package:flutter_advance_examples/login_form/login_bloc/login_bloc.dart';
import 'package:flutter_advance_examples/posts/bloc/post_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(),
        ),
        BlocProvider<ChangeColorBloc>(
          create: (context) => ChangeColorBloc()..add(ChangeColorStarted()),
        ),
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
        ),
        BlocProvider<PostBloc>(
          create: (context) => PostBloc(),
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
