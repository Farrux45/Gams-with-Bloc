import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'dart:io';

part 'hisobla_page_state.dart';

class HisoblaBloc extends Cubit<HisoblaState> {
  HisoblaBloc() : super(HisoblaInitial());

  int sort = 0;
  bool ontap = false;
  bool start = true;
  Color appBarColor = Colors.orange;
  String appText = "Games for Bloc";
  List random = [];
  List sorts = [];
  List textColor = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];
  List<Color> contColor = [
    Colors.orange,
    Colors.orange,
    Colors.orange,
    Colors.orange,
    Colors.orange,
    Colors.orange,
  ];

  addRandom() {
    random.clear();
    sorts.clear();
    for (var i = 0; i < 6; i++) {
      int vale = Random().nextInt(99);
      sort = 0;
      random.add(vale);
      sorts.add(vale);
      ontap = false;
      start = false;
      appText = "Games";
      appBarColor = Colors.orange;
      textColor[i] = Colors.white;
      contColor[i] = Colors.orange;
      emit(CounterState());
    }
    emit(CounterState());
  }
    addColor() async {
      for (var i = 0; i < 6; i++) {
        Future.delayed(Duration(seconds: 5)).then((value) {
          textColor[i] = Colors.orange;
          emit(TimerState());
        });
      }
    }

    addSort(index) {
      sorts.sort();
      if (sorts[sort] == random[index]) {
        sort += 1;
        contColor[index] = Colors.purple;
        textColor[index] = Colors.white;
        if (sort < 5) {
          appText = "Right";
          appBarColor = Colors.green;
        }
        emit(CounterState());
        print(random);
      } else {
        ontap = true;
        sort += 1;
        appText = "Wrong";
        appBarColor = Colors.red;
        contColor[index] = Colors.red;
        textColor[index] = Colors.white;
        for (var i = 0; i < 6; i++) {
          textColor[i] = Colors.white;
        }
        emit(CounterState());
      }
    }
  }
  

