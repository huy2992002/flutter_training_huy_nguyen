import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_advance_examples/animation/travel_model.dart';

class TravelDetail extends StatefulWidget {
  const TravelDetail({super.key, required this.travel});

  final TravelModel travel;

  @override
  State<TravelDetail> createState() => _TravelDetailState();
}

class _TravelDetailState extends State<TravelDetail>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _colorAnimation;
  late Animation _sizeAnimation;
  bool isFavorite = false;

  @override
  void initState() {
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    _colorAnimation = ColorTween(begin: Colors.grey, end: Colors.red)
        .animate(_animationController);

    _sizeAnimation = TweenSequence(
      [
        TweenSequenceItem(tween: Tween<double>(begin: 18, end: 22), weight: 50),
        TweenSequenceItem(tween: Tween<double>(begin: 22, end: 18), weight: 50),
      ],
    ).animate(_animationController);
    _animationController.addListener(() {
      setState(() {});
    });

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        isFavorite = false;
      } else {
        isFavorite = true;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: 'tag ${widget.travel.travelName}',
                child: Image.asset(
                  widget.travel.image,
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
                Row(
                  children: [
                    Text(widget.travel.travelName),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        if (isFavorite) {
                          _animationController.reverse();
                        } else {
                          _animationController.forward();
                        }
                      },
                      child: Icon(
                        Icons.favorite_rounded,
                        color: _colorAnimation.value,
                        size: _sizeAnimation.value,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  widget.travel.description,
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
