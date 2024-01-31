import 'package:flutter/material.dart';
import 'package:flutter_examples/provider/demo_basic_provider.dart';

class ProviderPage extends StatelessWidget {
  const ProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(width: double.infinity),
        DemoBasicProvider(),
        SizedBox(height: 20.0),
      ],
    );
  }
}
