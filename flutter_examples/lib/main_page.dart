import 'package:flutter/material.dart';
import 'package:flutter_examples/detail_page.dart';
import 'package:flutter_examples/introduction/introduction_page.dart';
import 'package:flutter_examples/layout/layout_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Examples',
          style: TextStyle(color: Colors.red, fontSize: 26),
        ),
        centerTitle: true,
        backgroundColor: Colors.yellow,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Title(text: '1. Introduction', pagePush: IntroductionPage()),
              SizedBox(height: 20),
              Title(text: '2. Layout', pagePush: LayoutPage()),
            ],
          ),
        ),
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    required this.text,
    required this.pagePush,
    super.key,
  });

  final String text;
  final Widget pagePush;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<dynamic>(
            builder: (context) => DetailPage(
              title: text,
              child: pagePush,
            ),
          ),
        );
      },
      child: Text(
        text,
        style: const TextStyle(color: Colors.red, fontSize: 25),
      ),
    );
  }
}