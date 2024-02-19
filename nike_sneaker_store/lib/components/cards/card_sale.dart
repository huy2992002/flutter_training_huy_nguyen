import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/resources/ns_style.dart';

class CardSale extends StatelessWidget {
  const CardSale({
    required this.title,
    required this.discount,
    required this.imagePath,
    super.key,
  });

  final String title;
  final int discount;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 26),
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                const SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: NSStyle.h12Medium),
                    Text(
                      '$discount% OFF',
                      style: NSStyle.h36Black.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        
        Positioned(
          top: 0,
          right: 20,
          child: Image.asset(imagePath),
        ),
      ],
    );
  }
}
