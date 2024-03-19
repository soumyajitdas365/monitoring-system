import 'dart:async';

import 'package:flutter/material.dart';
import 'package:monitoring_system/repository/api_functions.dart';

class MonitoringScreen extends StatefulWidget {
  const MonitoringScreen({super.key});

  @override
  State<MonitoringScreen> createState() => _MonitoringScreenState();
}

class _MonitoringScreenState extends State<MonitoringScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // Timer.periodic(Duration(seconds: 5), (timer) async {
      //   await getFieldData();
      // });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Hello World!'),
      ),
    );
  }
}
