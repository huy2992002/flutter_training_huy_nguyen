import 'package:flutter/material.dart';
import 'package:flutter_advance_examples/animation/animation_page.dart';
import 'package:flutter_advance_examples/counter/counter_page/counter_page.dart';
import 'package:flutter_advance_examples/image_picker/image_picker_page.dart';
import 'package:flutter_advance_examples/login_form/login_ui/login_page.dart';
import 'package:flutter_advance_examples/permission_handler/permisson_handler_page.dart';
import 'package:flutter_advance_examples/posts/pages/posts_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Advance Examples'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: const [
          TextRoute(text: 'Animation', page: AnimationPage()),
          TextRoute(text: 'CounterBloc', page: CounterPage()),
          TextRoute(text: 'Login Form', page: LoginPage()),
          TextRoute(text: 'Posts', page: PostsPage()),
          TextRoute(text: 'Permission handler', page: PermissionHandlerPage()),
          TextRoute(text: 'Image Picker', page: ImagePickerPage()),
        ],
      ),
    );
  }
}

class TextRoute extends StatelessWidget {
  const TextRoute({
    super.key,
    required this.text,
    required this.page,
  });

  final String text;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => page,
        ),
      ),
      child: Text(text),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({
    super.key,
    required this.title,
    required this.message,
  });

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Text(message),
        ),
      ),
    );
  }
}
