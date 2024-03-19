import 'package:flutter/material.dart';
import 'package:monitoring_system/monitoring_screen.dart';
import 'package:provider/provider.dart';

import 'logic/field_data_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<FieldDataProvider>.value(value: fieldDataProvider)
  ], child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MonitoringScreen(),
    );
  }
}
