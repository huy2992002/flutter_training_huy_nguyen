import 'package:flutter/material.dart';
import 'package:flutter_examples/assets_image/assets_image_page.dart';
import 'package:flutter_examples/detail_page.dart';
import 'package:flutter_examples/interactivity/interactivity_page.dart';
import 'package:flutter_examples/introduction/introduction_page.dart';
import 'package:flutter_examples/layout/layout_page.dart';
import 'package:flutter_examples/localization/localization_page.dart';
import 'package:flutter_examples/responsiveness/responsiveness_page.dart';
import 'package:flutter_examples/state_management/state_management_page.dart';
import 'package:flutter_examples/theming/theme_page.dart';

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
              Title(text: '2. Layout', pagePush: LayoutPage()),
              Title(text: '3. Assets Images', pagePush: AssetsImagesPage()),
              Title(text: '4. Interactivity', pagePush: InteractivityPage()),
              Title(text: '5. Localization', pagePush: LocalizationPage()),
              Title(text: '6. Responsiveness', pagePush: ResponsivenessPage()),
              Title(text: '7. Theming', pagePush: ThemePage()),
              Title(text: '8. State management', pagePush: StateManagementPage()),
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: GestureDetector(
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
      ),
    );
  }
}
