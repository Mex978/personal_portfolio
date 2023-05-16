import 'package:flutter/material.dart';
import 'package:personal_portfolio/src/core/controller/app_controller.dart';
import 'package:personal_portfolio/src/core/routes/router_generator.dart';
import 'package:personal_portfolio/src/core/routes/routes.dart';
import 'package:personal_portfolio/src/core/themes/theme.dart';

final appController = AppController();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: appController,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Personal Portfolio',
          themeMode: appController.themeMode,
          initialRoute: Routes.initialRoute,
          onGenerateRoute: RouteGenerator.generateRoute,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
        );
      },
    );
  }
}
