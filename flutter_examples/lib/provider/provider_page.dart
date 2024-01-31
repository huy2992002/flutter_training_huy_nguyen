import 'package:flutter/material.dart';
import 'package:flutter_examples/provider/demo_basic_provider.dart';
import 'package:flutter_examples/provider/demo_change_notifier_provider.dart';
import 'package:flutter_examples/provider/demo_multi_provider.dart';
import 'package:flutter_examples/provider/demo_value_listenable_provider.dart';

class ProviderPage extends StatelessWidget {
  const ProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(width: double.infinity),
        DemoBasicProvider(),
        SizedBox(height: 20),
        DemoChangeNotifierProvider(),
        SizedBox(height: 20),
        DemoMultiProvider(),
        SizedBox(height: 20),
        DemoValueListenableProvider(),
      ],
    );
  }
}
