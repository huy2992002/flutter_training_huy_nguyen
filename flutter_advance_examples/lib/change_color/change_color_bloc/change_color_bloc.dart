import 'package:flutter/material.dart';
import 'package:flutter_advance_examples/change_color/change_color_event/change_color_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeColorBloc extends Bloc<ChangeColorEvent, Color> {
  ChangeColorBloc() : super(Colors.red){
    on<ChangeColorStarted>(_initColor);
    on<ChangeColorPressed>((event, emit) => emit(event.color));
  }

  Future<void> _initColor(ChangeColorStarted event,Emitter<Color> emit) async {
    await Future.delayed(const Duration(milliseconds: 2600));
    emit(Colors.blue);
  }
}
