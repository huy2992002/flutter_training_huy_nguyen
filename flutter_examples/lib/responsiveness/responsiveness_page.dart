import 'package:flutter/material.dart';

class ResponsivenessPage extends StatelessWidget {
  const ResponsivenessPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: size.width,
          height: size.height * 0.1,
          color: Colors.blueAccent,
          child: const Center(
            child: Text('height 10% height device use MediaQuery'),
          ),
        ),
        const SizedBox(height: 20),
        const Row(
          children: [
            ExpandedWidget(),
            FlexibleWidget(),
          ],
        ),
        const Row(
          children: [
            ExpandedWidget(),
            ExpandedWidget(),
          ],
        ),
        const Row(
          children: [
            FlexibleWidget(),
            FlexibleWidget(),
          ],
        ),
        const Row(
          children: [
            FlexibleWidget(),
            ExpandedWidget(),
          ],
        ),
      ],
    );
  }
}

class ExpandedWidget extends StatelessWidget {
  const ExpandedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.yellowAccent,
          border: Border.all(color: Colors.white),
        ),
        child: const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Expanded',
            style: TextStyle(color: Colors.black, fontSize: 24),
          ),
        ),
      ),
    );
  }
}

class FlexibleWidget extends StatelessWidget {
  const FlexibleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          border: Border.all(color: Colors.white),
        ),
        child: const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Flexible',
            style: TextStyle(color: Colors.black, fontSize: 24),
          ),
        ),
      ),
    );
  }
}
