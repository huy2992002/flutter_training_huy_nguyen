import 'package:flutter/material.dart';

abstract class ChangeColorEvent {}

class ChangeColor extends ChangeColorEvent {
  ChangeColor(this.color);

  final Color color;
}
