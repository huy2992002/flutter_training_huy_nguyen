import 'package:flutter/material.dart';
import 'package:flutter_examples/layout/layout_grid_view.dart';
import 'package:flutter_examples/layout/layout_list_view.dart';
import 'package:flutter_examples/layout/layout_widget.dart';

class LayoutPage extends StatelessWidget {
  const LayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        LayoutWidget(),
        SizedBox(height: 20),
        LayoutListView(),
        SizedBox(height: 20),
        LayoutGridView(),
      ],
    );
  }
}
