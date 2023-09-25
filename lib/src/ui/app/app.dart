import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/src/core/app_constant.dart';
import 'package:flutter_application_1/src/core/app_routes.dart';
import 'package:flutter_application_1/src/core/app_theme.dart';
import 'package:flutter_application_1/src/ui/app/theme_provider.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  final String fontFamily = "Montserrat";

  const MyApp({

    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Consumer<ThemeProvider>(
        builder: (context, ThemeProvider provider, child) {
      return MaterialApp(
        title: 'Test Task',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        darkTheme: AppTheme.theme,
        themeMode: provider.themeMode,
        initialRoute: KeyUtil.splash,
        routes: appRoutes,
        // home: DashboardView(),

      );
    });
  }
}
