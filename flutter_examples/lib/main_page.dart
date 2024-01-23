import 'package:flutter/material.dart';
import 'package:flutter_examples/introduction/basic_widgets.dart';
import 'package:flutter_examples/layout/layout_listview.dart';
import 'package:flutter_examples/layout/layout_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            BasicWidgets(),
            SizedBox(height: 20),
            LayoutWidget(),
            SizedBox(height: 20),
            LayoutListView(),
          ],
        ),
      ),
    );
  }
}
