import 'package:flutter/material.dart';
import 'package:flutter_advance_examples/animation/travel_model.dart';

class TravelDetail extends StatelessWidget {
  const TravelDetail({super.key, required this.travel});

  final TravelModel travel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: 'tag ${travel.travelName}',
                child: Image.asset(
                  travel.image,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 30,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_ios_new),
                ),
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0).copyWith(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(travel.travelName),
                const SizedBox(height: 6),
                Text(
                  travel.description,
                  style: const TextStyle(color: Colors.grey),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
