import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/src/core/app_constant.dart';
import 'package:flutter_application_1/src/ui/app/time_provider.dart';
import 'package:flutter_application_1/src/ui/dashboard/dashboard_provider.dart';
import 'package:get_it/get_it.dart';
import 'dart:async';


class GameProvider<T> extends TimeProvider {
  final _homeViewModel = GetIt.I<DashboardProvider>();

  late List<T> list;
  late int index;
  late double currentScore;
  late double oldScore;
  late T currentState;
  late String result;

  GameProvider( {
    required TickerProvider vsync,
  }) : super(
          vsync: vsync,
         totalTime: 10,
        );

  void showInfoDialog() {
    pauseTimer();
    dialogType = DialogType.info;
    notifyListeners();
  }

  void showExitDialog() {
    pauseTimer();
    dialogType = DialogType.exit;
    notifyListeners();
  }
}
