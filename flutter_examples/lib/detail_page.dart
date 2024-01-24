import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({required this.child, required this.title, super.key});
  final String title;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(color: Colors.red, fontSize: 26),
        ),
        centerTitle: true,
        backgroundColor: Colors.yellow,
      ),
      body: SingleChildScrollView(child: child),
    );
  }
}
