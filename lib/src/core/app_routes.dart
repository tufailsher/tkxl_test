import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/core/app_constant.dart';
import 'package:flutter_application_1/src/data/models/dashboard.dart';
import 'package:flutter_application_1/src/ui/dashboard/dashboard_view.dart';
import 'package:flutter_application_1/src/ui/home/home_view.dart';
import 'package:flutter_application_1/src/ui/splash/splash_view.dart';

import 'package:tuple/tuple.dart';

var appRoutes = {
  KeyUtil.dashboard: (context) => DashboardView(),
  KeyUtil.splash: (context) => SplashView(),
  KeyUtil.home: (context) => HomeView(
      tuple2: ModalRoute.of(context)?.settings.arguments
          as Tuple2<Dashboard, double>),

};
