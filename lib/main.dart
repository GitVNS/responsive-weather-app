import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_weather/presentation/pages/dashboard.dart';
import 'package:open_weather/core/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = AppTheme.darkTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
            systemNavigationBarColor: themeData.scaffoldBackgroundColor),
        child: const Dashboard(),
      ),
    );
  }
}
