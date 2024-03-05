import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_advance_examples/animation/travel_detail.dart';
import 'package:flutter_advance_examples/animation/travel_model.dart';

class AnimationPage extends StatelessWidget {
  const AnimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: travels.length,
            itemBuilder: (context, index) {
              final travel = travels[index];
              return TravelItem(
                travel: travel,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TravelDetail(travel: travel),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 30),
          )
        ],
      ),
    );
  }
}

class TravelItem extends StatelessWidget {
  const TravelItem({
    super.key,
    required this.travel,
    this.onTap,
  });

  final TravelModel travel;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Hero(
              tag: 'tag ${travel.travelName}',
              child: Image.asset(
                travel.image,
                width: 90,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 20),
            Text(travel.travelName),
          ],
        ),
      ),
    );
  }
}
