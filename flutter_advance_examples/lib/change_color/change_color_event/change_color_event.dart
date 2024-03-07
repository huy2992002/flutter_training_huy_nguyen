import 'package:flutter/material.dart';

abstract class ChangeColorEvent {}

class ChangeColorStarted extends ChangeColorEvent {}

class ChangeColorPressed extends ChangeColorEvent {
  ChangeColorPressed(this.color);

  final Color color;
}
