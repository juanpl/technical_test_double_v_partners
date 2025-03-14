import 'package:flutter/material.dart';
import 'package:technical_test_double_v_partners/config/router/app_router.dart';
import 'package:technical_test_double_v_partners/config/theme/app_theme.dart';
import 'package:technical_test_double_v_partners/features/data/datasources/persistent_data_source.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await PersistentDataSource.init();

  runApp(const MyApp());
} 

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
