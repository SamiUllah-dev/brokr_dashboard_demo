import 'dart:async';

import 'package:brokr_dashboard_demo/core/theme/app_theme.dart';
import 'package:brokr_dashboard_demo/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runZonedGuarded(
    () => runApp(
      const ProviderScope(child: MyApp()),
    ),
    (error, stack) {
      print('runZonedGuarded: Caught error: $error');
      print('runZonedGuarded: Caught stack: $stack');
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Brokr Screen Demo',
      theme: AppTheme.light,
      home: const HomeScreen(),
    );
  }
}
