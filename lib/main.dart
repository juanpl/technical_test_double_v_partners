import 'package:flutter/material.dart';
import 'package:technical_test_double_v_partners/core/router/app_router.dart';
import 'package:technical_test_double_v_partners/core/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
    );
  }
}
